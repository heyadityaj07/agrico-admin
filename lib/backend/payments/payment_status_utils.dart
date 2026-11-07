import '/backend/schema/payments_record.dart';
import '/backend/schema/structs/index.dart';

/// Display-ready row for one producer transfer (expected vs actual).
class ProducerTransferRow {
  const ProducerTransferRow({
    required this.vendorId,
    required this.hasExpected,
    this.expectedAmount,
    this.expectedAmountCents,
    this.actualAmount,
    this.transferId = '',
    required this.transferSucceeded,
    required this.transferFailed,
    this.failureDescription = '',
    this.ambiguous = false,
    this.attempt,
  });

  final String vendorId;
  final bool hasExpected;
  final double? expectedAmount;
  final int? expectedAmountCents;
  final double? actualAmount;
  final String transferId;
  final bool transferSucceeded;
  final bool transferFailed;
  final String failureDescription;
  final bool ambiguous;
  final int? attempt;

  String get statusLabel => transferSucceeded
      ? 'Success'
      : transferFailed
          ? (ambiguous ? 'Failed (outcome unresolved)' : 'Failed')
          : 'Unknown';
}

/// Latest attempt entry for a vendor; the ledger appends one entry per
/// attempt, so the last entry for a vendor is the recorded outcome.
VendorTransferStruct? latestVendorOutcome(
  List<VendorTransferStruct> details,
  String vendorId,
) {
  VendorTransferStruct? latest;
  for (final entry in details) {
    if (entry.vendorId == vendorId) latest = entry;
  }
  return latest;
}

/// Builds one row per producer involved in the payment. Rows prefer the
/// expected allocation (P1-06 `expectedVendorDetails`) and fall back to the
/// recorded `vendorDetails` entries for legacy records. Legacy records have
/// no expected allocation — `hasExpected` stays false there.
List<ProducerTransferRow> buildProducerTransferRows({
  required List<ExpectedVendorDetailStruct> expectedVendorDetails,
  required List<VendorTransferStruct> vendorDetails,
}) {
  final orderedVendorIds = <String>[];
  void addId(String? vendorId) {
    if (vendorId != null &&
        vendorId.isNotEmpty &&
        !orderedVendorIds.contains(vendorId)) {
      orderedVendorIds.add(vendorId);
    }
  }

  for (final expected in expectedVendorDetails) {
    addId(expected.vendorId);
  }
  for (final detail in vendorDetails) {
    addId(detail.vendorId);
  }

  return orderedVendorIds.map((vendorId) {
    ExpectedVendorDetailStruct? expected;
    for (final candidate in expectedVendorDetails) {
      if (candidate.vendorId == vendorId) expected = candidate;
    }

    final outcome = latestVendorOutcome(vendorDetails, vendorId);
    final transferSucceeded = outcome != null && outcome.status == 'success';
    final transferFailed = outcome != null && outcome.status == 'failed';

    double? actualAmount;
    if (outcome != null) {
      if (outcome.hasAmount() && outcome.amount > 0) {
        actualAmount = outcome.amount;
      } else if (outcome.hasAmountCents() && outcome.amountCents > 0) {
        actualAmount = outcome.amountCents / 100;
      }
    }

    return ProducerTransferRow(
      vendorId: vendorId,
      hasExpected: expected != null,
      expectedAmount: expected?.expectedAmount,
      expectedAmountCents: expected?.expectedAmountCents,
      actualAmount: actualAmount,
      transferId: outcome?.transferId ?? '',
      transferSucceeded: transferSucceeded,
      transferFailed: transferFailed,
      failureDescription: outcome?.failureDescription ?? '',
      ambiguous: outcome?.ambiguous ?? false,
      attempt: outcome != null && outcome.hasAttempt() ? outcome.attempt : null,
    );
  }).toList();
}

/// Picks the paid ledger record for an order (records only exist for
/// processed PaymentIntents). Multiple records can co-exist for one order
/// (legacy random-ID `.add()` plus the deterministic P1-05 record); the
/// most recently created one wins.
PaymentsRecord? primaryPaymentRecord(List<PaymentsRecord> records) {
  PaymentsRecord? primary;
  for (final record in records) {
    if (record.status != 'paid') continue;
    if (primary == null) {
      primary = record;
      continue;
    }
    final currentCreated = primary.hasCreatedAt() ? primary.createdAt : null;
    final candidateCreated = record.hasCreatedAt() ? record.createdAt : null;
    if (candidateCreated == null) continue;
    if (currentCreated == null || candidateCreated.isAfter(currentCreated)) {
      primary = record;
    }
  }
  return primary;
}

/// Payment state for display. Never derived from `order.order_status`.
///  - `Paid` — a paid payments-ledger record exists.
///  - `Paid — deposit (partial)` — paid variable-weight order whose final
///    balance remains pending (only the 30% deposit was collected).
///  - `Unresolved` — the order recorded an initiated PaymentIntent but no
///    paid ledger record exists (ambiguous checkout outcome). Confirmed
///    failures are indistinguishable from unresolved attempts because the
///    checkout deletes failed orders and no failure webhook writes the
///    ledger — this is an existing-data limitation, not an inference.
///  - `Pending` — no payment record and no initiated intent (not attempted).
String paymentStatusLabel({
  required bool hasPaidLedgerRecord,
  String orderPaymentState = '',
  bool isVariableWeightOrder = false,
  String balancePaymentStatus = '',
}) {
  if (!hasPaidLedgerRecord) {
    if (orderPaymentState == 'initiated') return 'Unresolved';
    return 'Pending';
  }
  // Accepted admin display behavior (P1-09 review): a paid variable-weight
  // order whose recorded balance is still outstanding — not yet requested
  // ('pending'), unset (''), or requested but outstanding ('payment_requested')
  // — continues to display the deposit-partial label. No separate
  // balance-requested label exists, and a settled balance ('paid') shows Paid.
  if (isVariableWeightOrder &&
      (balancePaymentStatus == 'pending' ||
          balancePaymentStatus.isEmpty ||
          balancePaymentStatus == 'payment_requested')) {
    return 'Paid — deposit (partial)';
  }
  return 'Paid';
}

/// Producer-transfer status for display, from the P1-05 `transferStatus`
/// ledger field. Legacy records without it are classified from their
/// per-vendor outcomes, because the pre-P1-05 writer always marked processed
/// records as complete even when transfers failed.
String transferStatusLabel({
  required String transferStatus,
  required List<VendorTransferStruct> vendorDetails,
  required bool transfersProcessed,
}) {
  if (transferStatus.isNotEmpty) {
    switch (transferStatus) {
      case 'completed':
        return 'Completed';
      case 'partial':
        return 'Partial';
      case 'failed':
        return 'Failed';
      case 'pending':
        return 'Pending';
      default:
        return transferStatus;
    }
  }

  if (vendorDetails.isEmpty) {
    return transfersProcessed ? 'Completed' : '';
  }

  final rows = buildProducerTransferRows(
    expectedVendorDetails: const [],
    vendorDetails: vendorDetails,
  );
  final succeeded = rows.where((row) => row.transferSucceeded).length;
  if (succeeded == 0) return 'Failed';
  if (succeeded == rows.length) return 'Completed';
  return 'Partial';
}

/// Upper-cased currency code for a recorded ledger currency (`usd`/`eur`);
/// empty when the field is absent (legacy records) or malformed.
String currencyCodeDisplay(String? currencyCode) {
  final code = currencyCode?.trim() ?? '';
  if (code.isEmpty || code.length < 2 || code.length > 3) return '';
  return code.toUpperCase();
}

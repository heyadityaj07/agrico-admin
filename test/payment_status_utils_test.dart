import 'package:flutter_test/flutter_test.dart';

import 'package:agricoo_admin/backend/payments/payment_status_utils.dart';
import 'package:agricoo_admin/backend/schema/structs/index.dart';

void main() {
  group('buildProducerTransferRows', () {
    test('uses the latest vendorDetails entry per vendor as the outcome', () {
      final rows = buildProducerTransferRows(
        expectedVendorDetails: [
          createExpectedVendorDetailStruct(
            vendorId: 'vendor-1',
            expectedAmount: 10.0,
            expectedAmountCents: 1000,
          ),
        ],
        vendorDetails: <VendorTransferStruct>[
          createVendorTransferStruct(
            vendorId: 'vendor-1',
            status: 'failed',
            error: 'Stripe error',
            attempt: 1,
          ),
          createVendorTransferStruct(
            vendorId: 'vendor-1',
            status: 'success',
            transferId: 'tr_123',
            amount: 9.98,
            attempt: 2,
          ),
        ],
      );

      expect(rows.length, 1);
      expect(rows.first.vendorId, 'vendor-1');
      expect(rows.first.hasExpected, true);
      expect(rows.first.expectedAmount, 10.0);
      expect(rows.first.transferSucceeded, true);
      expect(rows.first.transferId, 'tr_123');
      expect(rows.first.actualAmount, 9.98);
      expect(rows.first.attempt, 2);
    });

    test('partial failure keeps a failed vendor with its reason', () {
      final rows = buildProducerTransferRows(
        expectedVendorDetails: [
          createExpectedVendorDetailStruct(vendorId: 'vendor-a', expectedAmount: 5.0),
          createExpectedVendorDetailStruct(vendorId: 'vendor-b', expectedAmount: 5.0),
        ],
        vendorDetails: <VendorTransferStruct>[
          createVendorTransferStruct(
            vendorId: 'vendor-a',
            status: 'success',
            transferId: 'tr_a',
            amount: 4.95,
          ),
          createVendorTransferStruct(
            vendorId: 'vendor-b',
            status: 'failed',
            reason: 'No connect account',
          ),
        ],
      );

      final successRow = rows.singleWhere((r) => r.vendorId == 'vendor-a');
      final failedRow = rows.singleWhere((r) => r.vendorId == 'vendor-b');
      expect(successRow.transferSucceeded, true);
      expect(successRow.actualAmount, 4.95);
      expect(failedRow.transferFailed, true);
      expect(failedRow.failureDescription, 'No connect account');
      expect(failedRow.ambiguous, false);
      expect(failedRow.statusLabel, 'Failed');
    });

    test('ambiguous failure is reported as unresolved, not settled', () {
      final rows = buildProducerTransferRows(
        expectedVendorDetails: [
          createExpectedVendorDetailStruct(
            vendorId: 'vendor-c',
            expectedAmount: 3.0,
            expectedAmountCents: 300,
          ),
        ],
        vendorDetails: <VendorTransferStruct>[
          createVendorTransferStruct(
            vendorId: 'vendor-c',
            status: 'failed',
            error: 'Connection error',
            ambiguous: true,
            attempt: 1,
          ),
        ],
      );

      final row = rows.first;
      expect(row.transferSucceeded, false);
      expect(row.transferFailed, true);
      expect(row.ambiguous, true);
      expect(row.statusLabel, 'Failed (outcome unresolved)');
    });

    test('legacy record without expected allocation still produces vendor rows',
        () {
      final rows = buildProducerTransferRows(
        expectedVendorDetails: const [],
        vendorDetails: <VendorTransferStruct>[
          createVendorTransferStruct(
            vendorId: 'legacy-vendor',
            status: 'success',
            transferId: 'tr_legacy',
            amount: 7.25,
          ),
        ],
      );

      expect(rows.length, 1);
      expect(rows.first.vendorId, 'legacy-vendor');
      expect(rows.first.hasExpected, false);
      expect(rows.first.transferId, 'tr_legacy');
      expect(rows.first.actualAmount, 7.25);
    });
  });

  group('paymentStatusLabel', () {
    test('paid fixed-weight order shows Paid', () {
      expect(
        paymentStatusLabel(hasPaidLedgerRecord: true),
        'Paid',
      );
    });

    test('paid variable-weight order with pending balance shows partial', () {
      expect(
        paymentStatusLabel(
          hasPaidLedgerRecord: true,
          isVariableWeightOrder: true,
          balancePaymentStatus: 'pending',
        ),
        'Paid — deposit (partial)',
      );
      expect(
        paymentStatusLabel(
          hasPaidLedgerRecord: true,
          isVariableWeightOrder: true,
        ),
        'Paid — deposit (partial)',
      );
    });

    // P1-09 review — accepted admin display behavior: an outstanding balance
    // payment request keeps the deposit-partial label. No separate
    // balance-requested status label exists.
    test('payment_requested balance keeps the deposit-partial label', () {
      expect(
        paymentStatusLabel(
          hasPaidLedgerRecord: true,
          isVariableWeightOrder: true,
          balancePaymentStatus: 'payment_requested',
        ),
        'Paid — deposit (partial)',
      );
    });

    test('variable-weight order with settled balance shows Paid', () {
      expect(
        paymentStatusLabel(
          hasPaidLedgerRecord: true,
          isVariableWeightOrder: true,
          balancePaymentStatus: 'paid',
        ),
        'Paid',
      );
    });

    test('initiated order without ledger record shows Unresolved', () {
      expect(
        paymentStatusLabel(
          hasPaidLedgerRecord: false,
          orderPaymentState: 'initiated',
        ),
        'Unresolved',
      );
    });

    test('order never paid shows Pending, independent of order_status', () {
      expect(
        paymentStatusLabel(
          hasPaidLedgerRecord: false,
          orderPaymentState: '',
        ),
        'Pending',
      );
    });
  });

  group('transferStatusLabel', () {
    test('maps ledger transferStatus values', () {
      expect(
        transferStatusLabel(
          transferStatus: 'completed',
          vendorDetails: const [],
          transfersProcessed: false,
        ),
        'Completed',
      );
      expect(
        transferStatusLabel(
          transferStatus: 'partial',
          vendorDetails: const [],
          transfersProcessed: false,
        ),
        'Partial',
      );
      expect(
        transferStatusLabel(
          transferStatus: 'failed',
          vendorDetails: const [],
          transfersProcessed: false,
        ),
        'Failed',
      );
      expect(
        transferStatusLabel(
          transferStatus: 'pending',
          vendorDetails: const [],
          transfersProcessed: false,
        ),
        'Pending',
      );
    });

    test('legacy record without transferStatus classifies per vendor', () {
      expect(
        transferStatusLabel(
          transferStatus: '',
          vendorDetails: <VendorTransferStruct>[
            createVendorTransferStruct(
                vendorId: 'v', status: 'success', amount: 5.0),
          ],
          transfersProcessed: true,
        ),
        'Completed',
      );
    });

    test('legacy masked partial failure surfaces as Partial', () {
      expect(
        transferStatusLabel(
          transferStatus: '',
          vendorDetails: <VendorTransferStruct>[
            createVendorTransferStruct(
                vendorId: 'v1', status: 'success', amount: 5.0),
            createVendorTransferStruct(
                vendorId: 'v2', status: 'failed', error: 'boom'),
          ],
          transfersProcessed: true,
        ),
        'Partial',
      );
    });

    test('legacy all-failed masked record surfaces as Failed', () {
      expect(
        transferStatusLabel(
          transferStatus: '',
          vendorDetails: <VendorTransferStruct>[
            createVendorTransferStruct(vendorId: 'v1', status: 'failed',
                reason: 'No connect account'),
          ],
          transfersProcessed: true,
        ),
        'Failed',
      );
    });
  });

  group('currencyCodeDisplay', () {
    test('records and uppercases a supported currency code', () {
      expect(currencyCodeDisplay('usd'), 'USD');
      expect(currencyCodeDisplay('eur'), 'EUR');
    });

    test('missing/malformed currency codes stay empty', () {
      expect(currencyCodeDisplay(null), '');
      expect(currencyCodeDisplay(''), '');
      expect(currencyCodeDisplay('N/A'), '');
      expect(currencyCodeDisplay('u'), '');
    });
  });
}

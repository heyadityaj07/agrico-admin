import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// P1-05/P1-06 farm payment ledger (`payments/{paymentIntentId}`).
///
/// The document ID is the PaymentIntent ID for records written by the current
/// webhook (deterministic claim); legacy records written with `.add()` use
/// random IDs. Both shapes are honoured by this model — fields introduced in
/// P1-05/P1-06 (`transferStatus`, expected/actual vendor details, settlement
/// fields, `processingError`, `reconciliationRequired`, `processedEvents`) are
/// absent on legacy records and stay null/empty there. Legacy records always
/// have `transfersProcessed == true` with a `status: 'paid'` shape.
class PaymentsRecord extends FirestoreRecord {
  PaymentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "orderType" field.
  String? _orderType;
  String get orderType => _orderType ?? '';
  bool hasOrderType() => _orderType != null;

  // "transferGroup" field.
  String? _transferGroup;
  String get transferGroup => _transferGroup ?? '';
  bool hasTransferGroup() => _transferGroup != null;

  // "paymentIntentId" field.
  String? _paymentIntentId;
  String get paymentIntentId => _paymentIntentId ?? '';
  bool hasPaymentIntentId() => _paymentIntentId != null;

  // "totalPaid" field.
  double? _totalPaid;
  double get totalPaid => _totalPaid ?? 0.0;
  bool hasTotalPaid() => _totalPaid != null;

  // "orderId" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  // "buyerId" field.
  String? _buyerId;
  String get buyerId => _buyerId ?? '';
  bool hasBuyerId() => _buyerId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "chargeId" field.
  String? _chargeId;
  String get chargeId => _chargeId ?? '';
  bool hasChargeId() => _chargeId != null;

  // "settlementCurrency" field.
  String? _settlementCurrency;
  String get settlementCurrency => _settlementCurrency ?? '';
  bool hasSettlementCurrency() => _settlementCurrency != null;

  // "netSettlementCents" field.
  int? _netSettlementCents;
  int get netSettlementCents => _netSettlementCents ?? 0;
  bool hasNetSettlementCents() => _netSettlementCents != null;

  // "stripeFeeCents" field.
  int? _stripeFeeCents;
  int get stripeFeeCents => _stripeFeeCents ?? 0;
  bool hasStripeFeeCents() => _stripeFeeCents != null;

  // "settlementSource" field.
  String? _settlementSource;
  String get settlementSource => _settlementSource ?? '';
  bool hasSettlementSource() => _settlementSource != null;

  // "vendorDetails" field.
  List<VendorTransferStruct>? _vendorDetails;
  List<VendorTransferStruct> get vendorDetails =>
      _vendorDetails ?? const [];
  bool hasVendorDetails() => _vendorDetails != null;

  // "expectedVendorDetails" field.
  List<ExpectedVendorDetailStruct>? _expectedVendorDetails;
  List<ExpectedVendorDetailStruct> get expectedVendorDetails =>
      _expectedVendorDetails ?? const [];
  bool hasExpectedVendorDetails() => _expectedVendorDetails != null;

  // "transfersProcessed" field.
  bool? _transfersProcessed;
  bool get transfersProcessed => _transfersProcessed ?? false;
  bool hasTransfersProcessed() => _transfersProcessed != null;

  // "transferStatus" field.
  String? _transferStatus;
  String get transferStatus => _transferStatus ?? '';
  bool hasTransferStatus() => _transferStatus != null;

  // "processingError" field.
  String? _processingError;
  String get processingError => _processingError ?? '';
  bool hasProcessingError() => _processingError != null;

  // "reconciliationRequired" field.
  bool? _reconciliationRequired;
  bool get reconciliationRequired => _reconciliationRequired ?? false;
  bool hasReconciliationRequired() => _reconciliationRequired != null;

  // "processedEvents" field.
  List<String>? _processedEvents;
  List<String> get processedEvents => _processedEvents ?? const [];
  bool hasProcessedEvents() => _processedEvents != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _orderType = snapshotData['orderType'] as String?;
    _transferGroup = snapshotData['transferGroup'] as String?;
    _paymentIntentId = snapshotData['paymentIntentId'] as String?;
    _totalPaid = castToType<double>(snapshotData['totalPaid']);
    _orderId = snapshotData['orderId'] as String?;
    _buyerId = snapshotData['buyerId'] as String?;
    _status = snapshotData['status'] as String?;
    _currency = snapshotData['currency'] as String?;
    _chargeId = snapshotData['chargeId'] as String?;
    _settlementCurrency = snapshotData['settlementCurrency'] as String?;
    _netSettlementCents = castToType<int>(snapshotData['netSettlementCents']);
    _stripeFeeCents = castToType<int>(snapshotData['stripeFeeCents']);
    _settlementSource = snapshotData['settlementSource'] as String?;
    _vendorDetails = getStructList(
      snapshotData['vendorDetails'],
      VendorTransferStruct.fromMap,
    );
    _expectedVendorDetails = getStructList(
      snapshotData['expectedVendorDetails'],
      ExpectedVendorDetailStruct.fromMap,
    );
    _transfersProcessed = snapshotData['transfersProcessed'] as bool?;
    _transferStatus = snapshotData['transferStatus'] as String?;
    _processingError = snapshotData['processingError'] as String?;
    _reconciliationRequired =
        snapshotData['reconciliationRequired'] as bool?;
    _processedEvents = getDataList(snapshotData['processedEvents']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payments');

  static Stream<PaymentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentsRecord.fromSnapshot(s));

  static Future<PaymentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentsRecord.fromSnapshot(s));

  static PaymentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentsRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createPaymentsRecordData({
  String? orderType,
  String? transferGroup,
  String? paymentIntentId,
  double? totalPaid,
  String? orderId,
  String? buyerId,
  String? status,
  String? currency,
  String? chargeId,
  String? settlementCurrency,
  int? netSettlementCents,
  int? stripeFeeCents,
  String? settlementSource,
  bool? transfersProcessed,
  String? transferStatus,
  String? processingError,
  bool? reconciliationRequired,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'orderType': orderType,
      'transferGroup': transferGroup,
      'paymentIntentId': paymentIntentId,
      'totalPaid': totalPaid,
      'orderId': orderId,
      'buyerId': buyerId,
      'status': status,
      'currency': currency,
      'chargeId': chargeId,
      'settlementCurrency': settlementCurrency,
      'netSettlementCents': netSettlementCents,
      'stripeFeeCents': stripeFeeCents,
      'settlementSource': settlementSource,
      'transfersProcessed': transfersProcessed,
      'transferStatus': transferStatus,
      'processingError': processingError,
      'reconciliationRequired': reconciliationRequired,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentsRecordDocumentEquality implements Equality<PaymentsRecord> {
  const PaymentsRecordDocumentEquality();

  @override
  bool equals(PaymentsRecord? e1, PaymentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.orderType == e2?.orderType &&
        e1?.transferGroup == e2?.transferGroup &&
        e1?.paymentIntentId == e2?.paymentIntentId &&
        e1?.totalPaid == e2?.totalPaid &&
        e1?.orderId == e2?.orderId &&
        e1?.buyerId == e2?.buyerId &&
        e1?.status == e2?.status &&
        e1?.currency == e2?.currency &&
        e1?.chargeId == e2?.chargeId &&
        e1?.settlementCurrency == e2?.settlementCurrency &&
        e1?.netSettlementCents == e2?.netSettlementCents &&
        e1?.stripeFeeCents == e2?.stripeFeeCents &&
        e1?.settlementSource == e2?.settlementSource &&
        listEquality.equals(e1?.vendorDetails, e2?.vendorDetails) &&
        listEquality.equals(
            e1?.expectedVendorDetails, e2?.expectedVendorDetails) &&
        e1?.transfersProcessed == e2?.transfersProcessed &&
        e1?.transferStatus == e2?.transferStatus &&
        e1?.processingError == e2?.processingError &&
        e1?.reconciliationRequired == e2?.reconciliationRequired &&
        listEquality.equals(e1?.processedEvents, e2?.processedEvents) &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(PaymentsRecord? e) => const ListEquality().hash([
        e?.orderType,
        e?.transferGroup,
        e?.paymentIntentId,
        e?.totalPaid,
        e?.orderId,
        e?.buyerId,
        e?.status,
        e?.currency,
        e?.chargeId,
        e?.settlementCurrency,
        e?.netSettlementCents,
        e?.stripeFeeCents,
        e?.settlementSource,
        const ListEquality().hash(e?.vendorDetails),
        const ListEquality().hash(e?.expectedVendorDetails),
        e?.transfersProcessed,
        e?.transferStatus,
        e?.processingError,
        e?.reconciliationRequired,
        const ListEquality().hash(e?.processedEvents),
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is PaymentsRecord;
}

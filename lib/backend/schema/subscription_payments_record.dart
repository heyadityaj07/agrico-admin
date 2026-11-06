import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionPaymentsRecord extends FirestoreRecord {
  SubscriptionPaymentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "invoiceld" field.
  String? _invoiceld;
  String get invoiceld => _invoiceld ?? '';
  bool hasInvoiceld() => _invoiceld != null;

  // "invoicePdf" field.
  String? _invoicePdf;
  String get invoicePdf => _invoicePdf ?? '';
  bool hasInvoicePdf() => _invoicePdf != null;

  // "invoiceUrl" field.
  String? _invoiceUrl;
  String get invoiceUrl => _invoiceUrl ?? '';
  bool hasInvoiceUrl() => _invoiceUrl != null;

  // "isTrial" field.
  bool? _isTrial;
  bool get isTrial => _isTrial ?? false;
  bool hasIsTrial() => _isTrial != null;

  // "paidAt" field.
  DateTime? _paidAt;
  DateTime? get paidAt => _paidAt;
  bool hasPaidAt() => _paidAt != null;

  // "periodEnd" field.
  DateTime? _periodEnd;
  DateTime? get periodEnd => _periodEnd;
  bool hasPeriodEnd() => _periodEnd != null;

  // "periodStart" field.
  DateTime? _periodStart;
  DateTime? get periodStart => _periodStart;
  bool hasPeriodStart() => _periodStart != null;

  // "planName" field.
  String? _planName;
  String get planName => _planName ?? '';
  bool hasPlanName() => _planName != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "subscriptionld" field.
  String? _subscriptionld;
  String get subscriptionld => _subscriptionld ?? '';
  bool hasSubscriptionld() => _subscriptionld != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _amount = castToType<int>(snapshotData['amount']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _currency = snapshotData['currency'] as String?;
    _invoiceld = snapshotData['invoiceld'] as String?;
    _invoicePdf = snapshotData['invoicePdf'] as String?;
    _invoiceUrl = snapshotData['invoiceUrl'] as String?;
    _isTrial = snapshotData['isTrial'] as bool?;
    _paidAt = snapshotData['paidAt'] as DateTime?;
    _periodEnd = snapshotData['periodEnd'] as DateTime?;
    _periodStart = snapshotData['periodStart'] as DateTime?;
    _planName = snapshotData['planName'] as String?;
    _status = snapshotData['status'] as String?;
    _subscriptionld = snapshotData['subscriptionld'] as String?;
    _userId = snapshotData['userId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscription_payments');

  static Stream<SubscriptionPaymentsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionPaymentsRecord.fromSnapshot(s));

  static Future<SubscriptionPaymentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SubscriptionPaymentsRecord.fromSnapshot(s));

  static SubscriptionPaymentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionPaymentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionPaymentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionPaymentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionPaymentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionPaymentsRecord &&
      reference.path == other.reference.path;
}

Map<String, dynamic> createSubscriptionPaymentsRecordData({
  int? amount,
  DateTime? createdAt,
  String? currency,
  String? invoiceld,
  String? invoicePdf,
  String? invoiceUrl,
  bool? isTrial,
  DateTime? paidAt,
  DateTime? periodEnd,
  DateTime? periodStart,
  String? planName,
  String? status,
  String? subscriptionld,
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'amount': amount,
      'createdAt': createdAt,
      'currency': currency,
      'invoiceld': invoiceld,
      'invoicePdf': invoicePdf,
      'invoiceUrl': invoiceUrl,
      'isTrial': isTrial,
      'paidAt': paidAt,
      'periodEnd': periodEnd,
      'periodStart': periodStart,
      'planName': planName,
      'status': status,
      'subscriptionld': subscriptionld,
      'userId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubscriptionPaymentsRecordDocumentEquality
    implements Equality<SubscriptionPaymentsRecord> {
  const SubscriptionPaymentsRecordDocumentEquality();

  @override
  bool equals(SubscriptionPaymentsRecord? e1, SubscriptionPaymentsRecord? e2) {
    return e1?.amount == e2?.amount &&
        e1?.createdAt == e2?.createdAt &&
        e1?.currency == e2?.currency &&
        e1?.invoiceld == e2?.invoiceld &&
        e1?.invoicePdf == e2?.invoicePdf &&
        e1?.invoiceUrl == e2?.invoiceUrl &&
        e1?.isTrial == e2?.isTrial &&
        e1?.paidAt == e2?.paidAt &&
        e1?.periodEnd == e2?.periodEnd &&
        e1?.periodStart == e2?.periodStart &&
        e1?.planName == e2?.planName &&
        e1?.status == e2?.status &&
        e1?.subscriptionld == e2?.subscriptionld &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(SubscriptionPaymentsRecord? e) => const ListEquality().hash([
        e?.amount,
        e?.createdAt,
        e?.currency,
        e?.invoiceld,
        e?.invoicePdf,
        e?.invoiceUrl,
        e?.isTrial,
        e?.paidAt,
        e?.periodEnd,
        e?.periodStart,
        e?.planName,
        e?.status,
        e?.subscriptionld,
        e?.userId
      ]);

  @override
  bool isValidKey(Object? o) => o is SubscriptionPaymentsRecord;
}

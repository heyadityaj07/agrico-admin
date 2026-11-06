import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionsRecord extends FirestoreRecord {
  SubscriptionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "planName" field.
  String? _planName;
  String get planName => _planName ?? '';
  bool hasPlanName() => _planName != null;

  // "stripeSubscriptionId" field.
  String? _stripeSubscriptionId;
  String get stripeSubscriptionId => _stripeSubscriptionId ?? '';
  bool hasStripeSubscriptionId() => _stripeSubscriptionId != null;

  // "stripeCustomerId" field.
  String? _stripeCustomerId;
  String get stripeCustomerId => _stripeCustomerId ?? '';
  bool hasStripeCustomerId() => _stripeCustomerId != null;

  // "nextBillingDate" field.
  DateTime? _nextBillingDate;
  DateTime? get nextBillingDate => _nextBillingDate;
  bool hasNextBillingDate() => _nextBillingDate != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _planName = snapshotData['planName'] as String?;
    _stripeSubscriptionId = snapshotData['stripeSubscriptionId'] as String?;
    _stripeCustomerId = snapshotData['stripeCustomerId'] as String?;
    _nextBillingDate = snapshotData['nextBillingDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscriptions');

  static Stream<SubscriptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionsRecord.fromSnapshot(s));

  static Future<SubscriptionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubscriptionsRecord.fromSnapshot(s));

  static SubscriptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionsRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createSubscriptionsRecordData({
  String? userId,
  DateTime? createdAt,
  String? status,
  String? planName,
  String? stripeSubscriptionId,
  String? stripeCustomerId,
  DateTime? nextBillingDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'createdAt': createdAt,
      'status': status,
      'planName': planName,
      'stripeSubscriptionId': stripeSubscriptionId,
      'stripeCustomerId': stripeCustomerId,
      'nextBillingDate': nextBillingDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubscriptionsRecordDocumentEquality
    implements Equality<SubscriptionsRecord> {
  const SubscriptionsRecordDocumentEquality();

  @override
  bool equals(SubscriptionsRecord? e1, SubscriptionsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.status == e2?.status &&
        e1?.planName == e2?.planName &&
        e1?.stripeSubscriptionId == e2?.stripeSubscriptionId &&
        e1?.stripeCustomerId == e2?.stripeCustomerId &&
        e1?.nextBillingDate == e2?.nextBillingDate;
  }

  @override
  int hash(SubscriptionsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.createdAt,
        e?.status,
        e?.planName,
        e?.stripeSubscriptionId,
        e?.stripeCustomerId,
        e?.nextBillingDate
      ]);

  @override
  bool isValidKey(Object? o) => o is SubscriptionsRecord;
}

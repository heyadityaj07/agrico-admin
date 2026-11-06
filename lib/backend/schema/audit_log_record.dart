import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuditLogRecord extends FirestoreRecord {
  AuditLogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "action" field.
  String? _action;
  String get action => _action ?? '';
  bool hasAction() => _action != null;

  // "entity" field.
  String? _entity;
  String get entity => _entity ?? '';
  bool hasEntity() => _entity != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "action_type" field.
  String? _actionType;
  String get actionType => _actionType ?? '';
  bool hasActionType() => _actionType != null;

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _action = snapshotData['action'] as String?;
    _entity = snapshotData['entity'] as String?;
    _details = snapshotData['details'] as String?;
    _actionType = snapshotData['action_type'] as String?;
    _userref = snapshotData['userref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('audit_log');

  static Stream<AuditLogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AuditLogRecord.fromSnapshot(s));

  static Future<AuditLogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AuditLogRecord.fromSnapshot(s));

  static AuditLogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AuditLogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AuditLogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AuditLogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AuditLogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AuditLogRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createAuditLogRecordData({
  DateTime? createdAt,
  String? action,
  String? entity,
  String? details,
  String? actionType,
  DocumentReference? userref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'action': action,
      'entity': entity,
      'details': details,
      'action_type': actionType,
      'userref': userref,
    }.withoutNulls,
  );

  return firestoreData;
}

class AuditLogRecordDocumentEquality implements Equality<AuditLogRecord> {
  const AuditLogRecordDocumentEquality();

  @override
  bool equals(AuditLogRecord? e1, AuditLogRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.action == e2?.action &&
        e1?.entity == e2?.entity &&
        e1?.details == e2?.details &&
        e1?.actionType == e2?.actionType &&
        e1?.userref == e2?.userref;
  }

  @override
  int hash(AuditLogRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.action,
        e?.entity,
        e?.details,
        e?.actionType,
        e?.userref
      ]);

  @override
  bool isValidKey(Object? o) => o is AuditLogRecord;
}

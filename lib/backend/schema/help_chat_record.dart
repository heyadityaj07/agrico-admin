import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HelpChatRecord extends FirestoreRecord {
  HelpChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "adminref" field.
  DocumentReference? _adminref;
  DocumentReference? get adminref => _adminref;
  bool hasAdminref() => _adminref != null;

  // "resolved" field.
  bool? _resolved;
  bool get resolved => _resolved ?? false;
  bool hasResolved() => _resolved != null;

  // "firstmessage" field.
  String? _firstmessage;
  String get firstmessage => _firstmessage ?? '';
  bool hasFirstmessage() => _firstmessage != null;

  // "resolved_date" field.
  DateTime? _resolvedDate;
  DateTime? get resolvedDate => _resolvedDate;
  bool hasResolvedDate() => _resolvedDate != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "onlineUsers" field.
  List<DocumentReference>? _onlineUsers;
  List<DocumentReference> get onlineUsers => _onlineUsers ?? const [];
  bool hasOnlineUsers() => _onlineUsers != null;

  // "userTime" field.
  DateTime? _userTime;
  DateTime? get userTime => _userTime;
  bool hasUserTime() => _userTime != null;

  // "adminTime" field.
  DateTime? _adminTime;
  DateTime? get adminTime => _adminTime;
  bool hasAdminTime() => _adminTime != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _adminref = snapshotData['adminref'] as DocumentReference?;
    _resolved = snapshotData['resolved'] as bool?;
    _firstmessage = snapshotData['firstmessage'] as String?;
    _resolvedDate = snapshotData['resolved_date'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _onlineUsers = getDataList(snapshotData['onlineUsers']);
    _userTime = snapshotData['userTime'] as DateTime?;
    _adminTime = snapshotData['adminTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('helpChat');

  static Stream<HelpChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HelpChatRecord.fromSnapshot(s));

  static Future<HelpChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HelpChatRecord.fromSnapshot(s));

  static HelpChatRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HelpChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HelpChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HelpChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HelpChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HelpChatRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createHelpChatRecordData({
  DateTime? createdAt,
  DocumentReference? userRef,
  DocumentReference? adminref,
  bool? resolved,
  String? firstmessage,
  DateTime? resolvedDate,
  String? status,
  DateTime? userTime,
  DateTime? adminTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'userRef': userRef,
      'adminref': adminref,
      'resolved': resolved,
      'firstmessage': firstmessage,
      'resolved_date': resolvedDate,
      'status': status,
      'userTime': userTime,
      'adminTime': adminTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class HelpChatRecordDocumentEquality implements Equality<HelpChatRecord> {
  const HelpChatRecordDocumentEquality();

  @override
  bool equals(HelpChatRecord? e1, HelpChatRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.adminref == e2?.adminref &&
        e1?.resolved == e2?.resolved &&
        e1?.firstmessage == e2?.firstmessage &&
        e1?.resolvedDate == e2?.resolvedDate &&
        e1?.status == e2?.status &&
        listEquality.equals(e1?.onlineUsers, e2?.onlineUsers) &&
        e1?.userTime == e2?.userTime &&
        e1?.adminTime == e2?.adminTime;
  }

  @override
  int hash(HelpChatRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.userRef,
        e?.adminref,
        e?.resolved,
        e?.firstmessage,
        e?.resolvedDate,
        e?.status,
        const ListEquality().hash(e?.onlineUsers),
        e?.userTime,
        e?.adminTime
      ]);

  @override
  bool isValidKey(Object? o) => o is HelpChatRecord;
}

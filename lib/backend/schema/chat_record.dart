import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "last_meesage_time" field.
  DateTime? _lastMeesageTime;
  DateTime? get lastMeesageTime => _lastMeesageTime;
  bool hasLastMeesageTime() => _lastMeesageTime != null;

  // "seen" field.
  bool? _seen;
  bool get seen => _seen ?? false;
  bool hasSeen() => _seen != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "farm_ref" field.
  DocumentReference? _farmRef;
  DocumentReference? get farmRef => _farmRef;
  bool hasFarmRef() => _farmRef != null;

  // "is_suspend" field.
  bool? _isSuspend;
  bool get isSuspend => _isSuspend ?? false;
  bool hasIsSuspend() => _isSuspend != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _lastMessage = snapshotData['last_message'] as String?;
    _lastMeesageTime = snapshotData['last_meesage_time'] as DateTime?;
    _seen = snapshotData['seen'] as bool?;
    _users = getDataList(snapshotData['users']);
    _farmRef = snapshotData['farm_ref'] as DocumentReference?;
    _isSuspend = snapshotData['is_suspend'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createChatRecordData({
  DateTime? createdAt,
  String? lastMessage,
  DateTime? lastMeesageTime,
  bool? seen,
  DocumentReference? farmRef,
  bool? isSuspend,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'last_message': lastMessage,
      'last_meesage_time': lastMeesageTime,
      'seen': seen,
      'farm_ref': farmRef,
      'is_suspend': isSuspend,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRecordDocumentEquality implements Equality<ChatRecord> {
  const ChatRecordDocumentEquality();

  @override
  bool equals(ChatRecord? e1, ChatRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMeesageTime == e2?.lastMeesageTime &&
        e1?.seen == e2?.seen &&
        listEquality.equals(e1?.users, e2?.users) &&
        e1?.farmRef == e2?.farmRef &&
        e1?.isSuspend == e2?.isSuspend;
  }

  @override
  int hash(ChatRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.lastMessage,
        e?.lastMeesageTime,
        e?.seen,
        const ListEquality().hash(e?.users),
        e?.farmRef,
        e?.isSuspend
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatRecord;
}

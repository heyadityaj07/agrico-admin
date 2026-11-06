import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessagesRecord extends FirestoreRecord {
  ChatMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "chatRef" field.
  DocumentReference? _chatRef;
  DocumentReference? get chatRef => _chatRef;
  bool hasChatRef() => _chatRef != null;

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "seen" field.
  bool? _seen;
  bool get seen => _seen ?? false;
  bool hasSeen() => _seen != null;

  // "message_time" field.
  DateTime? _messageTime;
  DateTime? get messageTime => _messageTime;
  bool hasMessageTime() => _messageTime != null;

  // "receiver" field.
  DocumentReference? _receiver;
  DocumentReference? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

  // "seen_by" field.
  DocumentReference? _seenBy;
  DocumentReference? get seenBy => _seenBy;
  bool hasSeenBy() => _seenBy != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _chatRef = snapshotData['chatRef'] as DocumentReference?;
    _sender = snapshotData['sender'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
    _seen = snapshotData['seen'] as bool?;
    _messageTime = snapshotData['message_time'] as DateTime?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _seenBy = snapshotData['seen_by'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chat_messages')
          : FirebaseFirestore.instance.collectionGroup('chat_messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('chat_messages').doc(id);

  static Stream<ChatMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatMessagesRecord.fromSnapshot(s));

  static Future<ChatMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatMessagesRecord.fromSnapshot(s));

  static ChatMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatMessagesRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createChatMessagesRecordData({
  DateTime? createdAt,
  DocumentReference? chatRef,
  DocumentReference? sender,
  String? message,
  bool? seen,
  DateTime? messageTime,
  DocumentReference? receiver,
  DocumentReference? seenBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'chatRef': chatRef,
      'sender': sender,
      'message': message,
      'seen': seen,
      'message_time': messageTime,
      'receiver': receiver,
      'seen_by': seenBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatMessagesRecordDocumentEquality
    implements Equality<ChatMessagesRecord> {
  const ChatMessagesRecordDocumentEquality();

  @override
  bool equals(ChatMessagesRecord? e1, ChatMessagesRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.chatRef == e2?.chatRef &&
        e1?.sender == e2?.sender &&
        e1?.message == e2?.message &&
        e1?.seen == e2?.seen &&
        e1?.messageTime == e2?.messageTime &&
        e1?.receiver == e2?.receiver &&
        e1?.seenBy == e2?.seenBy;
  }

  @override
  int hash(ChatMessagesRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.chatRef,
        e?.sender,
        e?.message,
        e?.seen,
        e?.messageTime,
        e?.receiver,
        e?.seenBy
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatMessagesRecord;
}

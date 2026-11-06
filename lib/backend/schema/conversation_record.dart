import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversationRecord extends FirestoreRecord {
  ConversationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "message_time" field.
  DateTime? _messageTime;
  DateTime? get messageTime => _messageTime;
  bool hasMessageTime() => _messageTime != null;

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "recever" field.
  DocumentReference? _recever;
  DocumentReference? get recever => _recever;
  bool hasRecever() => _recever != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _message = snapshotData['message'] as String?;
    _messageTime = snapshotData['message_time'] as DateTime?;
    _sender = snapshotData['sender'] as DocumentReference?;
    _recever = snapshotData['recever'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('conversation')
          : FirebaseFirestore.instance.collectionGroup('conversation');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('conversation').doc(id);

  static Stream<ConversationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConversationRecord.fromSnapshot(s));

  static Future<ConversationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConversationRecord.fromSnapshot(s));

  static ConversationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConversationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConversationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConversationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConversationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConversationRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createConversationRecordData({
  DateTime? createdAt,
  String? message,
  DateTime? messageTime,
  DocumentReference? sender,
  DocumentReference? recever,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'message': message,
      'message_time': messageTime,
      'sender': sender,
      'recever': recever,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConversationRecordDocumentEquality
    implements Equality<ConversationRecord> {
  const ConversationRecordDocumentEquality();

  @override
  bool equals(ConversationRecord? e1, ConversationRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.message == e2?.message &&
        e1?.messageTime == e2?.messageTime &&
        e1?.sender == e2?.sender &&
        e1?.recever == e2?.recever &&
        e1?.image == e2?.image;
  }

  @override
  int hash(ConversationRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.message,
        e?.messageTime,
        e?.sender,
        e?.recever,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is ConversationRecord;
}

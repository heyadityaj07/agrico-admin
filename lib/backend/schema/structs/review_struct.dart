// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewStruct extends FFFirebaseStruct {
  ReviewStruct({
    DocumentReference? userRef,
    double? rate,
    DateTime? createdAt,
    String? comment,
    String? reviewStatus,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userRef = userRef,
        _rate = rate,
        _createdAt = createdAt,
        _comment = comment,
        _reviewStatus = reviewStatus,
        super(firestoreUtilData);

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;

  bool hasUserRef() => _userRef != null;

  // "rate" field.
  double? _rate;
  double get rate => _rate ?? 0.0;
  set rate(double? val) => _rate = val;

  void incrementRate(double amount) => rate = rate + amount;

  bool hasRate() => _rate != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  set comment(String? val) => _comment = val;

  bool hasComment() => _comment != null;

  // "review_status" field.
  String? _reviewStatus;
  String get reviewStatus => _reviewStatus ?? '';
  set reviewStatus(String? val) => _reviewStatus = val;

  bool hasReviewStatus() => _reviewStatus != null;

  static ReviewStruct fromMap(Map<String, dynamic> data) => ReviewStruct(
        userRef: data['user_ref'] as DocumentReference?,
        rate: castToType<double>(data['rate']),
        createdAt: data['created_at'] as DateTime?,
        comment: data['comment'] as String?,
        reviewStatus: data['review_status'] as String?,
      );

  static ReviewStruct? maybeFromMap(dynamic data) =>
      data is Map ? ReviewStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'user_ref': _userRef,
        'rate': _rate,
        'created_at': _createdAt,
        'comment': _comment,
        'review_status': _reviewStatus,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_ref': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
        'rate': serializeParam(
          _rate,
          ParamType.double,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'comment': serializeParam(
          _comment,
          ParamType.String,
        ),
        'review_status': serializeParam(
          _reviewStatus,
          ParamType.String,
        ),
      }.withoutNulls;

  static ReviewStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReviewStruct(
        userRef: deserializeParam(
          data['user_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        rate: deserializeParam(
          data['rate'],
          ParamType.double,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        comment: deserializeParam(
          data['comment'],
          ParamType.String,
          false,
        ),
        reviewStatus: deserializeParam(
          data['review_status'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ReviewStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReviewStruct &&
        userRef == other.userRef &&
        rate == other.rate &&
        createdAt == other.createdAt &&
        comment == other.comment &&
        reviewStatus == other.reviewStatus;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([userRef, rate, createdAt, comment, reviewStatus]);
}

ReviewStruct createReviewStruct({
  DocumentReference? userRef,
  double? rate,
  DateTime? createdAt,
  String? comment,
  String? reviewStatus,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ReviewStruct(
      userRef: userRef,
      rate: rate,
      createdAt: createdAt,
      comment: comment,
      reviewStatus: reviewStatus,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ReviewStruct? updateReviewStruct(
  ReviewStruct? review, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    review
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addReviewStructData(
  Map<String, dynamic> firestoreData,
  ReviewStruct? review,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (review == null) {
    return;
  }
  if (review.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && review.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final reviewData = getReviewFirestoreData(review, forFieldValue);
  final nestedData = reviewData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = review.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getReviewFirestoreData(
  ReviewStruct? review, [
  bool forFieldValue = false,
]) {
  if (review == null) {
    return {};
  }
  final firestoreData = mapToFirestore(review.toMap());

  // Add any Firestore field values
  mapToFirestore(review.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getReviewListFirestoreData(
  List<ReviewStruct>? reviews,
) =>
    reviews?.map((e) => getReviewFirestoreData(e, true)).toList() ?? [];

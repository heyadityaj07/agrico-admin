// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UploaddataStruct extends FFFirebaseStruct {
  UploaddataStruct({
    String? image,
    String? pdf,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _pdf = pdf,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "pdf" field.
  String? _pdf;
  String get pdf => _pdf ?? '';
  set pdf(String? val) => _pdf = val;

  bool hasPdf() => _pdf != null;

  static UploaddataStruct fromMap(Map<String, dynamic> data) =>
      UploaddataStruct(
        image: data['image'] as String?,
        pdf: data['pdf'] as String?,
      );

  static UploaddataStruct? maybeFromMap(dynamic data) => data is Map
      ? UploaddataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'pdf': _pdf,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'pdf': serializeParam(
          _pdf,
          ParamType.String,
        ),
      }.withoutNulls;

  static UploaddataStruct fromSerializableMap(Map<String, dynamic> data) =>
      UploaddataStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        pdf: deserializeParam(
          data['pdf'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UploaddataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UploaddataStruct &&
        image == other.image &&
        pdf == other.pdf;
  }

  @override
  int get hashCode => const ListEquality().hash([image, pdf]);
}

UploaddataStruct createUploaddataStruct({
  String? image,
  String? pdf,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UploaddataStruct(
      image: image,
      pdf: pdf,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UploaddataStruct? updateUploaddataStruct(
  UploaddataStruct? uploaddata, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    uploaddata
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUploaddataStructData(
  Map<String, dynamic> firestoreData,
  UploaddataStruct? uploaddata,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (uploaddata == null) {
    return;
  }
  if (uploaddata.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && uploaddata.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final uploaddataData = getUploaddataFirestoreData(uploaddata, forFieldValue);
  final nestedData = uploaddataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = uploaddata.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUploaddataFirestoreData(
  UploaddataStruct? uploaddata, [
  bool forFieldValue = false,
]) {
  if (uploaddata == null) {
    return {};
  }
  final firestoreData = mapToFirestore(uploaddata.toMap());

  // Add any Firestore field values
  mapToFirestore(uploaddata.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUploaddataListFirestoreData(
  List<UploaddataStruct>? uploaddatas,
) =>
    uploaddatas?.map((e) => getUploaddataFirestoreData(e, true)).toList() ?? [];

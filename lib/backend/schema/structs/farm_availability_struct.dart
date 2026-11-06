// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FarmAvailabilityStruct extends FFFirebaseStruct {
  FarmAvailabilityStruct({
    String? day,
    DateTime? startlime,
    DateTime? endtime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _day = day,
        _startlime = startlime,
        _endtime = endtime,
        super(firestoreUtilData);

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  set day(String? val) => _day = val;

  bool hasDay() => _day != null;

  // "startlime" field.
  DateTime? _startlime;
  DateTime? get startlime => _startlime;
  set startlime(DateTime? val) => _startlime = val;

  bool hasStartlime() => _startlime != null;

  // "endtime" field.
  DateTime? _endtime;
  DateTime? get endtime => _endtime;
  set endtime(DateTime? val) => _endtime = val;

  bool hasEndtime() => _endtime != null;

  static FarmAvailabilityStruct fromMap(Map<String, dynamic> data) =>
      FarmAvailabilityStruct(
        day: data['day'] as String?,
        startlime: data['startlime'] as DateTime?,
        endtime: data['endtime'] as DateTime?,
      );

  static FarmAvailabilityStruct? maybeFromMap(dynamic data) => data is Map
      ? FarmAvailabilityStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'day': _day,
        'startlime': _startlime,
        'endtime': _endtime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'day': serializeParam(
          _day,
          ParamType.String,
        ),
        'startlime': serializeParam(
          _startlime,
          ParamType.DateTime,
        ),
        'endtime': serializeParam(
          _endtime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static FarmAvailabilityStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FarmAvailabilityStruct(
        day: deserializeParam(
          data['day'],
          ParamType.String,
          false,
        ),
        startlime: deserializeParam(
          data['startlime'],
          ParamType.DateTime,
          false,
        ),
        endtime: deserializeParam(
          data['endtime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'FarmAvailabilityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FarmAvailabilityStruct &&
        day == other.day &&
        startlime == other.startlime &&
        endtime == other.endtime;
  }

  @override
  int get hashCode => const ListEquality().hash([day, startlime, endtime]);
}

FarmAvailabilityStruct createFarmAvailabilityStruct({
  String? day,
  DateTime? startlime,
  DateTime? endtime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FarmAvailabilityStruct(
      day: day,
      startlime: startlime,
      endtime: endtime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FarmAvailabilityStruct? updateFarmAvailabilityStruct(
  FarmAvailabilityStruct? farmAvailability, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    farmAvailability
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFarmAvailabilityStructData(
  Map<String, dynamic> firestoreData,
  FarmAvailabilityStruct? farmAvailability,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (farmAvailability == null) {
    return;
  }
  if (farmAvailability.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && farmAvailability.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final farmAvailabilityData =
      getFarmAvailabilityFirestoreData(farmAvailability, forFieldValue);
  final nestedData =
      farmAvailabilityData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = farmAvailability.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFarmAvailabilityFirestoreData(
  FarmAvailabilityStruct? farmAvailability, [
  bool forFieldValue = false,
]) {
  if (farmAvailability == null) {
    return {};
  }
  final firestoreData = mapToFirestore(farmAvailability.toMap());

  // Add any Firestore field values
  mapToFirestore(farmAvailability.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFarmAvailabilityListFirestoreData(
  List<FarmAvailabilityStruct>? farmAvailabilitys,
) =>
    farmAvailabilitys
        ?.map((e) => getFarmAvailabilityFirestoreData(e, true))
        .toList() ??
    [];

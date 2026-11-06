// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeliveryAdressStruct extends FFFirebaseStruct {
  DeliveryAdressStruct({
    String? label,
    String? fullName,
    String? streetAdress,
    String? city,
    String? state,
    String? phoneNo,
    String? instruction,
    DateTime? cratedAt,
    String? postalCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _label = label,
        _fullName = fullName,
        _streetAdress = streetAdress,
        _city = city,
        _state = state,
        _phoneNo = phoneNo,
        _instruction = instruction,
        _cratedAt = cratedAt,
        _postalCode = postalCode,
        super(firestoreUtilData);

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "street_adress" field.
  String? _streetAdress;
  String get streetAdress => _streetAdress ?? '';
  set streetAdress(String? val) => _streetAdress = val;

  bool hasStreetAdress() => _streetAdress != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "phone_no" field.
  String? _phoneNo;
  String get phoneNo => _phoneNo ?? '';
  set phoneNo(String? val) => _phoneNo = val;

  bool hasPhoneNo() => _phoneNo != null;

  // "instruction" field.
  String? _instruction;
  String get instruction => _instruction ?? '';
  set instruction(String? val) => _instruction = val;

  bool hasInstruction() => _instruction != null;

  // "crated_at" field.
  DateTime? _cratedAt;
  DateTime? get cratedAt => _cratedAt;
  set cratedAt(DateTime? val) => _cratedAt = val;

  bool hasCratedAt() => _cratedAt != null;

  // "postal_code" field.
  String? _postalCode;
  String get postalCode => _postalCode ?? '';
  set postalCode(String? val) => _postalCode = val;

  bool hasPostalCode() => _postalCode != null;

  static DeliveryAdressStruct fromMap(Map<String, dynamic> data) =>
      DeliveryAdressStruct(
        label: data['label'] as String?,
        fullName: data['full_name'] as String?,
        streetAdress: data['street_adress'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        phoneNo: data['phone_no'] as String?,
        instruction: data['instruction'] as String?,
        cratedAt: data['crated_at'] as DateTime?,
        postalCode: data['postal_code'] as String?,
      );

  static DeliveryAdressStruct? maybeFromMap(dynamic data) => data is Map
      ? DeliveryAdressStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'label': _label,
        'full_name': _fullName,
        'street_adress': _streetAdress,
        'city': _city,
        'state': _state,
        'phone_no': _phoneNo,
        'instruction': _instruction,
        'crated_at': _cratedAt,
        'postal_code': _postalCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'full_name': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'street_adress': serializeParam(
          _streetAdress,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'phone_no': serializeParam(
          _phoneNo,
          ParamType.String,
        ),
        'instruction': serializeParam(
          _instruction,
          ParamType.String,
        ),
        'crated_at': serializeParam(
          _cratedAt,
          ParamType.DateTime,
        ),
        'postal_code': serializeParam(
          _postalCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static DeliveryAdressStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeliveryAdressStruct(
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        fullName: deserializeParam(
          data['full_name'],
          ParamType.String,
          false,
        ),
        streetAdress: deserializeParam(
          data['street_adress'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        phoneNo: deserializeParam(
          data['phone_no'],
          ParamType.String,
          false,
        ),
        instruction: deserializeParam(
          data['instruction'],
          ParamType.String,
          false,
        ),
        cratedAt: deserializeParam(
          data['crated_at'],
          ParamType.DateTime,
          false,
        ),
        postalCode: deserializeParam(
          data['postal_code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DeliveryAdressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DeliveryAdressStruct &&
        label == other.label &&
        fullName == other.fullName &&
        streetAdress == other.streetAdress &&
        city == other.city &&
        state == other.state &&
        phoneNo == other.phoneNo &&
        instruction == other.instruction &&
        cratedAt == other.cratedAt &&
        postalCode == other.postalCode;
  }

  @override
  int get hashCode => const ListEquality().hash([
        label,
        fullName,
        streetAdress,
        city,
        state,
        phoneNo,
        instruction,
        cratedAt,
        postalCode
      ]);
}

DeliveryAdressStruct createDeliveryAdressStruct({
  String? label,
  String? fullName,
  String? streetAdress,
  String? city,
  String? state,
  String? phoneNo,
  String? instruction,
  DateTime? cratedAt,
  String? postalCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DeliveryAdressStruct(
      label: label,
      fullName: fullName,
      streetAdress: streetAdress,
      city: city,
      state: state,
      phoneNo: phoneNo,
      instruction: instruction,
      cratedAt: cratedAt,
      postalCode: postalCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DeliveryAdressStruct? updateDeliveryAdressStruct(
  DeliveryAdressStruct? deliveryAdress, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    deliveryAdress
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDeliveryAdressStructData(
  Map<String, dynamic> firestoreData,
  DeliveryAdressStruct? deliveryAdress,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (deliveryAdress == null) {
    return;
  }
  if (deliveryAdress.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && deliveryAdress.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final deliveryAdressData =
      getDeliveryAdressFirestoreData(deliveryAdress, forFieldValue);
  final nestedData =
      deliveryAdressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = deliveryAdress.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDeliveryAdressFirestoreData(
  DeliveryAdressStruct? deliveryAdress, [
  bool forFieldValue = false,
]) {
  if (deliveryAdress == null) {
    return {};
  }
  final firestoreData = mapToFirestore(deliveryAdress.toMap());

  // Add any Firestore field values
  mapToFirestore(deliveryAdress.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDeliveryAdressListFirestoreData(
  List<DeliveryAdressStruct>? deliveryAdresss,
) =>
    deliveryAdresss
        ?.map((e) => getDeliveryAdressFirestoreData(e, true))
        .toList() ??
    [];

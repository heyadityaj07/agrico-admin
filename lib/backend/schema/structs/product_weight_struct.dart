// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductWeightStruct extends FFFirebaseStruct {
  ProductWeightStruct({
    double? minWeight,
    double? maxWeight,
    double? pricePerKg,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _minWeight = minWeight,
        _maxWeight = maxWeight,
        _pricePerKg = pricePerKg,
        super(firestoreUtilData);

  // "min_weight" field.
  double? _minWeight;
  double get minWeight => _minWeight ?? 0.0;
  set minWeight(double? val) => _minWeight = val;

  void incrementMinWeight(double amount) => minWeight = minWeight + amount;

  bool hasMinWeight() => _minWeight != null;

  // "max_weight" field.
  double? _maxWeight;
  double get maxWeight => _maxWeight ?? 0.0;
  set maxWeight(double? val) => _maxWeight = val;

  void incrementMaxWeight(double amount) => maxWeight = maxWeight + amount;

  bool hasMaxWeight() => _maxWeight != null;

  // "price_per_kg" field.
  double? _pricePerKg;
  double get pricePerKg => _pricePerKg ?? 0.0;
  set pricePerKg(double? val) => _pricePerKg = val;

  void incrementPricePerKg(double amount) => pricePerKg = pricePerKg + amount;

  bool hasPricePerKg() => _pricePerKg != null;

  static ProductWeightStruct fromMap(Map<String, dynamic> data) =>
      ProductWeightStruct(
        minWeight: castToType<double>(data['min_weight']),
        maxWeight: castToType<double>(data['max_weight']),
        pricePerKg: castToType<double>(data['price_per_kg']),
      );

  static ProductWeightStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductWeightStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'min_weight': _minWeight,
        'max_weight': _maxWeight,
        'price_per_kg': _pricePerKg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'min_weight': serializeParam(
          _minWeight,
          ParamType.double,
        ),
        'max_weight': serializeParam(
          _maxWeight,
          ParamType.double,
        ),
        'price_per_kg': serializeParam(
          _pricePerKg,
          ParamType.double,
        ),
      }.withoutNulls;

  static ProductWeightStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductWeightStruct(
        minWeight: deserializeParam(
          data['min_weight'],
          ParamType.double,
          false,
        ),
        maxWeight: deserializeParam(
          data['max_weight'],
          ParamType.double,
          false,
        ),
        pricePerKg: deserializeParam(
          data['price_per_kg'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ProductWeightStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductWeightStruct &&
        minWeight == other.minWeight &&
        maxWeight == other.maxWeight &&
        pricePerKg == other.pricePerKg;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([minWeight, maxWeight, pricePerKg]);
}

ProductWeightStruct createProductWeightStruct({
  double? minWeight,
  double? maxWeight,
  double? pricePerKg,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductWeightStruct(
      minWeight: minWeight,
      maxWeight: maxWeight,
      pricePerKg: pricePerKg,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductWeightStruct? updateProductWeightStruct(
  ProductWeightStruct? productWeight, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productWeight
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductWeightStructData(
  Map<String, dynamic> firestoreData,
  ProductWeightStruct? productWeight,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productWeight == null) {
    return;
  }
  if (productWeight.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productWeight.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productWeightData =
      getProductWeightFirestoreData(productWeight, forFieldValue);
  final nestedData =
      productWeightData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productWeight.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductWeightFirestoreData(
  ProductWeightStruct? productWeight, [
  bool forFieldValue = false,
]) {
  if (productWeight == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productWeight.toMap());

  // Add any Firestore field values
  mapToFirestore(productWeight.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductWeightListFirestoreData(
  List<ProductWeightStruct>? productWeights,
) =>
    productWeights
        ?.map((e) => getProductWeightFirestoreData(e, true))
        .toList() ??
    [];

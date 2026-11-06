// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Struct product_weight_bracket
class ProductWeightBracketStruct extends FFFirebaseStruct {
  ProductWeightBracketStruct({
    /// product_weight_bracket.min_weight
    double? minWeight,

    /// product_weight_bracket.max_weight
    double? maxWeight,

    /// product_weight_bracket.price_per_kg
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

  static ProductWeightBracketStruct fromMap(Map<String, dynamic> data) =>
      ProductWeightBracketStruct(
        minWeight: castToType<double>(data['min_weight']),
        maxWeight: castToType<double>(data['max_weight']),
        pricePerKg: castToType<double>(data['price_per_kg']),
      );

  static ProductWeightBracketStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductWeightBracketStruct.fromMap(data.cast<String, dynamic>())
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

  static ProductWeightBracketStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProductWeightBracketStruct(
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
  String toString() => 'ProductWeightBracketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductWeightBracketStruct &&
        minWeight == other.minWeight &&
        maxWeight == other.maxWeight &&
        pricePerKg == other.pricePerKg;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([minWeight, maxWeight, pricePerKg]);
}

ProductWeightBracketStruct createProductWeightBracketStruct({
  double? minWeight,
  double? maxWeight,
  double? pricePerKg,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductWeightBracketStruct(
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

ProductWeightBracketStruct? updateProductWeightBracketStruct(
  ProductWeightBracketStruct? productWeightBracket, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productWeightBracket
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductWeightBracketStructData(
  Map<String, dynamic> firestoreData,
  ProductWeightBracketStruct? productWeightBracket,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productWeightBracket == null) {
    return;
  }
  if (productWeightBracket.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productWeightBracket.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productWeightBracketData =
      getProductWeightBracketFirestoreData(productWeightBracket, forFieldValue);
  final nestedData =
      productWeightBracketData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      productWeightBracket.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductWeightBracketFirestoreData(
  ProductWeightBracketStruct? productWeightBracket, [
  bool forFieldValue = false,
]) {
  if (productWeightBracket == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productWeightBracket.toMap());

  // Add any Firestore field values
  mapToFirestore(productWeightBracket.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductWeightBracketListFirestoreData(
  List<ProductWeightBracketStruct>? productWeightBrackets,
) =>
    productWeightBrackets
        ?.map((e) => getProductWeightBracketFirestoreData(e, true))
        .toList() ??
    [];

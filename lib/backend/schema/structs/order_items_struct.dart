// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderItemsStruct extends FFFirebaseStruct {
  OrderItemsStruct({
    DocumentReference? productRef,
    int? totalItems,
    double? pricePerProduct,
    bool? isVariableWeight,
    double? minWeight,
    double? maxWeight,
    double? pricePerKg,
    double? actualWeight,
    double? depositAmount,
    double? finalItemPrice,
    double? remainingBalance,
    bool? weightLocked,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productRef = productRef,
        _totalItems = totalItems,
        _pricePerProduct = pricePerProduct,
        _isVariableWeight = isVariableWeight,
        _minWeight = minWeight,
        _maxWeight = maxWeight,
        _pricePerKg = pricePerKg,
        _actualWeight = actualWeight,
        _depositAmount = depositAmount,
        _finalItemPrice = finalItemPrice,
        _remainingBalance = remainingBalance,
        _weightLocked = weightLocked,
        super(firestoreUtilData);

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  set productRef(DocumentReference? val) => _productRef = val;

  bool hasProductRef() => _productRef != null;

  // "total_items" field.
  int? _totalItems;
  int get totalItems => _totalItems ?? 0;
  set totalItems(int? val) => _totalItems = val;

  void incrementTotalItems(int amount) => totalItems = totalItems + amount;

  bool hasTotalItems() => _totalItems != null;

  // "price_per_product" field.
  double? _pricePerProduct;
  double get pricePerProduct => _pricePerProduct ?? 0.0;
  set pricePerProduct(double? val) => _pricePerProduct = val;

  void incrementPricePerProduct(double amount) =>
      pricePerProduct = pricePerProduct + amount;

  bool hasPricePerProduct() => _pricePerProduct != null;

  // "is_variable_weight" field.
  bool? _isVariableWeight;
  bool get isVariableWeight => _isVariableWeight ?? false;
  set isVariableWeight(bool? val) => _isVariableWeight = val;

  bool hasIsVariableWeight() => _isVariableWeight != null;

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

  // "actual_weight" field.
  double? _actualWeight;
  double get actualWeight => _actualWeight ?? 0.0;
  set actualWeight(double? val) => _actualWeight = val;

  void incrementActualWeight(double amount) =>
      actualWeight = actualWeight + amount;

  bool hasActualWeight() => _actualWeight != null;

  // "deposit_amount" field.
  double? _depositAmount;
  double get depositAmount => _depositAmount ?? 0.0;
  set depositAmount(double? val) => _depositAmount = val;

  void incrementDepositAmount(double amount) =>
      depositAmount = depositAmount + amount;

  bool hasDepositAmount() => _depositAmount != null;

  // "final_item_price" field.
  double? _finalItemPrice;
  double get finalItemPrice => _finalItemPrice ?? 0.0;
  set finalItemPrice(double? val) => _finalItemPrice = val;

  void incrementFinalItemPrice(double amount) =>
      finalItemPrice = finalItemPrice + amount;

  bool hasFinalItemPrice() => _finalItemPrice != null;

  // "remaining_balance" field.
  double? _remainingBalance;
  double get remainingBalance => _remainingBalance ?? 0.0;
  set remainingBalance(double? val) => _remainingBalance = val;

  void incrementRemainingBalance(double amount) =>
      remainingBalance = remainingBalance + amount;

  bool hasRemainingBalance() => _remainingBalance != null;

  // "weight_locked" field.
  bool? _weightLocked;
  bool get weightLocked => _weightLocked ?? false;
  set weightLocked(bool? val) => _weightLocked = val;

  bool hasWeightLocked() => _weightLocked != null;

  static OrderItemsStruct fromMap(Map<String, dynamic> data) =>
      OrderItemsStruct(
        productRef: data['product_ref'] as DocumentReference?,
        totalItems: castToType<int>(data['total_items']),
        pricePerProduct: castToType<double>(data['price_per_product']),
        isVariableWeight: data['is_variable_weight'] as bool?,
        minWeight: castToType<double>(data['min_weight']),
        maxWeight: castToType<double>(data['max_weight']),
        pricePerKg: castToType<double>(data['price_per_kg']),
        actualWeight: castToType<double>(data['actual_weight']),
        depositAmount: castToType<double>(data['deposit_amount']),
        finalItemPrice: castToType<double>(data['final_item_price']),
        remainingBalance: castToType<double>(data['remaining_balance']),
        weightLocked: data['weight_locked'] as bool?,
      );

  static OrderItemsStruct? maybeFromMap(dynamic data) => data is Map
      ? OrderItemsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'product_ref': _productRef,
        'total_items': _totalItems,
        'price_per_product': _pricePerProduct,
        'is_variable_weight': _isVariableWeight,
        'min_weight': _minWeight,
        'max_weight': _maxWeight,
        'price_per_kg': _pricePerKg,
        'actual_weight': _actualWeight,
        'deposit_amount': _depositAmount,
        'final_item_price': _finalItemPrice,
        'remaining_balance': _remainingBalance,
        'weight_locked': _weightLocked,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product_ref': serializeParam(
          _productRef,
          ParamType.DocumentReference,
        ),
        'total_items': serializeParam(
          _totalItems,
          ParamType.int,
        ),
        'price_per_product': serializeParam(
          _pricePerProduct,
          ParamType.double,
        ),
        'is_variable_weight': serializeParam(
          _isVariableWeight,
          ParamType.bool,
        ),
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
        'actual_weight': serializeParam(
          _actualWeight,
          ParamType.double,
        ),
        'deposit_amount': serializeParam(
          _depositAmount,
          ParamType.double,
        ),
        'final_item_price': serializeParam(
          _finalItemPrice,
          ParamType.double,
        ),
        'remaining_balance': serializeParam(
          _remainingBalance,
          ParamType.double,
        ),
        'weight_locked': serializeParam(
          _weightLocked,
          ParamType.bool,
        ),
      }.withoutNulls;

  static OrderItemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderItemsStruct(
        productRef: deserializeParam(
          data['product_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['product'],
        ),
        totalItems: deserializeParam(
          data['total_items'],
          ParamType.int,
          false,
        ),
        pricePerProduct: deserializeParam(
          data['price_per_product'],
          ParamType.double,
          false,
        ),
        isVariableWeight: deserializeParam(
          data['is_variable_weight'],
          ParamType.bool,
          false,
        ),
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
        actualWeight: deserializeParam(
          data['actual_weight'],
          ParamType.double,
          false,
        ),
        depositAmount: deserializeParam(
          data['deposit_amount'],
          ParamType.double,
          false,
        ),
        finalItemPrice: deserializeParam(
          data['final_item_price'],
          ParamType.double,
          false,
        ),
        remainingBalance: deserializeParam(
          data['remaining_balance'],
          ParamType.double,
          false,
        ),
        weightLocked: deserializeParam(
          data['weight_locked'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'OrderItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderItemsStruct &&
        productRef == other.productRef &&
        totalItems == other.totalItems &&
        pricePerProduct == other.pricePerProduct &&
        isVariableWeight == other.isVariableWeight &&
        minWeight == other.minWeight &&
        maxWeight == other.maxWeight &&
        pricePerKg == other.pricePerKg &&
        actualWeight == other.actualWeight &&
        depositAmount == other.depositAmount &&
        finalItemPrice == other.finalItemPrice &&
        remainingBalance == other.remainingBalance &&
        weightLocked == other.weightLocked;
  }

  @override
  int get hashCode => const ListEquality().hash([
        productRef,
        totalItems,
        pricePerProduct,
        isVariableWeight,
        minWeight,
        maxWeight,
        pricePerKg,
        actualWeight,
        depositAmount,
        finalItemPrice,
        remainingBalance,
        weightLocked
      ]);
}

OrderItemsStruct createOrderItemsStruct({
  DocumentReference? productRef,
  int? totalItems,
  double? pricePerProduct,
  bool? isVariableWeight,
  double? minWeight,
  double? maxWeight,
  double? pricePerKg,
  double? actualWeight,
  double? depositAmount,
  double? finalItemPrice,
  double? remainingBalance,
  bool? weightLocked,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderItemsStruct(
      productRef: productRef,
      totalItems: totalItems,
      pricePerProduct: pricePerProduct,
      isVariableWeight: isVariableWeight,
      minWeight: minWeight,
      maxWeight: maxWeight,
      pricePerKg: pricePerKg,
      actualWeight: actualWeight,
      depositAmount: depositAmount,
      finalItemPrice: finalItemPrice,
      remainingBalance: remainingBalance,
      weightLocked: weightLocked,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrderItemsStruct? updateOrderItemsStruct(
  OrderItemsStruct? orderItems, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    orderItems
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrderItemsStructData(
  Map<String, dynamic> firestoreData,
  OrderItemsStruct? orderItems,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orderItems == null) {
    return;
  }
  if (orderItems.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && orderItems.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderItemsData = getOrderItemsFirestoreData(orderItems, forFieldValue);
  final nestedData = orderItemsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = orderItems.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrderItemsFirestoreData(
  OrderItemsStruct? orderItems, [
  bool forFieldValue = false,
]) {
  if (orderItems == null) {
    return {};
  }
  final firestoreData = mapToFirestore(orderItems.toMap());

  // Add any Firestore field values
  mapToFirestore(orderItems.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderItemsListFirestoreData(
  List<OrderItemsStruct>? orderItemss,
) =>
    orderItemss?.map((e) => getOrderItemsFirestoreData(e, true)).toList() ?? [];

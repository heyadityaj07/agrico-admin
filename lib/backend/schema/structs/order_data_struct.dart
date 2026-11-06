// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderDataStruct extends FFFirebaseStruct {
  OrderDataStruct({
    DocumentReference? farmRef,
    List<OrderItemsStruct>? cartItems,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _farmRef = farmRef,
        _cartItems = cartItems,
        super(firestoreUtilData);

  // "farm_ref" field.
  DocumentReference? _farmRef;
  DocumentReference? get farmRef => _farmRef;
  set farmRef(DocumentReference? val) => _farmRef = val;

  bool hasFarmRef() => _farmRef != null;

  // "cart_items" field.
  List<OrderItemsStruct>? _cartItems;
  List<OrderItemsStruct> get cartItems => _cartItems ?? const [];
  set cartItems(List<OrderItemsStruct>? val) => _cartItems = val;

  void updateCartItems(Function(List<OrderItemsStruct>) updateFn) {
    updateFn(_cartItems ??= []);
  }

  bool hasCartItems() => _cartItems != null;

  static OrderDataStruct fromMap(Map<String, dynamic> data) => OrderDataStruct(
        farmRef: data['farm_ref'] as DocumentReference?,
        cartItems: getStructList(
          data['cart_items'],
          OrderItemsStruct.fromMap,
        ),
      );

  static OrderDataStruct? maybeFromMap(dynamic data) => data is Map
      ? OrderDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'farm_ref': _farmRef,
        'cart_items': _cartItems?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'farm_ref': serializeParam(
          _farmRef,
          ParamType.DocumentReference,
        ),
        'cart_items': serializeParam(
          _cartItems,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static OrderDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderDataStruct(
        farmRef: deserializeParam(
          data['farm_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['farms'],
        ),
        cartItems: deserializeStructParam<OrderItemsStruct>(
          data['cart_items'],
          ParamType.DataStruct,
          true,
          structBuilder: OrderItemsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'OrderDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OrderDataStruct &&
        farmRef == other.farmRef &&
        listEquality.equals(cartItems, other.cartItems);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([farmRef, const ListEquality().hash(cartItems)]);
}

OrderDataStruct createOrderDataStruct({
  DocumentReference? farmRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderDataStruct(
      farmRef: farmRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrderDataStruct? updateOrderDataStruct(
  OrderDataStruct? orderData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    orderData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrderDataStructData(
  Map<String, dynamic> firestoreData,
  OrderDataStruct? orderData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orderData == null) {
    return;
  }
  if (orderData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && orderData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderDataData = getOrderDataFirestoreData(orderData, forFieldValue);
  final nestedData = orderDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = orderData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrderDataFirestoreData(
  OrderDataStruct? orderData, [
  bool forFieldValue = false,
]) {
  if (orderData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(orderData.toMap());

  // Add any Firestore field values
  mapToFirestore(orderData.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderDataListFirestoreData(
  List<OrderDataStruct>? orderDatas,
) =>
    orderDatas?.map((e) => getOrderDataFirestoreData(e, true)).toList() ?? [];

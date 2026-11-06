import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartRecord extends FirestoreRecord {
  CartRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "productRef" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "price_per_product" field.
  double? _pricePerProduct;
  double get pricePerProduct => _pricePerProduct ?? 0.0;
  bool hasPricePerProduct() => _pricePerProduct != null;

  // "farm_ref" field.
  DocumentReference? _farmRef;
  DocumentReference? get farmRef => _farmRef;
  bool hasFarmRef() => _farmRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _productRef = snapshotData['productRef'] as DocumentReference?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _pricePerProduct = castToType<double>(snapshotData['price_per_product']);
    _farmRef = snapshotData['farm_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cart')
          : FirebaseFirestore.instance.collectionGroup('cart');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('cart').doc(id);

  static Stream<CartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartRecord.fromSnapshot(s));

  static Future<CartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartRecord.fromSnapshot(s));

  static CartRecord fromSnapshot(DocumentSnapshot snapshot) => CartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createCartRecordData({
  DocumentReference? productRef,
  int? quantity,
  double? pricePerProduct,
  DocumentReference? farmRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'productRef': productRef,
      'quantity': quantity,
      'price_per_product': pricePerProduct,
      'farm_ref': farmRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartRecordDocumentEquality implements Equality<CartRecord> {
  const CartRecordDocumentEquality();

  @override
  bool equals(CartRecord? e1, CartRecord? e2) {
    return e1?.productRef == e2?.productRef &&
        e1?.quantity == e2?.quantity &&
        e1?.pricePerProduct == e2?.pricePerProduct &&
        e1?.farmRef == e2?.farmRef;
  }

  @override
  int hash(CartRecord? e) => const ListEquality()
      .hash([e?.productRef, e?.quantity, e?.pricePerProduct, e?.farmRef]);

  @override
  bool isValidKey(Object? o) => o is CartRecord;
}

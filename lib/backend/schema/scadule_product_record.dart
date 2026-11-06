import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScaduleProductRecord extends FirestoreRecord {
  ScaduleProductRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "farmRef" field.
  DocumentReference? _farmRef;
  DocumentReference? get farmRef => _farmRef;
  bool hasFarmRef() => _farmRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "planted_date" field.
  DateTime? _plantedDate;
  DateTime? get plantedDate => _plantedDate;
  bool hasPlantedDate() => _plantedDate != null;

  // "expected_harvest_date" field.
  DateTime? _expectedHarvestDate;
  DateTime? get expectedHarvestDate => _expectedHarvestDate;
  bool hasExpectedHarvestDate() => _expectedHarvestDate != null;

  // "expected_quantity" field.
  double? _expectedQuantity;
  double get expectedQuantity => _expectedQuantity ?? 0.0;
  bool hasExpectedQuantity() => _expectedQuantity != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "product_type" field.
  String? _productType;
  String get productType => _productType ?? '';
  bool hasProductType() => _productType != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "product_status" field.
  String? _productStatus;
  String get productStatus => _productStatus ?? '';
  bool hasProductStatus() => _productStatus != null;

  // "is_suspend" field.
  bool? _isSuspend;
  bool get isSuspend => _isSuspend ?? false;
  bool hasIsSuspend() => _isSuspend != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _farmRef = snapshotData['farmRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _address = snapshotData['address'] as String?;
    _plantedDate = snapshotData['planted_date'] as DateTime?;
    _expectedHarvestDate = snapshotData['expected_harvest_date'] as DateTime?;
    _expectedQuantity = castToType<double>(snapshotData['expected_quantity']);
    _unit = snapshotData['unit'] as String?;
    _productType = snapshotData['product_type'] as String?;
    _image = snapshotData['image'] as String?;
    _productStatus = snapshotData['product_status'] as String?;
    _isSuspend = snapshotData['is_suspend'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('scadule_product');

  static Stream<ScaduleProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScaduleProductRecord.fromSnapshot(s));

  static Future<ScaduleProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScaduleProductRecord.fromSnapshot(s));

  static ScaduleProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ScaduleProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScaduleProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScaduleProductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScaduleProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScaduleProductRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createScaduleProductRecordData({
  DateTime? createdAt,
  DocumentReference? farmRef,
  DocumentReference? userRef,
  String? name,
  String? address,
  DateTime? plantedDate,
  DateTime? expectedHarvestDate,
  double? expectedQuantity,
  String? unit,
  String? productType,
  String? image,
  String? productStatus,
  bool? isSuspend,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'farmRef': farmRef,
      'userRef': userRef,
      'name': name,
      'address': address,
      'planted_date': plantedDate,
      'expected_harvest_date': expectedHarvestDate,
      'expected_quantity': expectedQuantity,
      'unit': unit,
      'product_type': productType,
      'image': image,
      'product_status': productStatus,
      'is_suspend': isSuspend,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScaduleProductRecordDocumentEquality
    implements Equality<ScaduleProductRecord> {
  const ScaduleProductRecordDocumentEquality();

  @override
  bool equals(ScaduleProductRecord? e1, ScaduleProductRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.farmRef == e2?.farmRef &&
        e1?.userRef == e2?.userRef &&
        e1?.name == e2?.name &&
        e1?.address == e2?.address &&
        e1?.plantedDate == e2?.plantedDate &&
        e1?.expectedHarvestDate == e2?.expectedHarvestDate &&
        e1?.expectedQuantity == e2?.expectedQuantity &&
        e1?.unit == e2?.unit &&
        e1?.productType == e2?.productType &&
        e1?.image == e2?.image &&
        e1?.productStatus == e2?.productStatus &&
        e1?.isSuspend == e2?.isSuspend;
  }

  @override
  int hash(ScaduleProductRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.farmRef,
        e?.userRef,
        e?.name,
        e?.address,
        e?.plantedDate,
        e?.expectedHarvestDate,
        e?.expectedQuantity,
        e?.unit,
        e?.productType,
        e?.image,
        e?.productStatus,
        e?.isSuspend
      ]);

  @override
  bool isValidKey(Object? o) => o is ScaduleProductRecord;
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductRecord extends FirestoreRecord {
  ProductRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "stock_quantity" field.
  int? _stockQuantity;
  int get stockQuantity => _stockQuantity ?? 0;
  bool hasStockQuantity() => _stockQuantity != null;

  // "batch_information" field.
  String? _batchInformation;
  String get batchInformation => _batchInformation ?? '';
  bool hasBatchInformation() => _batchInformation != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "farm_ref" field.
  DocumentReference? _farmRef;
  DocumentReference? get farmRef => _farmRef;
  bool hasFarmRef() => _farmRef != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "submited_date" field.
  DateTime? _submitedDate;
  DateTime? get submitedDate => _submitedDate;
  bool hasSubmitedDate() => _submitedDate != null;

  // "product_status" field.
  String? _productStatus;
  String get productStatus => _productStatus ?? '';
  bool hasProductStatus() => _productStatus != null;

  // "total_stock" field.
  int? _totalStock;
  int get totalStock => _totalStock ?? 0;
  bool hasTotalStock() => _totalStock != null;

  // "storage_type" field.
  String? _storageType;
  String get storageType => _storageType ?? '';
  bool hasStorageType() => _storageType != null;

  // "sesson" field.
  List<String>? _sesson;
  List<String> get sesson => _sesson ?? const [];
  bool hasSesson() => _sesson != null;

  // "approval_status" field.
  bool? _approvalStatus;
  bool get approvalStatus => _approvalStatus ?? false;
  bool hasApprovalStatus() => _approvalStatus != null;

  // "product_image" field.
  String? _productImage;
  String get productImage => _productImage ?? '';
  bool hasProductImage() => _productImage != null;

  // "active_status" field.
  bool? _activeStatus;
  bool get activeStatus => _activeStatus ?? false;
  bool hasActiveStatus() => _activeStatus != null;

  // "badges" field.
  List<String>? _badges;
  List<String> get badges => _badges ?? const [];
  bool hasBadges() => _badges != null;

  // "rejection_reason" field.
  String? _rejectionReason;
  String get rejectionReason => _rejectionReason ?? '';
  bool hasRejectionReason() => _rejectionReason != null;

  // "farm_location" field.
  LatLng? _farmLocation;
  LatLng? get farmLocation => _farmLocation;
  bool hasFarmLocation() => _farmLocation != null;

  // "is_suspend" field.
  bool? _isSuspend;
  bool get isSuspend => _isSuspend ?? false;
  bool hasIsSuspend() => _isSuspend != null;

  // "is_variable_weight" field.
  bool? _isVariableWeight;
  bool get isVariableWeight => _isVariableWeight ?? false;
  bool hasIsVariableWeight() => _isVariableWeight != null;

  // "product_weight" field.
  List<ProductWeightStruct>? _productWeight;
  List<ProductWeightStruct> get productWeight => _productWeight ?? const [];
  bool hasProductWeight() => _productWeight != null;

  void _initializeFields() {
    _productName = snapshotData['product_name'] as String?;
    _description = snapshotData['description'] as String?;
    _stockQuantity = castToType<int>(snapshotData['stock_quantity']);
    _batchInformation = snapshotData['batch_information'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _unit = snapshotData['unit'] as String?;
    _category = snapshotData['category'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _farmRef = snapshotData['farm_ref'] as DocumentReference?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _submitedDate = snapshotData['submited_date'] as DateTime?;
    _productStatus = snapshotData['product_status'] as String?;
    _totalStock = castToType<int>(snapshotData['total_stock']);
    _storageType = snapshotData['storage_type'] as String?;
    _sesson = getDataList(snapshotData['sesson']);
    _approvalStatus = snapshotData['approval_status'] as bool?;
    _productImage = snapshotData['product_image'] as String?;
    _activeStatus = snapshotData['active_status'] as bool?;
    _badges = getDataList(snapshotData['badges']);
    _rejectionReason = snapshotData['rejection_reason'] as String?;
    _farmLocation = snapshotData['farm_location'] as LatLng?;
    _isSuspend = snapshotData['is_suspend'] as bool?;
    _isVariableWeight = snapshotData['is_variable_weight'] as bool?;
    _productWeight = getStructList(
      snapshotData['product_weight'],
      ProductWeightStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product');

  static Stream<ProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductRecord.fromSnapshot(s));

  static Future<ProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductRecord.fromSnapshot(s));

  static ProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createProductRecordData({
  String? productName,
  String? description,
  int? stockQuantity,
  String? batchInformation,
  double? price,
  String? unit,
  String? category,
  DateTime? createdAt,
  DocumentReference? farmRef,
  DocumentReference? userRef,
  DateTime? submitedDate,
  String? productStatus,
  int? totalStock,
  String? storageType,
  bool? approvalStatus,
  String? productImage,
  bool? activeStatus,
  String? rejectionReason,
  LatLng? farmLocation,
  bool? isSuspend,
  bool? isVariableWeight,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product_name': productName,
      'description': description,
      'stock_quantity': stockQuantity,
      'batch_information': batchInformation,
      'price': price,
      'unit': unit,
      'category': category,
      'created_at': createdAt,
      'farm_ref': farmRef,
      'user_ref': userRef,
      'submited_date': submitedDate,
      'product_status': productStatus,
      'total_stock': totalStock,
      'storage_type': storageType,
      'approval_status': approvalStatus,
      'product_image': productImage,
      'active_status': activeStatus,
      'rejection_reason': rejectionReason,
      'farm_location': farmLocation,
      'is_suspend': isSuspend,
      'is_variable_weight': isVariableWeight,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductRecordDocumentEquality implements Equality<ProductRecord> {
  const ProductRecordDocumentEquality();

  @override
  bool equals(ProductRecord? e1, ProductRecord? e2) {
    const listEquality = ListEquality();
    return e1?.productName == e2?.productName &&
        e1?.description == e2?.description &&
        e1?.stockQuantity == e2?.stockQuantity &&
        e1?.batchInformation == e2?.batchInformation &&
        e1?.price == e2?.price &&
        e1?.unit == e2?.unit &&
        e1?.category == e2?.category &&
        e1?.createdAt == e2?.createdAt &&
        e1?.farmRef == e2?.farmRef &&
        e1?.userRef == e2?.userRef &&
        e1?.submitedDate == e2?.submitedDate &&
        e1?.productStatus == e2?.productStatus &&
        e1?.totalStock == e2?.totalStock &&
        e1?.storageType == e2?.storageType &&
        listEquality.equals(e1?.sesson, e2?.sesson) &&
        e1?.approvalStatus == e2?.approvalStatus &&
        e1?.productImage == e2?.productImage &&
        e1?.activeStatus == e2?.activeStatus &&
        listEquality.equals(e1?.badges, e2?.badges) &&
        e1?.rejectionReason == e2?.rejectionReason &&
        e1?.farmLocation == e2?.farmLocation &&
        e1?.isSuspend == e2?.isSuspend &&
        e1?.isVariableWeight == e2?.isVariableWeight &&
        listEquality.equals(e1?.productWeight, e2?.productWeight);
  }

  @override
  int hash(ProductRecord? e) => const ListEquality().hash([
        e?.productName,
        e?.description,
        e?.stockQuantity,
        e?.batchInformation,
        e?.price,
        e?.unit,
        e?.category,
        e?.createdAt,
        e?.farmRef,
        e?.userRef,
        e?.submitedDate,
        e?.productStatus,
        e?.totalStock,
        e?.storageType,
        const ListEquality().hash(e?.sesson),
        e?.approvalStatus,
        e?.productImage,
        e?.activeStatus,
        const ListEquality().hash(e?.badges),
        e?.rejectionReason,
        e?.farmLocation,
        e?.isSuspend,
        e?.isVariableWeight,
        const ListEquality().hash(e?.productWeight)
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductRecord;
}

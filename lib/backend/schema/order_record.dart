import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "total_ammount" field.
  double? _totalAmmount;
  double get totalAmmount => _totalAmmount ?? 0.0;
  bool hasTotalAmmount() => _totalAmmount != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "voucher_code" field.
  String? _voucherCode;
  String get voucherCode => _voucherCode ?? '';
  bool hasVoucherCode() => _voucherCode != null;

  // "sub_total" field.
  double? _subTotal;
  double get subTotal => _subTotal ?? 0.0;
  bool hasSubTotal() => _subTotal != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;
  String? get currencyOrNull => _currency;

  // "service_fee" field.
  double? _serviceFee;
  double get serviceFee => _serviceFee ?? 0.0;
  bool hasServiceFee() => _serviceFee != null;

  // "delivery_tip" field.
  double? _deliveryTip;
  double get deliveryTip => _deliveryTip ?? 0.0;
  bool hasDeliveryTip() => _deliveryTip != null;

  // "delivery_fee" field.
  double? _deliveryFee;
  double get deliveryFee => _deliveryFee ?? 0.0;
  bool hasDeliveryFee() => _deliveryFee != null;

  // "tax" field.
  double? _tax;
  double get tax => _tax ?? 0.0;
  bool hasTax() => _tax != null;

  // "delievry_address" field.
  DeliveryAdressStruct? _delievryAddress;
  DeliveryAdressStruct get delievryAddress =>
      _delievryAddress ?? DeliveryAdressStruct();
  bool hasDelievryAddress() => _delievryAddress != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "delievry_method" field.
  String? _delievryMethod;
  String get delievryMethod => _delievryMethod ?? '';
  bool hasDelievryMethod() => _delievryMethod != null;

  // "delievry_time" field.
  String? _delievryTime;
  String get delievryTime => _delievryTime ?? '';
  bool hasDelievryTime() => _delievryTime != null;

  // "order_status" field.
  String? _orderStatus;
  String get orderStatus => _orderStatus ?? '';
  bool hasOrderStatus() => _orderStatus != null;

  // "order_items" field.
  List<OrderItemsStruct>? _orderItems;
  List<OrderItemsStruct> get orderItems => _orderItems ?? const [];
  bool hasOrderItems() => _orderItems != null;

  // "farm_ref" field.
  DocumentReference? _farmRef;
  DocumentReference? get farmRef => _farmRef;
  bool hasFarmRef() => _farmRef != null;

  // "order_confiramtion_time" field.
  DateTime? _orderConfiramtionTime;
  DateTime? get orderConfiramtionTime => _orderConfiramtionTime;
  bool hasOrderConfiramtionTime() => _orderConfiramtionTime != null;

  // "Preparing_time" field.
  DateTime? _preparingTime;
  DateTime? get preparingTime => _preparingTime;
  bool hasPreparingTime() => _preparingTime != null;

  // "PickedUp_time" field.
  DateTime? _pickedUpTime;
  DateTime? get pickedUpTime => _pickedUpTime;
  bool hasPickedUpTime() => _pickedUpTime != null;

  // "InTransit_time" field.
  DateTime? _inTransitTime;
  DateTime? get inTransitTime => _inTransitTime;
  bool hasInTransitTime() => _inTransitTime != null;

  // "Delivered_time" field.
  DateTime? _deliveredTime;
  DateTime? get deliveredTime => _deliveredTime;
  bool hasDeliveredTime() => _deliveredTime != null;

  // "levae_review" field.
  bool? _levaeReview;
  bool get levaeReview => _levaeReview ?? false;
  bool hasLevaeReview() => _levaeReview != null;

  // "review" field.
  ReviewStruct? _review;
  ReviewStruct get review => _review ?? ReviewStruct();
  bool hasReview() => _review != null;

  // "is_suspend" field.
  bool? _isSuspend;
  bool get isSuspend => _isSuspend ?? false;
  bool hasIsSuspend() => _isSuspend != null;

  void _initializeFields() {
    _totalAmmount = castToType<double>(snapshotData['total_ammount']);
    _note = snapshotData['note'] as String?;
    _voucherCode = snapshotData['voucher_code'] as String?;
    _subTotal = castToType<double>(snapshotData['sub_total']);
    _currency = snapshotData['currency'] as String?;
    _serviceFee = castToType<double>(snapshotData['service_fee']);
    _deliveryTip = castToType<double>(snapshotData['delivery_tip']);
    _deliveryFee = castToType<double>(snapshotData['delivery_fee']);
    _tax = castToType<double>(snapshotData['tax']);
    _delievryAddress = snapshotData['delievry_address'] is DeliveryAdressStruct
        ? snapshotData['delievry_address']
        : DeliveryAdressStruct.maybeFromMap(snapshotData['delievry_address']);
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _delievryMethod = snapshotData['delievry_method'] as String?;
    _delievryTime = snapshotData['delievry_time'] as String?;
    _orderStatus = snapshotData['order_status'] as String?;
    _orderItems = getStructList(
      snapshotData['order_items'],
      OrderItemsStruct.fromMap,
    );
    _farmRef = snapshotData['farm_ref'] as DocumentReference?;
    _orderConfiramtionTime =
        snapshotData['order_confiramtion_time'] as DateTime?;
    _preparingTime = snapshotData['Preparing_time'] as DateTime?;
    _pickedUpTime = snapshotData['PickedUp_time'] as DateTime?;
    _inTransitTime = snapshotData['InTransit_time'] as DateTime?;
    _deliveredTime = snapshotData['Delivered_time'] as DateTime?;
    _levaeReview = snapshotData['levae_review'] as bool?;
    _review = snapshotData['review'] is ReviewStruct
        ? snapshotData['review']
        : ReviewStruct.maybeFromMap(snapshotData['review']);
    _isSuspend = snapshotData['is_suspend'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createOrderRecordData({
  double? totalAmmount,
  String? note,
  String? voucherCode,
  double? subTotal,
  double? serviceFee,
  double? deliveryTip,
  double? deliveryFee,
  double? tax,
  DeliveryAdressStruct? delievryAddress,
  DocumentReference? userRef,
  DateTime? createdAt,
  String? delievryMethod,
  String? delievryTime,
  String? orderStatus,
  DocumentReference? farmRef,
  DateTime? orderConfiramtionTime,
  DateTime? preparingTime,
  DateTime? pickedUpTime,
  DateTime? inTransitTime,
  DateTime? deliveredTime,
  bool? levaeReview,
  ReviewStruct? review,
  String? currency,
  bool? isSuspend,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'total_ammount': totalAmmount,
      'note': note,
      'voucher_code': voucherCode,
      'sub_total': subTotal,
      'service_fee': serviceFee,
      'delivery_tip': deliveryTip,
      'delivery_fee': deliveryFee,
      'tax': tax,
      'delievry_address': DeliveryAdressStruct().toMap(),
      'user_ref': userRef,
      'created_at': createdAt,
      'delievry_method': delievryMethod,
      'delievry_time': delievryTime,
      'order_status': orderStatus,
      'farm_ref': farmRef,
      'order_confiramtion_time': orderConfiramtionTime,
      'Preparing_time': preparingTime,
      'PickedUp_time': pickedUpTime,
      'InTransit_time': inTransitTime,
      'Delivered_time': deliveredTime,
      'levae_review': levaeReview,
      'review': ReviewStruct().toMap(),
      'currency': currency,
      'is_suspend': isSuspend,
    }.withoutNulls,
  );

  // Handle nested data for "delievry_address" field.
  addDeliveryAdressStructData(
      firestoreData, delievryAddress, 'delievry_address');

  // Handle nested data for "review" field.
  addReviewStructData(firestoreData, review, 'review');

  return firestoreData;
}

class OrderRecordDocumentEquality implements Equality<OrderRecord> {
  const OrderRecordDocumentEquality();

  @override
  bool equals(OrderRecord? e1, OrderRecord? e2) {
    const listEquality = ListEquality();
    return e1?.totalAmmount == e2?.totalAmmount &&
        e1?.note == e2?.note &&
        e1?.voucherCode == e2?.voucherCode &&
        e1?.subTotal == e2?.subTotal &&
        e1?.serviceFee == e2?.serviceFee &&
        e1?.deliveryTip == e2?.deliveryTip &&
        e1?.deliveryFee == e2?.deliveryFee &&
        e1?.tax == e2?.tax &&
        e1?.delievryAddress == e2?.delievryAddress &&
        e1?.userRef == e2?.userRef &&
        e1?.createdAt == e2?.createdAt &&
        e1?.delievryMethod == e2?.delievryMethod &&
        e1?.delievryTime == e2?.delievryTime &&
        e1?.orderStatus == e2?.orderStatus &&
        listEquality.equals(e1?.orderItems, e2?.orderItems) &&
        e1?.farmRef == e2?.farmRef &&
        e1?.orderConfiramtionTime == e2?.orderConfiramtionTime &&
        e1?.preparingTime == e2?.preparingTime &&
        e1?.pickedUpTime == e2?.pickedUpTime &&
        e1?.inTransitTime == e2?.inTransitTime &&
        e1?.deliveredTime == e2?.deliveredTime &&
        e1?.levaeReview == e2?.levaeReview &&
        e1?.review == e2?.review &&
        e1?.currency == e2?.currency &&
        e1?.isSuspend == e2?.isSuspend;
  }

  @override
  int hash(OrderRecord? e) => const ListEquality().hash([
        e?.totalAmmount,
        e?.note,
        e?.voucherCode,
        e?.subTotal,
        e?.serviceFee,
        e?.deliveryTip,
        e?.deliveryFee,
        e?.tax,
        e?.delievryAddress,
        e?.userRef,
        e?.createdAt,
        e?.delievryMethod,
        e?.delievryTime,
        e?.orderStatus,
        const ListEquality().hash(e?.orderItems),
        e?.farmRef,
        e?.orderConfiramtionTime,
        e?.preparingTime,
        e?.pickedUpTime,
        e?.inTransitTime,
        e?.deliveredTime,
        e?.levaeReview,
        e?.review,
        e?.currency,
        e?.isSuspend
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderRecord;
}

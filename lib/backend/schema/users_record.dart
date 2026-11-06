import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "my_favourite_prodcut" field.
  List<DocumentReference>? _myFavouriteProdcut;
  List<DocumentReference> get myFavouriteProdcut =>
      _myFavouriteProdcut ?? const [];
  bool hasMyFavouriteProdcut() => _myFavouriteProdcut != null;

  // "my_favourite_farm" field.
  List<DocumentReference>? _myFavouriteFarm;
  List<DocumentReference> get myFavouriteFarm => _myFavouriteFarm ?? const [];
  bool hasMyFavouriteFarm() => _myFavouriteFarm != null;

  // "delivery_Addresses" field.
  List<DeliveryAdressStruct>? _deliveryAddresses;
  List<DeliveryAdressStruct> get deliveryAddresses =>
      _deliveryAddresses ?? const [];
  bool hasDeliveryAddresses() => _deliveryAddresses != null;

  // "default_adress" field.
  int? _defaultAdress;
  int get defaultAdress => _defaultAdress ?? 0;
  bool hasDefaultAdress() => _defaultAdress != null;

  // "is_suspend" field.
  bool? _isSuspend;
  bool get isSuspend => _isSuspend ?? false;
  bool hasIsSuspend() => _isSuspend != null;

  // "sub_role" field.
  String? _subRole;
  String get subRole => _subRole ?? '';
  bool hasSubRole() => _subRole != null;

  // "unique_key" field.
  String? _uniqueKey;
  String get uniqueKey => _uniqueKey ?? '';
  bool hasUniqueKey() => _uniqueKey != null;

  // "subscriptionPlanName" field.
  String? _subscriptionPlanName;
  String get subscriptionPlanName => _subscriptionPlanName ?? '';
  bool hasSubscriptionPlanName() => _subscriptionPlanName != null;

  // "subscriptionActive" field.
  bool? _subscriptionActive;
  bool get subscriptionActive => _subscriptionActive ?? false;
  bool hasSubscriptionActive() => _subscriptionActive != null;

  // "stripeCustomerId" field.
  String? _stripeCustomerId;
  String get stripeCustomerId => _stripeCustomerId ?? '';
  bool hasStripeCustomerId() => _stripeCustomerId != null;

  // "subscriptionId" field.
  String? _subscriptionId;
  String get subscriptionId => _subscriptionId ?? '';
  bool hasSubscriptionId() => _subscriptionId != null;

  // "subscriptionStatus" field.
  String? _subscriptionStatus;
  String get subscriptionStatus => _subscriptionStatus ?? '';
  bool hasSubscriptionStatus() => _subscriptionStatus != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _role = snapshotData['role'] as String?;
    _myFavouriteProdcut = getDataList(snapshotData['my_favourite_prodcut']);
    _myFavouriteFarm = getDataList(snapshotData['my_favourite_farm']);
    _deliveryAddresses = getStructList(
      snapshotData['delivery_Addresses'],
      DeliveryAdressStruct.fromMap,
    );
    _defaultAdress = castToType<int>(snapshotData['default_adress']);
    _isSuspend = snapshotData['is_suspend'] as bool?;
    _subRole = snapshotData['sub_role'] as String?;
    _uniqueKey = snapshotData['unique_key'] as String?;
    _subscriptionPlanName = snapshotData['subscriptionPlanName'] as String?;
    _subscriptionActive = snapshotData['subscriptionActive'] as bool?;
    _stripeCustomerId = snapshotData['stripeCustomerId'] as String?;
    _subscriptionId = snapshotData['subscriptionId'] as String?;
    _subscriptionStatus = snapshotData['subscriptionStatus'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? role,
  int? defaultAdress,
  bool? isSuspend,
  String? subRole,
  String? uniqueKey,
  String? subscriptionPlanName,
  bool? subscriptionActive,
  String? stripeCustomerId,
  String? subscriptionId,
  String? subscriptionStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'role': role,
      'default_adress': defaultAdress,
      'is_suspend': isSuspend,
      'sub_role': subRole,
      'unique_key': uniqueKey,
      'subscriptionPlanName': subscriptionPlanName,
      'subscriptionActive': subscriptionActive,
      'stripeCustomerId': stripeCustomerId,
      'subscriptionId': subscriptionId,
      'subscriptionStatus': subscriptionStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.role == e2?.role &&
        listEquality.equals(e1?.myFavouriteProdcut, e2?.myFavouriteProdcut) &&
        listEquality.equals(e1?.myFavouriteFarm, e2?.myFavouriteFarm) &&
        listEquality.equals(e1?.deliveryAddresses, e2?.deliveryAddresses) &&
        e1?.defaultAdress == e2?.defaultAdress &&
        e1?.isSuspend == e2?.isSuspend &&
        e1?.subRole == e2?.subRole &&
        e1?.uniqueKey == e2?.uniqueKey &&
        e1?.subscriptionPlanName == e2?.subscriptionPlanName &&
        e1?.subscriptionActive == e2?.subscriptionActive &&
        e1?.stripeCustomerId == e2?.stripeCustomerId &&
        e1?.subscriptionId == e2?.subscriptionId &&
        e1?.subscriptionStatus == e2?.subscriptionStatus;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.role,
        const ListEquality().hash(e?.myFavouriteProdcut),
        const ListEquality().hash(e?.myFavouriteFarm),
        const ListEquality().hash(e?.deliveryAddresses),
        e?.defaultAdress,
        e?.isSuspend,
        e?.subRole,
        e?.uniqueKey,
        e?.subscriptionPlanName,
        e?.subscriptionActive,
        e?.stripeCustomerId,
        e?.subscriptionId,
        e?.subscriptionStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}

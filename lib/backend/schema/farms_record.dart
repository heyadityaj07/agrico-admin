import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FarmsRecord extends FirestoreRecord {
  FarmsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "farm_profile_photo" field.
  String? _farmProfilePhoto;
  String get farmProfilePhoto => _farmProfilePhoto ?? '';
  bool hasFarmProfilePhoto() => _farmProfilePhoto != null;

  // "farm_photos" field.
  List<String>? _farmPhotos;
  List<String> get farmPhotos => _farmPhotos ?? const [];
  bool hasFarmPhotos() => _farmPhotos != null;

  // "farm_name" field.
  String? _farmName;
  String get farmName => _farmName ?? '';
  bool hasFarmName() => _farmName != null;

  // "farm_type" field.
  String? _farmType;
  String get farmType => _farmType ?? '';
  bool hasFarmType() => _farmType != null;

  // "established_year" field.
  int? _establishedYear;
  int get establishedYear => _establishedYear ?? 0;
  bool hasEstablishedYear() => _establishedYear != null;

  // "farm_size" field.
  double? _farmSize;
  double get farmSize => _farmSize ?? 0.0;
  bool hasFarmSize() => _farmSize != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "about_farm" field.
  String? _aboutFarm;
  String get aboutFarm => _aboutFarm ?? '';
  bool hasAboutFarm() => _aboutFarm != null;

  // "farm_specialities" field.
  List<String>? _farmSpecialities;
  List<String> get farmSpecialities => _farmSpecialities ?? const [];
  bool hasFarmSpecialities() => _farmSpecialities != null;

  // "farm_practices" field.
  List<String>? _farmPractices;
  List<String> get farmPractices => _farmPractices ?? const [];
  bool hasFarmPractices() => _farmPractices != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "contact_phone_no" field.
  String? _contactPhoneNo;
  String get contactPhoneNo => _contactPhoneNo ?? '';
  bool hasContactPhoneNo() => _contactPhoneNo != null;

  // "contact_email" field.
  String? _contactEmail;
  String get contactEmail => _contactEmail ?? '';
  bool hasContactEmail() => _contactEmail != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "approval_status" field.
  bool? _approvalStatus;
  bool get approvalStatus => _approvalStatus ?? false;
  bool hasApprovalStatus() => _approvalStatus != null;

  // "submited" field.
  bool? _submited;
  bool get submited => _submited ?? false;
  bool hasSubmited() => _submited != null;

  // "organic_certific" field.
  UploaddataStruct? _organicCertific;
  UploaddataStruct get organicCertific =>
      _organicCertific ?? UploaddataStruct();
  bool hasOrganicCertific() => _organicCertific != null;

  // "government_id" field.
  UploaddataStruct? _governmentId;
  UploaddataStruct get governmentId => _governmentId ?? UploaddataStruct();
  bool hasGovernmentId() => _governmentId != null;

  // "farm_license" field.
  UploaddataStruct? _farmLicense;
  UploaddataStruct get farmLicense => _farmLicense ?? UploaddataStruct();
  bool hasFarmLicense() => _farmLicense != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "farming_Method" field.
  List<String>? _farmingMethod;
  List<String> get farmingMethod => _farmingMethod ?? const [];
  bool hasFarmingMethod() => _farmingMethod != null;

  // "farm_location" field.
  LatLng? _farmLocation;
  LatLng? get farmLocation => _farmLocation;
  bool hasFarmLocation() => _farmLocation != null;

  // "approval_type" field.
  String? _approvalType;
  String get approvalType => _approvalType ?? '';
  bool hasApprovalType() => _approvalType != null;

  // "submitted_date" field.
  DateTime? _submittedDate;
  DateTime? get submittedDate => _submittedDate;
  bool hasSubmittedDate() => _submittedDate != null;

  // "rejection_reson" field.
  String? _rejectionReson;
  String get rejectionReson => _rejectionReson ?? '';
  bool hasRejectionReson() => _rejectionReson != null;

  // "is_suspend" field.
  bool? _isSuspend;
  bool get isSuspend => _isSuspend ?? false;
  bool hasIsSuspend() => _isSuspend != null;

  // "farm_availability" field.
  List<FarmAvailabilityStruct>? _farmAvailability;
  List<FarmAvailabilityStruct> get farmAvailability =>
      _farmAvailability ?? const [];
  bool hasFarmAvailability() => _farmAvailability != null;

  // "farm_address" field.
  String? _farmAddress;
  String get farmAddress => _farmAddress ?? '';
  bool hasFarmAddress() => _farmAddress != null;

  // "Doyouofferyourowndeliveryservice" field.
  bool? _doyouofferyourowndeliveryservice;
  bool get doyouofferyourowndeliveryservice =>
      _doyouofferyourowndeliveryservice ?? false;
  bool hasDoyouofferyourowndeliveryservice() =>
      _doyouofferyourowndeliveryservice != null;

  void _initializeFields() {
    _farmProfilePhoto = snapshotData['farm_profile_photo'] as String?;
    _farmPhotos = getDataList(snapshotData['farm_photos']);
    _farmName = snapshotData['farm_name'] as String?;
    _farmType = snapshotData['farm_type'] as String?;
    _establishedYear = castToType<int>(snapshotData['established_year']);
    _farmSize = castToType<double>(snapshotData['farm_size']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _aboutFarm = snapshotData['about_farm'] as String?;
    _farmSpecialities = getDataList(snapshotData['farm_specialities']);
    _farmPractices = getDataList(snapshotData['farm_practices']);
    _state = snapshotData['state'] as String?;
    _contactPhoneNo = snapshotData['contact_phone_no'] as String?;
    _contactEmail = snapshotData['contact_email'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _approvalStatus = snapshotData['approval_status'] as bool?;
    _submited = snapshotData['submited'] as bool?;
    _organicCertific = snapshotData['organic_certific'] is UploaddataStruct
        ? snapshotData['organic_certific']
        : UploaddataStruct.maybeFromMap(snapshotData['organic_certific']);
    _governmentId = snapshotData['government_id'] is UploaddataStruct
        ? snapshotData['government_id']
        : UploaddataStruct.maybeFromMap(snapshotData['government_id']);
    _farmLicense = snapshotData['farm_license'] is UploaddataStruct
        ? snapshotData['farm_license']
        : UploaddataStruct.maybeFromMap(snapshotData['farm_license']);
    _website = snapshotData['website'] as String?;
    _farmingMethod = getDataList(snapshotData['farming_Method']);
    _farmLocation = snapshotData['farm_location'] as LatLng?;
    _approvalType = snapshotData['approval_type'] as String?;
    _submittedDate = snapshotData['submitted_date'] as DateTime?;
    _rejectionReson = snapshotData['rejection_reson'] as String?;
    _isSuspend = snapshotData['is_suspend'] as bool?;
    _farmAvailability = getStructList(
      snapshotData['farm_availability'],
      FarmAvailabilityStruct.fromMap,
    );
    _farmAddress = snapshotData['farm_address'] as String?;
    _doyouofferyourowndeliveryservice =
        snapshotData['Doyouofferyourowndeliveryservice'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('farms');

  static Stream<FarmsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FarmsRecord.fromSnapshot(s));

  static Future<FarmsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FarmsRecord.fromSnapshot(s));

  static FarmsRecord fromSnapshot(DocumentSnapshot snapshot) => FarmsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FarmsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FarmsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FarmsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FarmsRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createFarmsRecordData({
  String? farmProfilePhoto,
  String? farmName,
  String? farmType,
  int? establishedYear,
  double? farmSize,
  String? phoneNumber,
  String? aboutFarm,
  String? state,
  String? contactPhoneNo,
  String? contactEmail,
  DocumentReference? userRef,
  DateTime? createdAt,
  bool? approvalStatus,
  bool? submited,
  UploaddataStruct? organicCertific,
  UploaddataStruct? governmentId,
  UploaddataStruct? farmLicense,
  String? website,
  LatLng? farmLocation,
  String? approvalType,
  DateTime? submittedDate,
  String? rejectionReson,
  bool? isSuspend,
  String? farmAddress,
  bool? doyouofferyourowndeliveryservice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'farm_profile_photo': farmProfilePhoto,
      'farm_name': farmName,
      'farm_type': farmType,
      'established_year': establishedYear,
      'farm_size': farmSize,
      'phone_number': phoneNumber,
      'about_farm': aboutFarm,
      'state': state,
      'contact_phone_no': contactPhoneNo,
      'contact_email': contactEmail,
      'user_ref': userRef,
      'created_at': createdAt,
      'approval_status': approvalStatus,
      'submited': submited,
      'organic_certific': UploaddataStruct().toMap(),
      'government_id': UploaddataStruct().toMap(),
      'farm_license': UploaddataStruct().toMap(),
      'website': website,
      'farm_location': farmLocation,
      'approval_type': approvalType,
      'submitted_date': submittedDate,
      'rejection_reson': rejectionReson,
      'is_suspend': isSuspend,
      'farm_address': farmAddress,
      'Doyouofferyourowndeliveryservice': doyouofferyourowndeliveryservice,
    }.withoutNulls,
  );

  // Handle nested data for "organic_certific" field.
  addUploaddataStructData(firestoreData, organicCertific, 'organic_certific');

  // Handle nested data for "government_id" field.
  addUploaddataStructData(firestoreData, governmentId, 'government_id');

  // Handle nested data for "farm_license" field.
  addUploaddataStructData(firestoreData, farmLicense, 'farm_license');

  return firestoreData;
}

class FarmsRecordDocumentEquality implements Equality<FarmsRecord> {
  const FarmsRecordDocumentEquality();

  @override
  bool equals(FarmsRecord? e1, FarmsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.farmProfilePhoto == e2?.farmProfilePhoto &&
        listEquality.equals(e1?.farmPhotos, e2?.farmPhotos) &&
        e1?.farmName == e2?.farmName &&
        e1?.farmType == e2?.farmType &&
        e1?.establishedYear == e2?.establishedYear &&
        e1?.farmSize == e2?.farmSize &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.aboutFarm == e2?.aboutFarm &&
        listEquality.equals(e1?.farmSpecialities, e2?.farmSpecialities) &&
        listEquality.equals(e1?.farmPractices, e2?.farmPractices) &&
        e1?.state == e2?.state &&
        e1?.contactPhoneNo == e2?.contactPhoneNo &&
        e1?.contactEmail == e2?.contactEmail &&
        e1?.userRef == e2?.userRef &&
        e1?.createdAt == e2?.createdAt &&
        e1?.approvalStatus == e2?.approvalStatus &&
        e1?.submited == e2?.submited &&
        e1?.organicCertific == e2?.organicCertific &&
        e1?.governmentId == e2?.governmentId &&
        e1?.farmLicense == e2?.farmLicense &&
        e1?.website == e2?.website &&
        listEquality.equals(e1?.farmingMethod, e2?.farmingMethod) &&
        e1?.farmLocation == e2?.farmLocation &&
        e1?.approvalType == e2?.approvalType &&
        e1?.submittedDate == e2?.submittedDate &&
        e1?.rejectionReson == e2?.rejectionReson &&
        e1?.isSuspend == e2?.isSuspend &&
        listEquality.equals(e1?.farmAvailability, e2?.farmAvailability) &&
        e1?.farmAddress == e2?.farmAddress &&
        e1?.doyouofferyourowndeliveryservice ==
            e2?.doyouofferyourowndeliveryservice;
  }

  @override
  int hash(FarmsRecord? e) => const ListEquality().hash([
        e?.farmProfilePhoto,
        const ListEquality().hash(e?.farmPhotos),
        e?.farmName,
        e?.farmType,
        e?.establishedYear,
        e?.farmSize,
        e?.phoneNumber,
        e?.aboutFarm,
        const ListEquality().hash(e?.farmSpecialities),
        const ListEquality().hash(e?.farmPractices),
        e?.state,
        e?.contactPhoneNo,
        e?.contactEmail,
        e?.userRef,
        e?.createdAt,
        e?.approvalStatus,
        e?.submited,
        e?.organicCertific,
        e?.governmentId,
        e?.farmLicense,
        e?.website,
        const ListEquality().hash(e?.farmingMethod),
        e?.farmLocation,
        e?.approvalType,
        e?.submittedDate,
        e?.rejectionReson,
        e?.isSuspend,
        const ListEquality().hash(e?.farmAvailability),
        e?.farmAddress,
        e?.doyouofferyourowndeliveryservice
      ]);

  @override
  bool isValidKey(Object? o) => o is FarmsRecord;
}

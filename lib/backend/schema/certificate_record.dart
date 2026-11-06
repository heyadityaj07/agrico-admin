import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CertificateRecord extends FirestoreRecord {
  CertificateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "certificate_type" field.
  String? _certificateType;
  String get certificateType => _certificateType ?? '';
  bool hasCertificateType() => _certificateType != null;

  // "certificate_id" field.
  String? _certificateId;
  String get certificateId => _certificateId ?? '';
  bool hasCertificateId() => _certificateId != null;

  // "Issuer_date" field.
  DateTime? _issuerDate;
  DateTime? get issuerDate => _issuerDate;
  bool hasIssuerDate() => _issuerDate != null;

  // "expire_date" field.
  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  bool hasExpireDate() => _expireDate != null;

  // "certiifcate_image" field.
  String? _certiifcateImage;
  String get certiifcateImage => _certiifcateImage ?? '';
  bool hasCertiifcateImage() => _certiifcateImage != null;

  // "verification_status" field.
  String? _verificationStatus;
  String get verificationStatus => _verificationStatus ?? '';
  bool hasVerificationStatus() => _verificationStatus != null;

  // "submitted_date" field.
  DateTime? _submittedDate;
  DateTime? get submittedDate => _submittedDate;
  bool hasSubmittedDate() => _submittedDate != null;

  // "farm_ref" field.
  DocumentReference? _farmRef;
  DocumentReference? get farmRef => _farmRef;
  bool hasFarmRef() => _farmRef != null;

  void _initializeFields() {
    _certificateType = snapshotData['certificate_type'] as String?;
    _certificateId = snapshotData['certificate_id'] as String?;
    _issuerDate = snapshotData['Issuer_date'] as DateTime?;
    _expireDate = snapshotData['expire_date'] as DateTime?;
    _certiifcateImage = snapshotData['certiifcate_image'] as String?;
    _verificationStatus = snapshotData['verification_status'] as String?;
    _submittedDate = snapshotData['submitted_date'] as DateTime?;
    _farmRef = snapshotData['farm_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('certificate');

  static Stream<CertificateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CertificateRecord.fromSnapshot(s));

  static Future<CertificateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CertificateRecord.fromSnapshot(s));

  static CertificateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CertificateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CertificateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CertificateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CertificateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CertificateRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createCertificateRecordData({
  String? certificateType,
  String? certificateId,
  DateTime? issuerDate,
  DateTime? expireDate,
  String? certiifcateImage,
  String? verificationStatus,
  DateTime? submittedDate,
  DocumentReference? farmRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'certificate_type': certificateType,
      'certificate_id': certificateId,
      'Issuer_date': issuerDate,
      'expire_date': expireDate,
      'certiifcate_image': certiifcateImage,
      'verification_status': verificationStatus,
      'submitted_date': submittedDate,
      'farm_ref': farmRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CertificateRecordDocumentEquality implements Equality<CertificateRecord> {
  const CertificateRecordDocumentEquality();

  @override
  bool equals(CertificateRecord? e1, CertificateRecord? e2) {
    return e1?.certificateType == e2?.certificateType &&
        e1?.certificateId == e2?.certificateId &&
        e1?.issuerDate == e2?.issuerDate &&
        e1?.expireDate == e2?.expireDate &&
        e1?.certiifcateImage == e2?.certiifcateImage &&
        e1?.verificationStatus == e2?.verificationStatus &&
        e1?.submittedDate == e2?.submittedDate &&
        e1?.farmRef == e2?.farmRef;
  }

  @override
  int hash(CertificateRecord? e) => const ListEquality().hash([
        e?.certificateType,
        e?.certificateId,
        e?.issuerDate,
        e?.expireDate,
        e?.certiifcateImage,
        e?.verificationStatus,
        e?.submittedDate,
        e?.farmRef
      ]);

  @override
  bool isValidKey(Object? o) => o is CertificateRecord;
}

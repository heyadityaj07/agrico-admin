import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigRecord extends FirestoreRecord {
  static const String systemConfigDocumentId = 'ILSJrepZWwOH8KUWXxQ3';

  ConfigRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "platform_fee" field.
  double? _platformFee;
  double get platformFee => _platformFee ?? 0.0;
  bool hasPlatformFee() => _platformFee != null;
  double? get platformFeeOrNull => _platformFee;

  // "platform_fee_cap" field.
  double? _platformFeeCap;
  double get platformFeeCap => _platformFeeCap ?? 0.0;
  bool hasPlatformFeeCap() => _platformFeeCap != null;
  double? get platformFeeCapOrNull => _platformFeeCap;

  // "weight_product_deposit" field.
  double? _weightProductDeposit;
  double get weightProductDeposit => _weightProductDeposit ?? 0.0;
  bool hasWeightProductDeposit() => _weightProductDeposit != null;

  void _initializeFields() {
    _platformFee = castToType<double>(snapshotData['platform_fee']);
    _platformFeeCap = castToType<double>(snapshotData['platform_fee_cap']);
    _weightProductDeposit =
        castToType<double>(snapshotData['weight_product_deposit']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('config');

  static DocumentReference get systemConfigRef =>
      collection.doc(systemConfigDocumentId);

  static Stream<ConfigRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfigRecord.fromSnapshot(s));

  static Future<ConfigRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConfigRecord.fromSnapshot(s));

  static ConfigRecord fromSnapshot(DocumentSnapshot snapshot) => ConfigRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfigRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfigRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfigRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfigRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createConfigRecordData({
  double? platformFee,
  double? platformFeeCap,
  double? weightProductDeposit,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'platform_fee': platformFee,
      'platform_fee_cap': platformFeeCap,
      'weight_product_deposit': weightProductDeposit,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfigRecordDocumentEquality implements Equality<ConfigRecord> {
  const ConfigRecordDocumentEquality();

  @override
  bool equals(ConfigRecord? e1, ConfigRecord? e2) {
    return e1?.platformFee == e2?.platformFee &&
        e1?.platformFeeCap == e2?.platformFeeCap &&
        e1?.weightProductDeposit == e2?.weightProductDeposit;
  }

  @override
  int hash(ConfigRecord? e) => const ListEquality()
      .hash([e?.platformFee, e?.platformFeeCap, e?.weightProductDeposit]);

  @override
  bool isValidKey(Object? o) => o is ConfigRecord;
}

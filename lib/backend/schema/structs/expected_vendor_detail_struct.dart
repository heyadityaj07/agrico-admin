// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Expected producer allocation entry from the payments ledger
/// `expectedVendorDetails` list (P1-06). A vendor may appear multiple times;
/// the latest entry wins.
class ExpectedVendorDetailStruct extends FFFirebaseStruct {
  ExpectedVendorDetailStruct({
    String? vendorId,
    double? expectedAmount,
    int? expectedAmountCents,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _vendorId = vendorId,
        _expectedAmount = expectedAmount,
        _expectedAmountCents = expectedAmountCents,
        super(firestoreUtilData);

  // "vendorId" field.
  String? _vendorId;
  String get vendorId => _vendorId ?? '';
  set vendorId(String? val) => _vendorId = val;

  bool hasVendorId() => _vendorId != null;

  // "expectedAmount" field.
  double? _expectedAmount;
  double get expectedAmount => _expectedAmount ?? 0.0;
  set expectedAmount(double? val) => _expectedAmount = val;

  bool hasExpectedAmount() => _expectedAmount != null;

  // "expectedAmountCents" field.
  int? _expectedAmountCents;
  int get expectedAmountCents => _expectedAmountCents ?? 0;
  set expectedAmountCents(int? val) => _expectedAmountCents = val;

  bool hasExpectedAmountCents() => _expectedAmountCents != null;

  static ExpectedVendorDetailStruct fromMap(Map<String, dynamic> data) =>
      ExpectedVendorDetailStruct(
        vendorId: castToType<String>(data['vendorId']),
        expectedAmount: castToType<double>(data['expectedAmount']),
        expectedAmountCents: castToType<int>(data['expectedAmountCents']),
      );

  static ExpectedVendorDetailStruct? maybeFromMap(dynamic data) => data is Map
      ? ExpectedVendorDetailStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'vendorId': _vendorId,
        'expectedAmount': _expectedAmount,
        'expectedAmountCents': _expectedAmountCents,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'vendorId': serializeParam(
          _vendorId,
          ParamType.String,
        ),
        'expectedAmount': serializeParam(
          _expectedAmount,
          ParamType.double,
        ),
        'expectedAmountCents': serializeParam(
          _expectedAmountCents,
          ParamType.int,
        ),
      }.withoutNulls;

  static ExpectedVendorDetailStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ExpectedVendorDetailStruct(
        vendorId: deserializeParam(
          data['vendorId'],
          ParamType.String,
          false,
        ),
        expectedAmount: deserializeParam(
          data['expectedAmount'],
          ParamType.double,
          false,
        ),
        expectedAmountCents: deserializeParam(
          data['expectedAmountCents'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ExpectedVendorDetailStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExpectedVendorDetailStruct &&
        vendorId == other.vendorId &&
        expectedAmount == other.expectedAmount &&
        expectedAmountCents == other.expectedAmountCents;
  }

  @override
  int get hashCode => const ListEquality().hash([
        vendorId,
        expectedAmount,
        expectedAmountCents
      ]);
}

ExpectedVendorDetailStruct createExpectedVendorDetailStruct({
  String? vendorId,
  double? expectedAmount,
  int? expectedAmountCents,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ExpectedVendorDetailStruct(
      vendorId: vendorId,
      expectedAmount: expectedAmount,
      expectedAmountCents: expectedAmountCents,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

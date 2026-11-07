// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// One recorded producer-transfer attempt from the payments ledger
/// `vendorDetails` list (P1-05). Entries are appended per attempt, so the
/// last entry for a vendor is the currently recorded outcome. Legacy records
/// only contain `vendorId`, `transferId`, `status` and `amount`; the
/// attempt/ambiguity/reconciliation fields belong to newer records and are
/// treated as absent when missing.
class VendorTransferStruct extends FFFirebaseStruct {
  VendorTransferStruct({
    String? vendorId,
    String? transferId,
    String? status,
    double? amount,
    int? amountCents,
    String? error,
    String? reason,
    bool? ambiguous,
    int? attempt,
    String? idempotencyKey,
    String? blockedBy,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _vendorId = vendorId,
        _transferId = transferId,
        _status = status,
        _amount = amount,
        _amountCents = amountCents,
        _error = error,
        _reason = reason,
        _ambiguous = ambiguous,
        _attempt = attempt,
        _idempotencyKey = idempotencyKey,
        _blockedBy = blockedBy,
        super(firestoreUtilData);

  // "vendorId" field.
  String? _vendorId;
  String get vendorId => _vendorId ?? '';
  set vendorId(String? val) => _vendorId = val;

  bool hasVendorId() => _vendorId != null;

  // "transferId" field.
  String? _transferId;
  String get transferId => _transferId ?? '';
  set transferId(String? val) => _transferId = val;

  bool hasTransferId() => _transferId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  bool hasAmount() => _amount != null;

  // "amountCents" field.
  int? _amountCents;
  int get amountCents => _amountCents ?? 0;
  set amountCents(int? val) => _amountCents = val;

  bool hasAmountCents() => _amountCents != null;

  // "error" field.
  String? _error;
  String get error => _error ?? '';
  set error(String? val) => _error = val;

  bool hasError() => _error != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  set reason(String? val) => _reason = val;

  bool hasReason() => _reason != null;

  // "ambiguous" field.
  bool? _ambiguous;
  bool get ambiguous => _ambiguous ?? false;
  set ambiguous(bool? val) => _ambiguous = val;

  bool hasAmbiguous() => _ambiguous != null;

  // "attempt" field.
  int? _attempt;
  int get attempt => _attempt ?? 0;
  set attempt(int? val) => _attempt = val;

  bool hasAttempt() => _attempt != null;

  // "idempotencyKey" field.
  String? _idempotencyKey;
  String get idempotencyKey => _idempotencyKey ?? '';
  set idempotencyKey(String? val) => _idempotencyKey = val;

  bool hasIdempotencyKey() => _idempotencyKey != null;

  // "blockedBy" field.
  String? _blockedBy;
  String get blockedBy => _blockedBy ?? '';
  set blockedBy(String? val) => _blockedBy = val;

  bool hasBlockedBy() => _blockedBy != null;

  /// Convenience: latest recorded failure description (Stripe error message
  /// or the recorded reason such as "No connect account").
  String get failureDescription {
    if (hasReason() && reason.trim().isNotEmpty) return reason;
    if (hasError() && error.trim().isNotEmpty) return error;
    if (hasBlockedBy() && blockedBy.trim().isNotEmpty) return blockedBy;
    return '';
  }

  static VendorTransferStruct fromMap(Map<String, dynamic> data) =>
      VendorTransferStruct(
        vendorId: castToType<String>(data['vendorId']),
        transferId: castToType<String>(data['transferId']),
        status: castToType<String>(data['status']),
        amount: castToType<double>(data['amount']),
        amountCents: castToType<int>(data['amountCents']),
        error: castToType<String>(data['error']),
        reason: castToType<String>(data['reason']),
        ambiguous: data['ambiguous'] as bool?,
        attempt: castToType<int>(data['attempt']),
        idempotencyKey: castToType<String>(data['idempotencyKey']),
        blockedBy: castToType<String>(data['blockedBy']),
      );

  static VendorTransferStruct? maybeFromMap(dynamic data) => data is Map
      ? VendorTransferStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'vendorId': _vendorId,
        'transferId': _transferId,
        'status': _status,
        'amount': _amount,
        'amountCents': _amountCents,
        'error': _error,
        'reason': _reason,
        'ambiguous': _ambiguous,
        'attempt': _attempt,
        'idempotencyKey': _idempotencyKey,
        'blockedBy': _blockedBy,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'vendorId': serializeParam(
          _vendorId,
          ParamType.String,
        ),
        'transferId': serializeParam(
          _transferId,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'amountCents': serializeParam(
          _amountCents,
          ParamType.int,
        ),
        'error': serializeParam(
          _error,
          ParamType.String,
        ),
        'reason': serializeParam(
          _reason,
          ParamType.String,
        ),
        'ambiguous': serializeParam(
          _ambiguous,
          ParamType.bool,
        ),
        'attempt': serializeParam(
          _attempt,
          ParamType.int,
        ),
        'idempotencyKey': serializeParam(
          _idempotencyKey,
          ParamType.String,
        ),
        'blockedBy': serializeParam(
          _blockedBy,
          ParamType.String,
        ),
      }.withoutNulls;

  static VendorTransferStruct fromSerializableMap(Map<String, dynamic> data) =>
      VendorTransferStruct(
        vendorId: deserializeParam(
          data['vendorId'],
          ParamType.String,
          false,
        ),
        transferId: deserializeParam(
          data['transferId'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
        amountCents: deserializeParam(
          data['amountCents'],
          ParamType.int,
          false,
        ),
        error: deserializeParam(
          data['error'],
          ParamType.String,
          false,
        ),
        reason: deserializeParam(
          data['reason'],
          ParamType.String,
          false,
        ),
        ambiguous: deserializeParam(
          data['ambiguous'],
          ParamType.bool,
          false,
        ),
        attempt: deserializeParam(
          data['attempt'],
          ParamType.int,
          false,
        ),
        idempotencyKey: deserializeParam(
          data['idempotencyKey'],
          ParamType.String,
          false,
        ),
        blockedBy: deserializeParam(
          data['blockedBy'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VendorTransferStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VendorTransferStruct &&
        vendorId == other.vendorId &&
        transferId == other.transferId &&
        status == other.status &&
        amount == other.amount &&
        amountCents == other.amountCents &&
        error == other.error &&
        reason == other.reason &&
        ambiguous == other.ambiguous &&
        attempt == other.attempt &&
        idempotencyKey == other.idempotencyKey &&
        blockedBy == other.blockedBy;
  }

  @override
  int get hashCode => const ListEquality().hash([
        vendorId,
        transferId,
        status,
        amount,
        amountCents,
        error,
        reason,
        ambiguous,
        attempt,
        idempotencyKey,
        blockedBy
      ]);
}

VendorTransferStruct createVendorTransferStruct({
  String? vendorId,
  String? transferId,
  String? status,
  double? amount,
  int? amountCents,
  String? error,
  String? reason,
  bool? ambiguous,
  int? attempt,
  String? idempotencyKey,
  String? blockedBy,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VendorTransferStruct(
      vendorId: vendorId,
      transferId: transferId,
      status: status,
      amount: amount,
      amountCents: amountCents,
      error: error,
      reason: reason,
      ambiguous: ambiguous,
      attempt: attempt,
      idempotencyKey: idempotencyKey,
      blockedBy: blockedBy,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

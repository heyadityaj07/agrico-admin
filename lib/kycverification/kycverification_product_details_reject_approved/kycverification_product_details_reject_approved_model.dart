import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_load_widget.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/kycverification/product_approved/product_approved_widget.dart';
import '/kycverification/rejectproduct/rejectproduct_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'kycverification_product_details_reject_approved_widget.dart'
    show KycverificationProductDetailsRejectApprovedWidget;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KycverificationProductDetailsRejectApprovedModel extends FlutterFlowModel<
    KycverificationProductDetailsRejectApprovedWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> userrefs = [];
  void addToUserrefs(DocumentReference item) => userrefs.add(item);
  void removeFromUserrefs(DocumentReference item) => userrefs.remove(item);
  void removeAtIndexFromUserrefs(int index) => userrefs.removeAt(index);
  void insertAtIndexInUserrefs(int index, DocumentReference item) =>
      userrefs.insert(index, item);
  void updateUserrefsAtIndex(int index, Function(DocumentReference) updateFn) =>
      userrefs[index] = updateFn(userrefs[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  FarmsRecord? farmer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

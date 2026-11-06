import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'rejectproduct_widget.dart' show RejectproductWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RejectproductModel extends FlutterFlowModel<RejectproductWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> useref = [];
  void addToUseref(DocumentReference item) => useref.add(item);
  void removeFromUseref(DocumentReference item) => useref.remove(item);
  void removeAtIndexFromUseref(int index) => useref.removeAt(index);
  void insertAtIndexInUseref(int index, DocumentReference item) =>
      useref.insert(index, item);
  void updateUserefAtIndex(int index, Function(DocumentReference) updateFn) =>
      useref[index] = updateFn(useref[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Explain why this product is being rejected (e.g., unclear images, incorrect pricing, incomplete details…) is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProductRecord? product;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  FarmsRecord? farmer;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

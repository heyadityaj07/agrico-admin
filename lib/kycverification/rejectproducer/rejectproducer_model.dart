import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'rejectproducer_widget.dart' show RejectproducerWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RejectproducerModel extends FlutterFlowModel<RejectproducerWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> userefs = [];
  void addToUserefs(DocumentReference item) => userefs.add(item);
  void removeFromUserefs(DocumentReference item) => userefs.remove(item);
  void removeAtIndexFromUserefs(int index) => userefs.removeAt(index);
  void insertAtIndexInUserefs(int index, DocumentReference item) =>
      userefs.insert(index, item);
  void updateUserefsAtIndex(int index, Function(DocumentReference) updateFn) =>
      userefs[index] = updateFn(userefs[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Explain why this store is being rejected (e.g., missing documents, incorrect details…) is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  FarmsRecord? farm;

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

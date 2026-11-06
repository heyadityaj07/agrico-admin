import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/data_load_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'setting_widget.dart' show SettingWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingModel extends FlutterFlowModel<SettingWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'platform_fee is required';
    }

    final parsed = double.tryParse(val);
    if (parsed == null) {
      return 'Enter a valid number';
    }
    if (parsed < 0 || parsed > 1) {
      return 'Use a fraction between 0 and 1 (0.0099 = 0.99%)';
    }
    return null;
  }

  // State field(s) for the platform-fee cap TextField widget.
  FocusNode? capTextFieldFocusNode;
  TextEditingController? capTextController;
  String? Function(BuildContext, String?)? capTextControllerValidator;
  String? _capTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'platform_fee_cap is required';
    }

    final parsed = double.tryParse(val);
    if (parsed == null) {
      return 'Enter a valid number';
    }
    if (parsed < 0) {
      return 'Cap must be zero or greater';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
    capTextControllerValidator = _capTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
    capTextFieldFocusNode?.dispose();
    capTextController?.dispose();
  }
}

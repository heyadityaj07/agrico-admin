import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/data_load_widget.dart';
import '/components/header_widget.dart';
import '/components/nodata_widget.dart';
import '/components/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'chatscreen_widget.dart' show ChatscreenWidget;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatscreenModel extends FlutterFlowModel<ChatscreenWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> userrefs = [];
  void addToUserrefs(DocumentReference item) => userrefs.add(item);
  void removeFromUserrefs(DocumentReference item) => userrefs.remove(item);
  void removeAtIndexFromUserrefs(int index) => userrefs.removeAt(index);
  void insertAtIndexInUserrefs(int index, DocumentReference item) =>
      userrefs.insert(index, item);
  void updateUserrefsAtIndex(int index, Function(DocumentReference) updateFn) =>
      userrefs[index] = updateFn(userrefs[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in chatscreen widget.
  HelpChatRecord? helpchat;
  // Model for Sidebar component.
  late SidebarModel sidebarModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    sidebarModel = createModel(context, () => SidebarModel());
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    sidebarModel.dispose();
    headerModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

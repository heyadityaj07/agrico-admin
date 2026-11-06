import '/admin_user/add_admin_user/add_admin_user_widget.dart';
import '/admin_user/admin_user_dailog/admin_user_dailog_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header_widget.dart';
import '/components/nodata_widget.dart';
import '/components/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'admin_user_page_widget.dart' show AdminUserPageWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminUserPageModel extends FlutterFlowModel<AdminUserPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Sidebar component.
  late SidebarModel sidebarModel;
  // Model for Header component.
  late HeaderModel headerModel;

  @override
  void initState(BuildContext context) {
    sidebarModel = createModel(context, () => SidebarModel());
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    sidebarModel.dispose();
    headerModel.dispose();
  }
}

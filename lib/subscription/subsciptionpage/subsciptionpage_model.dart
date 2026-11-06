import '/backend/backend.dart';
import '/components/header_widget.dart';
import '/components/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/subscription/subscription_details/subscription_details_widget.dart';
import 'dart:ui';
import 'package:styled_divider/styled_divider.dart';
import 'subsciptionpage_widget.dart' show SubsciptionpageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubsciptionpageModel extends FlutterFlowModel<SubsciptionpageWidget> {
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

import '/backend/backend.dart';
import '/components/data_load_widget.dart';
import '/components/header_widget.dart';
import '/components/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/order/order_details/order_details_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'orderpage_widget.dart' show OrderpageWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderpageModel extends FlutterFlowModel<OrderpageWidget> {
  ///  Local state fields for this page.

  int? tabindex = 0;

  ///  State fields for stateful widgets in this page.

  // Model for Sidebar component.
  late SidebarModel sidebarModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Custom Action - getAddressFromLatLng] action in Button widget.
  String? success;

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

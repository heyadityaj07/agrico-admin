import '/backend/backend.dart';
import '/components/data_load_widget.dart';
import '/components/header_widget.dart';
import '/components/nodata_widget.dart';
import '/components/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/kycverification/kycverification_producer_details_reject_approved/kycverification_producer_details_reject_approved_widget.dart';
import '/kycverification/kycverification_product_details_reject_approved/kycverification_product_details_reject_approved_widget.dart';
import 'dart:ui';
import 'kyc_verificationpage_widget.dart' show KycVerificationpageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KycVerificationpageModel
    extends FlutterFlowModel<KycVerificationpageWidget> {
  ///  Local state fields for this page.

  int? tabindex = 0;

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

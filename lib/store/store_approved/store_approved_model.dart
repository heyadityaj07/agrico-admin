import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/data_load_widget.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'package:styled_divider/styled_divider.dart';
import 'store_approved_widget.dart' show StoreApprovedWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StoreApprovedModel extends FlutterFlowModel<StoreApprovedWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in storeApproved widget.
  FarmsRecord? farm;
  // Stores action output result for [Custom Action - getAddressFromLatLng] action in storeApproved widget.
  String? addres;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

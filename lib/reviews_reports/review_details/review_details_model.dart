import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'review_details_widget.dart' show ReviewDetailsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReviewDetailsModel extends FlutterFlowModel<ReviewDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? useroforder;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? hidenreview;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? hidenreview1;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? deleteReview;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

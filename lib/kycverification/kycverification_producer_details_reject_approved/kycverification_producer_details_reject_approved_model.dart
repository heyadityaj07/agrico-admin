import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/data_load_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/kycverification/producer_approved/producer_approved_widget.dart';
import '/kycverification/rejectproducer/rejectproducer_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'kycverification_producer_details_reject_approved_widget.dart'
    show KycverificationProducerDetailsRejectApprovedWidget;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class KycverificationProducerDetailsRejectApprovedModel
    extends FlutterFlowModel<
        KycverificationProducerDetailsRejectApprovedWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> userefs = [];
  void addToUserefs(DocumentReference item) => userefs.add(item);
  void removeFromUserefs(DocumentReference item) => userefs.remove(item);
  void removeAtIndexFromUserefs(int index) => userefs.removeAt(index);
  void insertAtIndexInUserefs(int index, DocumentReference item) =>
      userefs.insert(index, item);
  void updateUserefsAtIndex(int index, Function(DocumentReference) updateFn) =>
      userefs[index] = updateFn(userefs[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

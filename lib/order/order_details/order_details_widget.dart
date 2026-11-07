import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/currency/currency_utils.dart';
import '/backend/payments/payment_status_utils.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_load_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_details_model.dart';
export 'order_details_model.dart';

class OrderDetailsWidget extends StatefulWidget {
  const OrderDetailsWidget({
    super.key,
    required this.orderRef,
    required this.locationaddress,
  });

  final DocumentReference? orderRef;
  final String? locationaddress;

  @override
  State<OrderDetailsWidget> createState() => _OrderDetailsWidgetState();
}

class _OrderDetailsWidgetState extends State<OrderDetailsWidget> {
  late OrderDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OrderRecord>(
      stream: OrderRecord.getDocument(widget!.orderRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }

        final containerOrderRecord = snapshot.data!;

        return Container(
          constraints: BoxConstraints(
            maxWidth: 1156.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: StreamBuilder<FarmsRecord>(
            stream: FarmsRecord.getDocument(containerOrderRecord.farmRef!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }

              final containerFarmsRecord = snapshot.data!;

              return Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: StreamBuilder<UsersRecord>(
                    stream:
                        UsersRecord.getDocument(containerFarmsRecord.userRef!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }

                      final columnUsersRecord = snapshot.data!;

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x193BB273),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        FFIcons.kadminIcons,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 36.0,
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Order Details',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          'ORD-${containerOrderRecord.reference.id}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: 22.0,
                                      height: 22.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.close,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 15.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  23.0, 24.0, 23.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 36.0,
                                    height: 36.0,
                                    decoration: BoxDecoration(
                                      color: (containerOrderRecord
                                                      .orderStatus ==
                                                  'Approved') ||
                                              (containerOrderRecord
                                                      .orderStatus ==
                                                  'Preparing') ||
                                              (containerOrderRecord
                                                      .orderStatus ==
                                                  'Picked Up') ||
                                              (containerOrderRecord
                                                      .orderStatus ==
                                                  'In Transit') ||
                                              (containerOrderRecord
                                                      .orderStatus ==
                                                  'Delivered')
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.check_circle_outline_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 20.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          StyledDivider(
                                            thickness: 1.0,
                                            color: (containerOrderRecord
                                                            .orderStatus ==
                                                        'Preparing') ||
                                                    (containerOrderRecord
                                                            .orderStatus ==
                                                        'Picked Up') ||
                                                    (containerOrderRecord
                                                            .orderStatus ==
                                                        'In Transit') ||
                                                    (containerOrderRecord
                                                            .orderStatus ==
                                                        'Delivered')
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            lineStyle: DividerLineStyle.dashed,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 36.0,
                                    height: 36.0,
                                    decoration: BoxDecoration(
                                      color: (containerOrderRecord
                                                      .orderStatus ==
                                                  'Preparing') ||
                                              (containerOrderRecord
                                                      .orderStatus ==
                                                  'Picked Up') ||
                                              (containerOrderRecord
                                                      .orderStatus ==
                                                  'In Transit') ||
                                              (containerOrderRecord
                                                      .orderStatus ==
                                                  'Delivered')
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      FFIcons.kframe,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 20.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          StyledDivider(
                                            thickness: 1.0,
                                            color: (containerOrderRecord
                                                            .orderStatus ==
                                                        'Picked Up') ||
                                                    (containerOrderRecord
                                                            .orderStatus ==
                                                        'In Transit') ||
                                                    (containerOrderRecord
                                                            .orderStatus ==
                                                        'Delivered')
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            lineStyle: DividerLineStyle.dashed,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 36.0,
                                    height: 36.0,
                                    decoration: BoxDecoration(
                                      color: (containerOrderRecord
                                                      .orderStatus ==
                                                  'Picked Up') ||
                                              (containerOrderRecord
                                                      .orderStatus ==
                                                  'In Transit') ||
                                              (containerOrderRecord
                                                      .orderStatus ==
                                                  'Delivered')
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      FFIcons.kframe1,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 20.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          StyledDivider(
                                            thickness: 1.0,
                                            color: (containerOrderRecord
                                                            .orderStatus ==
                                                        'In Transit') ||
                                                    (containerOrderRecord
                                                            .orderStatus ==
                                                        'Delivered')
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            lineStyle: DividerLineStyle.dashed,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 36.0,
                                    height: 36.0,
                                    decoration: BoxDecoration(
                                      color: (containerOrderRecord
                                                      .orderStatus ==
                                                  'In Transit') ||
                                              (containerOrderRecord
                                                      .orderStatus ==
                                                  'Delivered')
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      FFIcons.kframe2,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 20.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          StyledDivider(
                                            thickness: 1.0,
                                            color:
                                                containerOrderRecord
                                                            .orderStatus ==
                                                        'Delivered'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                            lineStyle: DividerLineStyle.dashed,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 36.0,
                                    height: 36.0,
                                    decoration: BoxDecoration(
                                      color: containerOrderRecord.orderStatus ==
                                              'Delivered'
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      FFIcons.kframe3,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Confirmed',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          containerOrderRecord
                                                  .hasOrderConfiramtionTime()
                                              ? dateTimeFormat(
                                                  "y-M-d",
                                                  containerOrderRecord
                                                      .orderConfiramtionTime!)
                                              : '',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Preparing',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          containerOrderRecord
                                                  .hasPreparingTime()
                                              ? dateTimeFormat(
                                                  "y-M-d",
                                                  containerOrderRecord
                                                      .preparingTime!)
                                              : '',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          StyledDivider(
                                            thickness: 1.0,
                                            color: Colors.transparent,
                                            lineStyle: DividerLineStyle.dashed,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Picked Up',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          containerOrderRecord.hasPickedUpTime()
                                              ? dateTimeFormat(
                                                  "y-M-d",
                                                  containerOrderRecord
                                                      .pickedUpTime!)
                                              : '',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'In Transit',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          containerOrderRecord
                                                  .hasInTransitTime()
                                              ? dateTimeFormat(
                                                  "y-M-d",
                                                  containerOrderRecord
                                                      .inTransitTime!)
                                              : '',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Delivered',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          containerOrderRecord
                                                  .hasDeliveredTime()
                                              ? dateTimeFormat(
                                                  "y-M-d",
                                                  containerOrderRecord
                                                      .deliveredTime!)
                                              : '',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                'Store Information',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Name',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    containerFarmsRecord
                                                        .farmName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Email',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Satoshi',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                  Text(
                                                    containerFarmsRecord
                                                        .contactEmail,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                'Seller Information',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Name',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    columnUsersRecord
                                                        .displayName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Email',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Satoshi',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                  Text(
                                                    columnUsersRecord.email,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                'Shipping Address',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      widget!.locationaddress,
                                                      'test',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Tracking Number',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  'TRK-789456123',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 24.0)),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (containerOrderRecord.levaeReview)
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Rating & Review',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      RatingBar.builder(
                                                        onRatingUpdate: (newValue) =>
                                                            safeSetState(() =>
                                                                _model.ratingBarValue =
                                                                    newValue),
                                                        itemBuilder:
                                                            (context, index) =>
                                                                Icon(
                                                          Icons.star_rounded,
                                                          color:
                                                              Color(0xFFFDC700),
                                                        ),
                                                        direction:
                                                            Axis.horizontal,
                                                        initialRating: _model
                                                                .ratingBarValue ??=
                                                            containerOrderRecord
                                                                .review.rate,
                                                        unratedColor:
                                                            Color(0x32FDC700),
                                                        itemCount: 5,
                                                        itemSize: 24.0,
                                                        glowColor:
                                                            Color(0xFFFDC700),
                                                      ),
                                                      Text(
                                                        '5/5',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Satoshi',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              if (containerOrderRecord
                                                          .review.comment !=
                                                      null &&
                                                  containerOrderRecord
                                                          .review.comment !=
                                                      '')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 24.0, 0.0, 0.0),
                                                  child: Text(
                                                    containerOrderRecord
                                                        .review.comment,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if ((valueOrDefault(
                                                                currentUserDocument
                                                                    ?.subRole,
                                                                '') !=
                                                            'Read-only') &&
                                                        (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.subRole,
                                                                '') !=
                                                            'Finance') &&
                                                        (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.subRole,
                                                                '') !=
                                                            'Support'))
                                                      AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            FFButtonWidget(
                                                          onPressed: () async {
                                                            await containerOrderRecord
                                                                .reference
                                                                .update(
                                                                    createOrderRecordData(
                                                              levaeReview:
                                                                  false,
                                                              review:
                                                                  createReviewStruct(
                                                                      delete:
                                                                          true),
                                                            ));

                                                            await AuditLogRecord
                                                                .collection
                                                                .doc()
                                                                .set(
                                                                    createAuditLogRecordData(
                                                                  createdAt:
                                                                      getCurrentTimestamp,
                                                                  action:
                                                                      'Delete Review',
                                                                  actionType:
                                                                      'Delete',
                                                                  entity:
                                                                      'Orders',
                                                                  details:
                                                                      'Delete Review of ${containerFarmsRecord.farmName}farm Product',
                                                                  userref:
                                                                      currentUserReference,
                                                                ));
                                                          },
                                                          text: 'Delete review',
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Satoshi',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                  ].divide(
                                                      SizedBox(width: 16.0)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 12.0),
                                              child: Text(
                                                'Order Items (${containerOrderRecord.orderItems.length.toString()})',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final orderitems =
                                                    containerOrderRecord
                                                        .orderItems
                                                        .toList();

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      orderitems.length,
                                                      (orderitemsIndex) {
                                                    final orderitemsItem =
                                                        orderitems[
                                                            orderitemsIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  12.0),
                                                        child: StreamBuilder<
                                                            ProductRecord>(
                                                          stream: ProductRecord
                                                              .getDocument(
                                                                  orderitemsItem
                                                                      .productRef!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return DataLoadWidget(
                                                                height: 48,
                                                                width: 205,
                                                                colour: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primaryBackground,
                                                              );
                                                            }

                                                            final containerProductRecord =
                                                                snapshot.data!;

                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 68.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme
                                                                            .of(context)
                                                                        .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child: Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize.max,
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                          child:
                                                                              Image.network(
                                                                            getCORSProxyUrl(
                                                                              containerProductRecord.productImage,
                                                                            ),
                                                                            width:
                                                                                52.0,
                                                                            height:
                                                                                52.0,
                                                                            fit: BoxFit
                                                                                .cover,
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              containerProductRecord.productName,
                                                                              style: FlutterFlowTheme.of(context)
                                                                                  .bodyMedium
                                                                                  .override(
                                                                                    fontFamily: 'Satoshi',
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              'Quantity : ${orderitemsItem.totalItems.toString()}',
                                                                              maxLines: 1,
                                                                              style: FlutterFlowTheme.of(context)
                                                                                  .bodyMedium
                                                                                  .override(
                                                                                    fontFamily: 'Satoshi',
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              formatLanguageCurrency(orderitemsItem.pricePerProduct, Localizations.localeOf(context).languageCode),
                                                                              style: FlutterFlowTheme.of(context)
                                                                                  .bodyMedium
                                                                                  .override(
                                                                                    fontFamily: 'Satoshi',
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                          width:
                                                                              14.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (orderitemsItem
                                                                    .isVariableWeight)
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final itemDetails =
                                                                          <String>[];
                                                                      if (orderitemsItem.hasPricePerKg()) {
                                                                        itemDetails.add('Price/kg: ${formatLanguageCurrency(orderitemsItem.pricePerKg, Localizations.localeOf(context).languageCode)}');
                                                                      }
                                                                      if (orderitemsItem.hasDepositAmount()) {
                                                                        itemDetails.add('Deposit: ${formatLanguageCurrency(orderitemsItem.depositAmount, Localizations.localeOf(context).languageCode)}');
                                                                      }
                                                                      if (orderitemsItem.hasActualWeight()) {
                                                                        itemDetails.add('Actual weight: ${orderitemsItem.actualWeight}');
                                                                      }
                                                                      if (orderitemsItem.hasFinalItemPrice()) {
                                                                        itemDetails.add('Final price: ${formatLanguageCurrency(orderitemsItem.finalItemPrice, Localizations.localeOf(context).languageCode)}');
                                                                      }
                                                                      if (orderitemsItem.hasRemainingBalance()) {
                                                                        itemDetails.add('Remaining balance: ${formatLanguageCurrency(orderitemsItem.remainingBalance, Localizations.localeOf(context).languageCode)}');
                                                                      }
                                                                      if (orderitemsItem.hasWeightLocked()) {
                                                                        itemDetails.add('Weight locked: ${orderitemsItem.weightLocked ? 'yes' : 'no'}');
                                                                      }
                                                                      if (itemDetails
                                                                          .isEmpty) {
                                                                        return SizedBox
                                                                            .shrink();
                                                                      }
                                                                      return Padding(
                                                                        padding:
                                                                            const EdgeInsetsDirectional.only(top: 4.0),
                                                                        child:
                                                                            Text(
                                                                          itemDetails.join(' | '),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                fontFamily: 'Satoshi',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                },
                                              ),                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 36.0, 0.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Subtotal',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        formatLanguageCurrency(containerOrderRecord.subTotal, Localizations.localeOf(context).languageCode),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Satoshi',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'To Platform Fees',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  Text(
                                                    formatLanguageCurrency(containerOrderRecord.serviceFee, Localizations.localeOf(context).languageCode),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    containerOrderRecord
                                                            .isFarmPickup
                                                        ? 'Farm Pickup (no delivery fee)'
                                                        : (containerOrderRecord
                                                                .hasIsAgricoDeliver()
                                                            ? (containerOrderRecord
                                                                    .isAgricoDeliver
                                                                ? 'Uber Delivery Fee (Agrico)'
                                                                : 'Producer Delivery Fee (to producer)')
                                                            : 'Delivery Fee'),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  Text(
                                                    formatLanguageCurrency(containerOrderRecord.deliveryFee, Localizations.localeOf(context).languageCode),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            StyledDivider(
                                              height: 0.0,
                                              thickness: 2.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              lineStyle:
                                                  DividerLineStyle.dashed,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Total:',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  Text(
                                                    formatLanguageCurrency(containerOrderRecord.totalAmmount, Localizations.localeOf(context).languageCode),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                 ].divide(SizedBox(width: 24.0)),
                               ),
                             ),
                             // P1-09: payment state and producer-transfer
                             // display sourced from the payments ledger and
                             // the backend payment-state fields. Never
                             // derived from order_status.
                              StreamBuilder<List<PaymentsRecord>>(
                                stream: queryPaymentsRecord(
                                  // P1-09 review fix: fetch every ledger
                                  // record for this order (legacy random-ID
                                  // and deterministic records co-exist). A
                                  // bounded limit could exclude records, and
                                  // a cross-field orderBy would need a
                                  // composite index; selection of the primary
                                  // record is deterministic in
                                  // primaryPaymentRecord instead.
                                  queryBuilder: (q) => q.where('orderId',
                                      isEqualTo:
                                          containerOrderRecord.reference.id),
                                ),
                               builder: (context, paymentRecordsSnapshot) {
                                 if (!paymentRecordsSnapshot.hasData) {
                                   return Padding(
                                     padding: EdgeInsetsDirectional.fromSTEB(
                                         0.0, 24.0, 0.0, 0.0),
                                     child: Container(
                                       width: double.infinity,
                                       height: 120.0,
                                       decoration: BoxDecoration(
                                         color: FlutterFlowTheme.of(context)
                                             .secondaryBackground,
                                         borderRadius:
                                             BorderRadius.circular(12.0),
                                         border: Border.all(
                                           color: FlutterFlowTheme.of(context)
                                               .alternate,
                                         ),
                                       ),
                                     ),
                                   );
                                 }
                                 final paymentRecords =
                                     paymentRecordsSnapshot.data ??
                                         const <PaymentsRecord>[];
                                  final paymentRecord =
                                      primaryPaymentRecord(paymentRecords);
                                  final paidRecord =
                                      paymentRecord != null &&
                                              paymentRecord.status == 'paid'
                                          ? paymentRecord
                                          : null;
                                  final paymentIsPaidRecord = paidRecord != null;
                                  final paymentStatus = paymentStatusLabel(
                                    hasPaidLedgerRecord: paymentIsPaidRecord,
                                    orderPaymentState:
                                        containerOrderRecord.paymentState,
                                    isVariableWeightOrder:
                                        containerOrderRecord
                                            .isVariableWeightOrder,
                                    balancePaymentStatus: containerOrderRecord
                                        .balancePaymentStatus,
                                  );
                                  final transferStatus =
                                      transferStatusLabel(
                                    transferStatus: paymentRecord !=
                                                null &&
                                            paymentRecord.hasTransferStatus()
                                        ? paymentRecord.transferStatus
                                        : '',
                                    vendorDetails: paymentRecord
                                            ?.vendorDetails ??
                                        const <VendorTransferStruct>[],
                                    transfersProcessed:
                                        paymentRecord?.transfersProcessed ??
                                            false,
                                  );
                                  final transferRows =
                                      buildProducerTransferRows(
                                    expectedVendorDetails: paymentRecord
                                            ?.expectedVendorDetails ??
                                        const <
                                            ExpectedVendorDetailStruct>[],
                                    vendorDetails: paymentRecord
                                            ?.vendorDetails ??
                                        const <VendorTransferStruct>[],
                                  );

                                 final paymentStatusColor =
                                     paymentStatus == 'Paid'
                                         ? FlutterFlowTheme.of(context)
                                             .primary
                                         : (paymentIsPaidRecord
                                             ? Color(0xFFFDC700)
                                             : FlutterFlowTheme.of(context)
                                                 .secondaryText);
                                 final transferStatusColor =
                                     transferStatus == 'Completed'
                                         ? FlutterFlowTheme.of(context).primary
                                         : (transferStatus == 'Failed' ||
                                                 transferStatus == 'Partial')
                                             ? FlutterFlowTheme.of(context)
                                                 .error
                                             : FlutterFlowTheme.of(context)
                                                 .secondaryText;

                                 return Padding(
                                   padding: EdgeInsetsDirectional.fromSTEB(
                                       0.0, 24.0, 0.0, 0.0),
                                   child: Container(
                                     width: double.infinity,
                                     decoration: BoxDecoration(
                                       color: FlutterFlowTheme.of(context)
                                           .secondaryBackground,
                                       borderRadius:
                                           BorderRadius.circular(12.0),
                                       border: Border.all(
                                         color: FlutterFlowTheme.of(context)
                                             .alternate,
                                       ),
                                     ),
                                     child: Padding(
                                       padding: EdgeInsets.all(16.0),
                                       child: Column(
                                         mainAxisSize: MainAxisSize.max,
                                         crossAxisAlignment:
                                             CrossAxisAlignment.start,
                                         children: [
                                           Padding(
                                             padding: EdgeInsetsDirectional
                                                 .fromSTEB(0.0, 0.0, 0.0, 12.0),
                                             child: Text(
                                               'Payment & Producer Transfers',
                                               style:
                                                   FlutterFlowTheme.of(context)
                                                       .bodyMedium
                                                       .override(
                                                         fontFamily: 'Satoshi',
                                                         fontSize: 16.0,
                                                         letterSpacing: 0.0,
                                                         fontWeight:
                                                             FontWeight.w500,
                                                       ),
                                             ),
                                           ),
                                           Padding(
                                             padding: EdgeInsetsDirectional
                                                 .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                             child: Row(
                                               mainAxisSize:
                                                   MainAxisSize.max,
                                               mainAxisAlignment:
                                                   MainAxisAlignment
                                                       .spaceBetween,
                                               children: [
                                                 Text(
                                                   'Payment status',
                                                   style: FlutterFlowTheme
                                                           .of(context)
                                                       .bodyMedium
                                                       .override(
                                                         fontFamily: 'Satoshi',
                                                         color: FlutterFlowTheme
                                                                 .of(context)
                                                             .secondaryText,
                                                         fontSize: 16.0,
                                                         letterSpacing: 0.0,
                                                         fontWeight:
                                                             FontWeight
                                                                 .normal,
                                                       ),
                                                 ),
                                                 Text(
                                                   paymentStatus,
                                                   style: FlutterFlowTheme
                                                           .of(context)
                                                       .bodyMedium
                                                       .override(
                                                         fontFamily: 'Satoshi',
                                                         color:
                                                             paymentStatusColor,
                                                         fontSize: 16.0,
                                                         letterSpacing: 0.0,
                                                         fontWeight:
                                                             FontWeight.w500,
                                                       ),
                                                 ),
                                               ],
                                             ),
                                           ),
                                           Padding(
                                             padding: EdgeInsetsDirectional
                                                 .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                             child: Row(
                                               mainAxisSize:
                                                   MainAxisSize.max,
                                               mainAxisAlignment:
                                                   MainAxisAlignment
                                                       .spaceBetween,
                                               children: [
                                                 Text(
                                                   'Order payment state',
                                                   style: FlutterFlowTheme
                                                           .of(context)
                                                       .bodyMedium
                                                       .override(
                                                         fontFamily: 'Satoshi',
                                                         color: FlutterFlowTheme
                                                                 .of(context)
                                                             .secondaryText,
                                                         fontSize: 16.0,
                                                         letterSpacing: 0.0,
                                                         fontWeight:
                                                             FontWeight
                                                                 .normal,
                                                       ),
                                                 ),
                                                 Text(
                                                   containerOrderRecord
                                                           .hasPaymentState()
                                                       ? containerOrderRecord
                                                           .paymentState
                                                       : 'Not initiated',
                                                   style: FlutterFlowTheme
                                                           .of(context)
                                                       .bodyMedium
                                                       .override(
                                                         fontFamily: 'Satoshi',
                                                         fontSize: 16.0,
                                                         letterSpacing: 0.0,
                                                         fontWeight:
                                                             FontWeight
                                                                 .normal,
                                                       ),
                                                 ),
                                               ],
                                             ),
                                           ),
                                            if (paymentIsPaidRecord &&
                                                (paidRecord!.hasTotalPaid()))
                                             Padding(
                                               padding:
                                                   EdgeInsetsDirectional
                                                       .fromSTEB(
                                                           0.0, 0.0, 0.0, 4.0),
                                               child: Row(
                                                 mainAxisSize:
                                                     MainAxisSize.max,
                                                 mainAxisAlignment:
                                                     MainAxisAlignment
                                                         .spaceBetween,
                                                 children: [
                                                   Text(
                                                     'Amount collected',
                                                     style: FlutterFlowTheme
                                                             .of(context)
                                                         .bodyMedium
                                                         .override(
                                                           fontFamily:
                                                               'Satoshi',
                                                           color: FlutterFlowTheme
                                                                   .of(context)
                                                               .secondaryText,
                                                           fontSize: 16.0,
                                                           letterSpacing: 0.0,
                                                           fontWeight:
                                                               FontWeight
                                                                   .normal,
                                                         ),
                                                   ),
                                                   Text(
                                                      formatLanguageCurrency(
                                                          paidRecord!
                                                              .totalPaid,
                                                          Localizations.localeOf(
                                                                  context)
                                                              .languageCode),
                                                     style: FlutterFlowTheme
                                                             .of(context)
                                                         .bodyMedium
                                                         .override(
                                                           fontFamily:
                                                               'Satoshi',
                                                           fontSize: 16.0,
                                                           letterSpacing: 0.0,
                                                           fontWeight:
                                                               FontWeight
                                                                   .normal,
                                                         ),
                                                   ),
                                                 ],
                                               ),
                                             ),
                                           // P1-06 settlement provenance is
                                           // absent on legacy ledger records:
                                           // these rows stay hidden there
                                           // instead of inferring values.
                                            if (paymentIsPaidRecord &&
                                                paidRecord!
                                                    .hasNetSettlementCents())
                                             Padding(
                                               padding:
                                                   EdgeInsetsDirectional
                                                       .fromSTEB(
                                                           0.0, 0.0, 0.0, 4.0),
                                               child: Row(
                                                 mainAxisSize:
                                                     MainAxisSize.max,
                                                 mainAxisAlignment:
                                                     MainAxisAlignment
                                                         .spaceBetween,
                                                 children: [
                                                   Text(
                                                     'Net settlement',
                                                     style: FlutterFlowTheme
                                                             .of(context)
                                                         .bodyMedium
                                                         .override(
                                                           fontFamily:
                                                               'Satoshi',
                                                           color: FlutterFlowTheme
                                                                   .of(context)
                                                               .secondaryText,
                                                           fontSize: 16.0,
                                                           letterSpacing: 0.0,
                                                           fontWeight:
                                                               FontWeight
                                                                   .normal,
                                                         ),
                                                   ),
                                                    Text(
                                                      // P1-09 review fix: the agreed admin currency rule is language-based only (French → EUR, otherwise USD); a ledger currency code must never sit next to a language-derived symbol. The recorded codes stay on the model for reconciliation.
                                                      formatLanguageCurrency(paidRecord!.netSettlementCents / 100, Localizations.localeOf(context).languageCode),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Satoshi',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                 ],
                                               ),
                                             ),
                                            if (paymentIsPaidRecord &&
                                                paidRecord!
                                                    .hasStripeFeeCents())
                                             Padding(
                                               padding:
                                                   EdgeInsetsDirectional
                                                       .fromSTEB(
                                                           0.0, 0.0, 0.0, 4.0),
                                               child: Row(
                                                 mainAxisSize:
                                                     MainAxisSize.max,
                                                 mainAxisAlignment:
                                                     MainAxisAlignment
                                                         .spaceBetween,
                                                 children: [
                                                   Text(
                                                     'Stripe processing fee',
                                                     style: FlutterFlowTheme
                                                             .of(context)
                                                         .bodyMedium
                                                         .override(
                                                           fontFamily:
                                                               'Satoshi',
                                                           color: FlutterFlowTheme
                                                                   .of(context)
                                                               .secondaryText,
                                                           fontSize: 16.0,
                                                           letterSpacing: 0.0,
                                                           fontWeight:
                                                               FontWeight
                                                                   .normal,
                                                         ),
                                                   ),
                                                   Text(
                                                      formatLanguageCurrency(
                                                          paidRecord!
                                                                  .stripeFeeCents /
                                                              100,
                                                          Localizations.localeOf(
                                                                  context)
                                                              .languageCode),
                                                     style: FlutterFlowTheme
                                                             .of(context)
                                                         .bodyMedium
                                                         .override(
                                                           fontFamily:
                                                               'Satoshi',
                                                           fontSize: 16.0,
                                                           letterSpacing: 0.0,
                                                           fontWeight:
                                                               FontWeight
                                                                   .normal,
                                                         ),
                                                   ),
                                                 ],
                                               ),
                                             ),
                                            if (paymentIsPaidRecord &&
                                                paidRecord!
                                                    .hasSettlementSource())
                                             Padding(
                                               padding:
                                                   EdgeInsetsDirectional
                                                       .fromSTEB(
                                                           0.0, 0.0, 0.0, 4.0),
                                               child: Row(
                                                 mainAxisSize:
                                                     MainAxisSize.max,
                                                 mainAxisAlignment:
                                                     MainAxisAlignment
                                                         .spaceBetween,
                                                 children: [
                                                   Text(
                                                     'Settlement source',
                                                     style: FlutterFlowTheme
                                                             .of(context)
                                                         .bodyMedium
                                                         .override(
                                                           fontFamily:
                                                               'Satoshi',
                                                           color: FlutterFlowTheme
                                                                   .of(context)
                                                               .secondaryText,
                                                           fontSize: 16.0,
                                                           letterSpacing: 0.0,
                                                           fontWeight:
                                                               FontWeight
                                                                   .normal,
                                                         ),
                                                   ),
                                                    Text(
                                                      paidRecord!
                                                              .settlementSource ==
                                                          'balance_transaction'
                                                          ? 'Stripe balance transaction'
                                                          : 'PaymentIntent gross (fallback)',
                                                     style: FlutterFlowTheme
                                                             .of(context)
                                                         .bodyMedium
                                                         .override(
                                                           fontFamily:
                                                               'Satoshi',
                                                           fontSize: 16.0,
                                                           letterSpacing: 0.0,
                                                           fontWeight:
                                                               FontWeight
                                                                   .normal,
                                                         ),
                                                   ),
                                                 ],
                                               ),
                                             ),
                                           StyledDivider(
                                             thickness: 1.0,
                                             color: FlutterFlowTheme.of(
                                                     context)
                                                 .alternate,
                                             lineStyle:
                                                 DividerLineStyle.dashed,
                                           ),
                                           Padding(
                                             padding: EdgeInsetsDirectional
                                                 .fromSTEB(0.0, 8.0, 0.0, 8.0),
                                             child: Row(
                                               mainAxisSize:
                                                   MainAxisSize.max,
                                               mainAxisAlignment:
                                                   MainAxisAlignment
                                                       .spaceBetween,
                                               children: [
                                                 Text(
                                                   'Producer transfer',
                                                   style: FlutterFlowTheme
                                                           .of(context)
                                                       .bodyMedium
                                                       .override(
                                                         fontFamily: 'Satoshi',
                                                         color: FlutterFlowTheme
                                                                 .of(context)
                                                             .secondaryText,
                                                         fontSize: 16.0,
                                                         letterSpacing: 0.0,
                                                         fontWeight:
                                                             FontWeight
                                                                 .normal,
                                                       ),
                                                 ),
                                                 Text(
                                                   transferStatus == ''
                                                       ? '—'
                                                       : transferStatus,
                                                   style: FlutterFlowTheme
                                                           .of(context)
                                                       .bodyMedium
                                                       .override(
                                                         fontFamily: 'Satoshi',
                                                         color:
                                                             transferStatusColor,
                                                         fontSize: 16.0,
                                                         letterSpacing: 0.0,
                                                         fontWeight:
                                                             FontWeight.w500,
                                                       ),
                                                 ),
                                               ],
                                             ),
                                           ),
                                           if (paymentIsPaidRecord &&
                                               transferStatus == '')
                                             Padding(
                                               padding: EdgeInsetsDirectional
                                                   .fromSTEB(
                                                       0.0, 0.0, 0.0, 8.0),
                                               child: Text(
                                                 'Transfer details are not recorded on this ledger record (legacy).',
                                                 style: FlutterFlowTheme
                                                         .of(context)
                                                     .bodyMedium
                                                     .override(
                                                       fontFamily: 'Satoshi',
                                                       color: FlutterFlowTheme
                                                               .of(context)
                                                           .secondaryText,
                                                       fontSize: 14.0,
                                                       letterSpacing: 0.0,
                                                       fontWeight:
                                                           FontWeight.normal,
                                                     ),
                                               ),
                                             ),
                                           ...transferRows.map(
                                             (row) => Padding(
                                               padding:
                                                   EdgeInsetsDirectional
                                                       .fromSTEB(
                                                           0.0, 0.0, 0.0, 8.0),
                                               child: Row(
                                                 mainAxisSize:
                                                     MainAxisSize.max,
                                                 crossAxisAlignment:
                                                     CrossAxisAlignment.start,
                                                 mainAxisAlignment:
                                                     MainAxisAlignment
                                                         .spaceBetween,
                                                 children: [
                                                   Expanded(
                                                     child: Column(
                                                       mainAxisSize:
                                                           MainAxisSize
                                                               .min,
                                                       crossAxisAlignment:
                                                           CrossAxisAlignment
                                                               .start,
                                                       children: [
                                                         Text(
                                                           'Producer allocation — ${row.vendorId}',
                                                           style: FlutterFlowTheme
                                                                   .of(context)
                                                               .bodyMedium
                                                               .override(
                                                                 fontFamily:
                                                                     'Satoshi',
                                                                 fontSize:
                                                                     15.0,
                                                                 letterSpacing:
                                                                     0.0,
                                                                 fontWeight:
                                                                     FontWeight
                                                                         .w500,
                                                               ),
                                                         ),
                                                         Padding(
                                                           padding: EdgeInsetsDirectional
                                                               .fromSTEB(
                                                                   0.0,
                                                                   4.0,
                                                                   0.0,
                                                                   0.0),
                                                           child: Text(
                                                             'Expected: ${row.hasExpected ? formatLanguageCurrency(row.expectedAmount, Localizations.localeOf(context).languageCode) : 'not recorded'}',
                                                             style: FlutterFlowTheme
                                                                     .of(context)
                                                                 .bodyMedium
                                                                 .override(
                                                                   fontFamily:
                                                                       'Satoshi',
                                                                   color: FlutterFlowTheme
                                                                           .of(context)
                                                                       .secondaryText,
                                                                   fontSize:
                                                                       14.0,
                                                                   letterSpacing:
                                                                       0.0,
                                                                   fontWeight:
                                                                       FontWeight
                                                                           .normal,
                                                                 ),
                                                           ),
                                                         ),
                                                         Padding(
                                                           padding: EdgeInsetsDirectional
                                                               .fromSTEB(
                                                                   0.0,
                                                                   2.0,
                                                                   0.0,
                                                                   0.0),
                                                            child: Text(
                                                              'Transferred: ${row.actualAmount != null ? formatLanguageCurrency(row.actualAmount, Localizations.localeOf(context).languageCode) : 'not recorded'}',
                                                             style: FlutterFlowTheme
                                                                     .of(context)
                                                                 .bodyMedium
                                                                 .override(
                                                                   fontFamily:
                                                                       'Satoshi',
                                                                   color: FlutterFlowTheme
                                                                           .of(context)
                                                                       .secondaryText,
                                                                   fontSize:
                                                                       14.0,
                                                                   letterSpacing:
                                                                       0.0,
                                                                   fontWeight:
                                                                       FontWeight
                                                                           .normal,
                                                                 ),
                                                           ),
                                                         ),
                                                         if (row.transferId !=
                                                             '')
                                                           Padding(
                                                             padding: EdgeInsetsDirectional
                                                                 .fromSTEB(
                                                                     0.0,
                                                                     2.0,
                                                                     0.0,
                                                                     0.0),
                                                             child: Text(
                                                               'Transfer ID: ${row.transferId}',
                                                               style: FlutterFlowTheme
                                                                       .of(context)
                                                                   .bodyMedium
                                                                   .override(
                                                                     fontFamily:
                                                                         'Satoshi',
                                                                     color: FlutterFlowTheme
                                                                             .of(context)
                                                                         .secondaryText,
                                                                     fontSize:
                                                                         14.0,
                                                                     letterSpacing:
                                                                         0.0,
                                                                     fontWeight:
                                                                         FontWeight
                                                                             .normal,
                                                                   ),
                                                             ),
                                                           ),
                                                         if (row
                                                             .transferFailed)
                                                           Padding(
                                                             padding: EdgeInsetsDirectional
                                                                 .fromSTEB(
                                                                     0.0,
                                                                     2.0,
                                                                     0.0,
                                                                     0.0),
                                                             child: Text(
                                                               'Failure: ${row.failureDescription == '' ? 'not recorded' : row.failureDescription}',
                                                               style: FlutterFlowTheme
                                                                       .of(context)
                                                                   .bodyMedium
                                                                   .override(
                                                                     fontFamily:
                                                                         'Satoshi',
                                                                     color: FlutterFlowTheme
                                                                             .of(context)
                                                                         .error,
                                                                     fontSize:
                                                                         14.0,
                                                                     letterSpacing:
                                                                         0.0,
                                                                     fontWeight:
                                                                         FontWeight
                                                                             .normal,
                                                                   ),
                                                             ),
                                                           ),
                                                       ].divide(SizedBox(
                                                           height: 2.0)),
                                                     ),
                                                   ),
                                                   Text(
                                                     row.statusLabel,
                                                     style:
                                                         FlutterFlowTheme.of(
                                                                 context)
                                                             .bodyMedium
                                                             .override(
                                                               fontFamily:
                                                                   'Satoshi',
                                                               color: row
                                                                       .transferSucceeded
                                                                   ? FlutterFlowTheme
                                                                           .of(
                                                                               context)
                                                                       .primary
                                                                   : (row.transferFailed
                                                                       ? FlutterFlowTheme.of(
                                                                               context)
                                                                           .error
                                                                       : FlutterFlowTheme.of(
                                                                               context)
                                                                           .secondaryText),
                                                               fontSize:
                                                                   15.0,
                                                               letterSpacing:
                                                                   0.0,
                                                               fontWeight:
                                                                   FontWeight
                                                                       .w500,
                                                             ),
                                                   ),
                                                 ],
                                               ),
                                             ),
                                           ),
                                            if (paymentIsPaidRecord &&
                                                (paidRecord!
                                                        .hasProcessingError() ||
                                                    paidRecord!
                                                        .reconciliationRequired))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    if (paidRecord!
                                                        .hasProcessingError())
                                                      Text(
                                                        'Processing error: ${paidRecord!.processingError}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Satoshi',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                    if (paidRecord!
                                                        .reconciliationRequired)
                                                     Text(
                                                       'Reconciliation required in the Stripe dashboard.',
                                                       style: FlutterFlowTheme
                                                               .of(context)
                                                           .bodyMedium
                                                           .override(
                                                             fontFamily:
                                                                 'Satoshi',
                                                             color: FlutterFlowTheme
                                                                     .of(context)
                                                                 .error,
                                                             fontSize: 14.0,
                                                             letterSpacing:
                                                                 0.0,
                                                             fontWeight:
                                                                 FontWeight
                                                                     .normal,
                                                           ),
                                                     ),
                                                 ].divide(SizedBox(
                                                     height: 2.0)),
                                               ),
                                             ),
                                           if (containerOrderRecord
                                               .isVariableWeightOrder)
                                             Padding(
                                               padding: EdgeInsetsDirectional
                                                   .fromSTEB(
                                                       8.0, 8.0, 8.0, 0.0),
                                               child: Column(
                                                 mainAxisSize:
                                                     MainAxisSize.min,
                                                 crossAxisAlignment:
                                                     CrossAxisAlignment.start,
                                                 children: [
                                                   Text(
                                                     'Order type: variable weight (deposit basis)',
                                                     style:
                                                         FlutterFlowTheme.of(
                                                                 context)
                                                             .bodyMedium
                                                             .override(
                                                               fontFamily:
                                                                   'Satoshi',
                                                               fontSize:
                                                                   14.0,
                                                               letterSpacing:
                                                                   0.0,
                                                               fontWeight:
                                                                   FontWeight
                                                                       .normal,
                                                             ),
                                                   ),
                                                   if (containerOrderRecord
                                                           .hasBalancePaymentStatus() &&
                                                       containerOrderRecord
                                                           .balancePaymentStatus
                                                           .isNotEmpty)
                                                     Text(
                                                       'Final balance status: ${containerOrderRecord.balancePaymentStatus}',
                                                       style: FlutterFlowTheme
                                                               .of(context)
                                                           .bodyMedium
                                                           .override(
                                                             fontFamily:
                                                                 'Satoshi',
                                                             color: FlutterFlowTheme
                                                                     .of(context)
                                                                 .secondaryText,
                                                             fontSize: 14.0,
                                                             letterSpacing:
                                                                 0.0,
                                                             fontWeight:
                                                                 FontWeight
                                                                     .normal,
                                                           ),
                                                     ),
                                                   // Deposit/final-balance
                                                   // amounts appear only when
                                                   // already recorded by the
                                                   // backend; no invented
                                                   // values for missing fields.
                                                   if (containerOrderRecord
                                                       .hasInitialDepositPaid())
                                                     Text(
                                                       'Deposit paid (recorded): ${formatLanguageCurrency(containerOrderRecord.initialDepositPaid, Localizations.localeOf(context).languageCode)}',
                                                       style: FlutterFlowTheme
                                                               .of(context)
                                                           .bodyMedium
                                                           .override(
                                                             fontFamily:
                                                                 'Satoshi',
                                                             color: FlutterFlowTheme
                                                                     .of(context)
                                                                 .secondaryText,
                                                             fontSize: 14.0,
                                                             letterSpacing:
                                                                 0.0,
                                                             fontWeight:
                                                                 FontWeight
                                                                     .normal,
                                                           ),
                                                     ),
                                                   if (containerOrderRecord
                                                       .hasFinalBalanceAmount())
                                                     Text(
                                                       'Final balance (recorded): ${formatLanguageCurrency(containerOrderRecord.finalBalanceAmount, Localizations.localeOf(context).languageCode)}',
                                                       style: FlutterFlowTheme
                                                               .of(context)
                                                           .bodyMedium
                                                           .override(
                                                             fontFamily:
                                                                 'Satoshi',
                                                             color: FlutterFlowTheme
                                                                     .of(context)
                                                                 .secondaryText,
                                                             fontSize: 14.0,
                                                             letterSpacing:
                                                                 0.0,
                                                             fontWeight:
                                                                 FontWeight
                                                                     .normal,
                                                           ),
                                                     ),
                                                 ].divide(SizedBox(
                                                     height: 2.0)),
                                               ),
                                             ),
                                           if (!paymentIsPaidRecord &&
                                               paymentRecords.isEmpty)
                                             Padding(
                                               padding: EdgeInsetsDirectional
                                                   .fromSTEB(
                                                       0.0, 0.0, 0.0, 0.0),
                                               child: Text(
                                                 'No payment collected for this order yet.',
                                                 style: FlutterFlowTheme
                                                         .of(context)
                                                     .bodyMedium
                                                     .override(
                                                       fontFamily: 'Satoshi',
                                                       color: FlutterFlowTheme
                                                               .of(context)
                                                           .secondaryText,
                                                       fontSize: 14.0,
                                                       letterSpacing: 0.0,
                                                       fontWeight:
                                                           FontWeight.normal,
                                                     ),
                                               ),
                                             ),
                                         ],
                                       ),
                                     ),
                                   ),
                                 );
                               },
                             ),
                           ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

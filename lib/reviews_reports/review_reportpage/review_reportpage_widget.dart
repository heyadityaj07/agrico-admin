import '/backend/backend.dart';
import '/components/empty_widget.dart';
import '/components/header_widget.dart';
import '/components/nodata_widget.dart';
import '/components/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/reviews_reports/review_details/review_details_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'review_reportpage_model.dart';
export 'review_reportpage_model.dart';

class ReviewReportpageWidget extends StatefulWidget {
  const ReviewReportpageWidget({super.key});

  static String routeName = 'reviewReportpage';
  static String routePath = '/reviewReportpage';

  @override
  State<ReviewReportpageWidget> createState() => _ReviewReportpageWidgetState();
}

class _ReviewReportpageWidgetState extends State<ReviewReportpageWidget> {
  late ReviewReportpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewReportpageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Visibility(
            visible: responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.sidebarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: SidebarWidget(
                    index: 7,
                  ),
                ),
                Expanded(
                  child: StreamBuilder<List<OrderRecord>>(
                    stream: queryOrderRecord(
                      queryBuilder: (orderRecord) => orderRecord.where(
                        'levae_review',
                        isEqualTo: true,
                      ),
                    ),
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
                      List<OrderRecord> containerOrderRecordList =
                          snapshot.data!;

                      return Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            wrapWithModel(
                              model: _model.headerModel,
                              updateCallback: () => safeSetState(() {}),
                              child: HeaderWidget(),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 20.0, 16.0, 20.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -1.0),
                                        child: Text(
                                          'Reviews & Reports',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          'Moderate customer reviews and handle reports',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 32.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 200.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(16.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerOrderRecordList
                                                                    .length
                                                                    .toString(),
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Satoshi',
                                                                    fontSize:
                                                                        32.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          'Total Reviews',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Satoshi',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
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
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 200.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(16.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerOrderRecordList
                                                                    .where((e) =>
                                                                        e.review
                                                                            .reviewStatus ==
                                                                        'Pending')
                                                                    .toList()
                                                                    .length
                                                                    .toString(),
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Satoshi',
                                                                    fontSize:
                                                                        32.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          'Pending Review',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Satoshi',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
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
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 200.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(16.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerOrderRecordList
                                                                    .where((e) =>
                                                                        e.review
                                                                            .reviewStatus ==
                                                                        'Reported')
                                                                    .toList()
                                                                    .length
                                                                    .toString(),
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Satoshi',
                                                                    fontSize:
                                                                        32.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          'Reported',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Satoshi',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
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
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 200.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(16.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerOrderRecordList
                                                                    .where((e) =>
                                                                        e.review
                                                                            .reviewStatus ==
                                                                        'Hidden')
                                                                    .toList()
                                                                    .length
                                                                    .toString(),
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Satoshi',
                                                                    fontSize:
                                                                        32.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          'Hidden',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Satoshi',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
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
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 24.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 32.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Text(
                                                    'Reviews',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(99.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.tabindex = 0;
                                                      safeSetState(() {});
                                                    },
                                                    text:
                                                        'All (${valueOrDefault<String>(
                                                      containerOrderRecordList
                                                          .length
                                                          .toString(),
                                                      '0',
                                                    )})',
                                                    options: FFButtonOptions(
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
                                                      color: _model.tabindex ==
                                                              0
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Satoshi',
                                                                color: _model
                                                                            .tabindex ==
                                                                        0
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation:
                                                          _model.tabindex == 0
                                                              ? 2.0
                                                              : 0.0,
                                                      borderSide: BorderSide(
                                                        color: _model
                                                                    .tabindex ==
                                                                0
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                99.0),
                                                        topRight:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          _model.tabindex == 0
                                                              ? 99.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                99.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          _model.tabindex == 0
                                                              ? 99.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                      ),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.tabindex = 1;
                                                      safeSetState(() {});
                                                    },
                                                    text:
                                                        'Pending (${valueOrDefault<String>(
                                                      containerOrderRecordList
                                                          .where((e) =>
                                                              e.review
                                                                  .reviewStatus ==
                                                              'Pending')
                                                          .toList()
                                                          .length
                                                          .toString(),
                                                      '0',
                                                    )})',
                                                    options: FFButtonOptions(
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
                                                      color: _model.tabindex ==
                                                              1
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Satoshi',
                                                                color: _model
                                                                            .tabindex ==
                                                                        1
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation:
                                                          _model.tabindex == 1
                                                              ? 2.0
                                                              : 0.0,
                                                      borderSide: BorderSide(
                                                        color: _model
                                                                    .tabindex ==
                                                                1
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          _model.tabindex == 1
                                                              ? 99.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                        topRight:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          _model.tabindex == 1
                                                              ? 99.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          _model.tabindex == 1
                                                              ? 99.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                        bottomRight:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          _model.tabindex == 1
                                                              ? 99.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                      ),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.tabindex = 2;
                                                      safeSetState(() {});
                                                    },
                                                    text:
                                                        'Reported (${containerOrderRecordList.where((e) => e.review.reviewStatus == 'Reported').toList().length.toString()})',
                                                    options: FFButtonOptions(
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
                                                      color: _model.tabindex ==
                                                              2
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Satoshi',
                                                                color: _model
                                                                            .tabindex ==
                                                                        2
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation:
                                                          _model.tabindex == 2
                                                              ? 2.0
                                                              : 0.0,
                                                      borderSide: BorderSide(
                                                        color: _model
                                                                    .tabindex ==
                                                                2
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          _model.tabindex == 2
                                                              ? 99.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                        topRight:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          _model.tabindex == 2
                                                              ? 99.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          _model.tabindex == 2
                                                              ? 99.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                        bottomRight:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          _model.tabindex == 2
                                                              ? 99.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                      ),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.tabindex = 3;
                                                      safeSetState(() {});
                                                    },
                                                    text:
                                                        'Active (${containerOrderRecordList.where((e) => e.review.reviewStatus == 'Approved').toList().length.toString()})',
                                                    options: FFButtonOptions(
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
                                                      color: _model.tabindex ==
                                                              3
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Satoshi',
                                                                color: _model
                                                                            .tabindex ==
                                                                        3
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation:
                                                          _model.tabindex == 3
                                                              ? 2.0
                                                              : 0.0,
                                                      borderSide: BorderSide(
                                                        color: _model
                                                                    .tabindex ==
                                                                3
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          _model.tabindex == 3
                                                              ? 99.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                        topRight:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          _model.tabindex == 3
                                                              ? 99.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          _model.tabindex == 3
                                                              ? 99.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                        bottomRight:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          _model.tabindex == 3
                                                              ? 99.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                      ),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.tabindex = 4;
                                                      safeSetState(() {});
                                                    },
                                                    text:
                                                        'Hidden (${containerOrderRecordList.where((e) => e.review.reviewStatus == 'Hidden').toList().length.toString()})',
                                                    options: FFButtonOptions(
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
                                                      color: _model.tabindex ==
                                                              4
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Satoshi',
                                                                color: _model
                                                                            .tabindex ==
                                                                        4
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation:
                                                          _model.tabindex == 4
                                                              ? 2.0
                                                              : 0.0,
                                                      borderSide: BorderSide(
                                                        color: _model
                                                                    .tabindex ==
                                                                4
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          _model.tabindex == 4
                                                              ? 99.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                        topRight:
                                                            Radius.circular(
                                                                99.0),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          _model.tabindex == 4
                                                              ? 99.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                        bottomRight:
                                                            Radius.circular(
                                                                99.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 32.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 36.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            'Review',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 36.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Product',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 36.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Store',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 36.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Rating',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 36.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Date',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 36.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Status',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 36.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Manage',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                StyledDivider(
                                                  thickness: 2.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  lineStyle:
                                                      DividerLineStyle.dashed,
                                                ),
                                                Stack(
                                                  children: [
                                                    if (false)
                                                      Builder(
                                                        builder: (context) {
                                                          final reviews =
                                                              containerOrderRecordList
                                                                  .where(
                                                                      (e) =>
                                                                          () {
                                                                            if (_model.tabindex ==
                                                                                1) {
                                                                              return (e.review.reviewStatus == 'Pending');
                                                                            } else if (_model.tabindex ==
                                                                                2) {
                                                                              return (e.review.reviewStatus == 'Reported');
                                                                            } else if (_model.tabindex ==
                                                                                3) {
                                                                              return (e.review.reviewStatus == 'Approved');
                                                                            } else if (_model.tabindex ==
                                                                                4) {
                                                                              return (e.review.reviewStatus == 'Hidden');
                                                                            } else {
                                                                              return true;
                                                                            }
                                                                          }())
                                                                  .toList();
                                                          if (reviews.isEmpty) {
                                                            return NodataWidget(
                                                              message:
                                                                  'No Reviews ',
                                                            );
                                                          }

                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: List.generate(
                                                                reviews.length,
                                                                (reviewsIndex) {
                                                              final reviewsItem =
                                                                  reviews[
                                                                      reviewsIndex];
                                                              return StreamBuilder<
                                                                  UsersRecord>(
                                                                stream: UsersRecord
                                                                    .getDocument(
                                                                        reviewsItem
                                                                            .review
                                                                            .userRef!),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }

                                                                  final containerUsersRecord =
                                                                      snapshot
                                                                          .data!;

                                                                  return Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Visibility(
                                                                      visible: containerUsersRecord
                                                                          .displayName
                                                                          .toLowerCase()
                                                                          .contains(_model
                                                                              .headerModel
                                                                              .textController
                                                                              .text
                                                                              .toLowerCase()),
                                                                      child: StreamBuilder<
                                                                          FarmsRecord>(
                                                                        stream:
                                                                            FarmsRecord.getDocument(reviewsItem.farmRef!),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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

                                                                          final containerFarmsRecord =
                                                                              snapshot.data!;

                                                                          return Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: containerFarmsRecord.farmName.toLowerCase().contains(_model.headerModel.textController.text.toLowerCase()),
                                                                              child: StreamBuilder<ProductRecord>(
                                                                                stream: ProductRecord.getDocument(reviewsItem.orderItems.firstOrNull!.productRef!),
                                                                                builder: (context, snapshot) {
                                                                                  // Customize what your widget looks like when it's loading.
                                                                                  if (!snapshot.hasData) {
                                                                                    return EmptyWidget();
                                                                                  }

                                                                                  final containerProductRecord = snapshot.data!;

                                                                                  return Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Visibility(
                                                                                      visible: containerProductRecord.productName.toLowerCase().contains(_model.headerModel.textController.text.toLowerCase()),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    if (containerUsersRecord.displayName != null && containerUsersRecord.displayName != '')
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Text(
                                                                                                          containerUsersRecord.displayName,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Satoshi',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    if (reviewsItem.review.comment != null && reviewsItem.review.comment != '')
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Text(
                                                                                                          reviewsItem.review.comment,
                                                                                                          maxLines: 1,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Satoshi',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                              ),
                                                                                                          overflow: TextOverflow.ellipsis,
                                                                                                        ),
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    containerProductRecord.productName,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Satoshi',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 16.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Text(
                                                                                                  containerFarmsRecord.farmName,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Satoshi',
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        reviewsItem.review.rate.toString(),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Satoshi',
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              fontSize: 16.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    FaIcon(
                                                                                                      FaIconData(const IconData(/* star */ 0xf005, fontFamily: 'FontAwesomeRegular', fontPackage: 'font_awesome_flutter')),
                                                                                                      color: FlutterFlowTheme.of(context).harvestyellow,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 5.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    dateTimeFormat("MMMEd", reviewsItem.review.createdAt!),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Satoshi',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 16.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Container(
                                                                                                    height: 25.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: () {
                                                                                                        if (reviewsItem.review.reviewStatus == 'Approved') {
                                                                                                          return Color(0x393BB273);
                                                                                                        } else if (reviewsItem.review.reviewStatus == 'Pending') {
                                                                                                          return Color(0x33FF9500);
                                                                                                        } else {
                                                                                                          return Color(0x30E63946);
                                                                                                        }
                                                                                                      }(),
                                                                                                      borderRadius: BorderRadius.circular(24.0),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 2.0, 12.0, 2.0),
                                                                                                      child: Text(
                                                                                                        reviewsItem.review.reviewStatus,
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Satoshi',
                                                                                                              color: () {
                                                                                                                if (reviewsItem.review.reviewStatus == 'Approved') {
                                                                                                                  return FlutterFlowTheme.of(context).primary;
                                                                                                                } else if (reviewsItem.review.reviewStatus == 'Pending') {
                                                                                                                  return FlutterFlowTheme.of(context).tertiary;
                                                                                                                } else {
                                                                                                                  return FlutterFlowTheme.of(context).accent2;
                                                                                                                }
                                                                                                              }(),
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                child: Builder(
                                                                                                  builder: (context) => FFButtonWidget(
                                                                                                    onPressed: () async {
                                                                                                      await showDialog(
                                                                                                        context: context,
                                                                                                        builder: (dialogContext) {
                                                                                                          return Dialog(
                                                                                                            elevation: 0,
                                                                                                            insetPadding: EdgeInsets.zero,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                            child: GestureDetector(
                                                                                                              onTap: () {
                                                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                                              },
                                                                                                              child: ReviewDetailsWidget(
                                                                                                                order: reviewsItem.reference,
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      );
                                                                                                    },
                                                                                                    text: 'View Details',
                                                                                                    options: FFButtonOptions(
                                                                                                      height: 40.0,
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                      color: Color(0x003BB273),
                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'Satoshi',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                      elevation: 0.0,
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                    ),
                                                                                                  ),
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
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }),
                                                          );
                                                        },
                                                      ),
                                                    custom_widgets
                                                        .CustomReviewListWidget(
                                                      width: double.infinity,
                                                      height: 300.0,
                                                      searchText: _model
                                                          .headerModel
                                                          .textController
                                                          .text,
                                                      reviewsList:
                                                          containerOrderRecordList
                                                              .where((e) => () {
                                                                    if (_model
                                                                            .tabindex ==
                                                                        1) {
                                                                      return (e
                                                                              .review
                                                                              .reviewStatus ==
                                                                          'Pending');
                                                                    } else if (_model
                                                                            .tabindex ==
                                                                        2) {
                                                                      return (e
                                                                              .review
                                                                              .reviewStatus ==
                                                                          'Reported');
                                                                    } else if (_model
                                                                            .tabindex ==
                                                                        3) {
                                                                      return (e
                                                                              .review
                                                                              .reviewStatus ==
                                                                          'Approved');
                                                                    } else if (_model
                                                                            .tabindex ==
                                                                        4) {
                                                                      return (e
                                                                              .review
                                                                              .reviewStatus ==
                                                                          'Hidden');
                                                                    } else {
                                                                      return true;
                                                                    }
                                                                  }())
                                                              .toList(),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

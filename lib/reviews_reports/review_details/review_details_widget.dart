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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'review_details_model.dart';
export 'review_details_model.dart';

class ReviewDetailsWidget extends StatefulWidget {
  const ReviewDetailsWidget({
    super.key,
    required this.order,
  });

  final DocumentReference? order;

  @override
  State<ReviewDetailsWidget> createState() => _ReviewDetailsWidgetState();
}

class _ReviewDetailsWidgetState extends State<ReviewDetailsWidget> {
  late ReviewDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: StreamBuilder<OrderRecord>(
        stream: OrderRecord.getDocument(widget!.order!),
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
              maxWidth: 800.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Visibility(
              visible: containerOrderRecord.review != null,
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Review Details',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Satoshi',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                                color: FlutterFlowTheme.of(context).primaryText,
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                containerOrderRecord.userRef!),
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

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    columnUsersRecord.displayName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              );
                            },
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              height: 25.0,
                              decoration: BoxDecoration(
                                color: () {
                                  if (containerOrderRecord
                                          .review.reviewStatus ==
                                      'Approved') {
                                    return Color(0x393BB273);
                                  } else if (containerOrderRecord
                                          .review.reviewStatus ==
                                      'Pending') {
                                    return Color(0x33FF9500);
                                  } else {
                                    return Color(0x30E63946);
                                  }
                                }(),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 2.0, 12.0, 2.0),
                                child: Text(
                                  containerOrderRecord.review.reviewStatus,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: () {
                                          if (containerOrderRecord
                                                  .review.reviewStatus ==
                                              'Approved') {
                                            return FlutterFlowTheme.of(context)
                                                .primary;
                                          } else if (containerOrderRecord
                                                  .review.reviewStatus ==
                                              'Pending') {
                                            return FlutterFlowTheme.of(context)
                                                .tertiary;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .accent2;
                                          }
                                        }(),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 250.0,
                            height: 50.0,
                            child: custom_widgets.InteractiveStarRatingBar(
                              width: 250.0,
                              height: 50.0,
                              rating: containerOrderRecord.review.rate,
                            ),
                          ),
                        ].divide(SizedBox(width: 2.0)),
                      ),
                    ),
                    if (containerOrderRecord.review.comment != null &&
                        containerOrderRecord.review.comment != '')
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Color(0x0B00000A),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Text(
                                  containerOrderRecord.review.comment,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Product',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final order = containerOrderRecord
                                            .orderItems
                                            .toList();

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(order.length,
                                              (orderIndex) {
                                            final orderItem = order[orderIndex];
                                            return StreamBuilder<ProductRecord>(
                                              stream: ProductRecord.getDocument(
                                                  orderItem.productRef!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                                final containerProductRecord =
                                                    snapshot.data!;

                                                return Container(
                                                  decoration: BoxDecoration(),
                                                  child: Text(
                                                    containerProductRecord
                                                        .productName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                );
                                              },
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: StreamBuilder<FarmsRecord>(
                              stream: FarmsRecord.getDocument(
                                  containerOrderRecord.farmRef!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final containerFarmsRecord = snapshot.data!;

                                return Container(
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
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
                                        Text(
                                          'Store',
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
                                        Text(
                                          containerFarmsRecord.farmName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ].divide(SizedBox(width: 25.0)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Container(
                        width: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Posted',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                dateTimeFormat("y MMM d h :mm a",
                                    containerOrderRecord.review.createdAt!),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(SizedBox(height: 4.0)),
                          ),
                        ),
                      ),
                    ),
                    if (containerOrderRecord.review.reviewStatus == 'Reported')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: Color(0x09E63946),
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).accent2,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Reports (1)',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      'This review appears to be fake and malicious',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      'Nov 12, 10:00 AM',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0x1AAF52DE),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 2.0, 12.0, 2.0),
                                    child: Text(
                                      'Fake Review',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: Color(0xFFAF52DE),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if ((valueOrDefault(currentUserDocument?.subRole, '') !=
                            'Read-only') &&
                        (valueOrDefault(currentUserDocument?.subRole, '') !=
                            'Finance') &&
                        (valueOrDefault(currentUserDocument?.subRole, '') !=
                            'Support'))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (containerOrderRecord.review.reviewStatus !=
                                  'Approved')
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await containerOrderRecord.reference
                                          .update(createOrderRecordData(
                                        review: createReviewStruct(
                                          reviewStatus: 'Approved',
                                          clearUnsetFields: false,
                                        ),
                                      ));
                                      _model.useroforder =
                                          await UsersRecord.getDocumentOnce(
                                              containerOrderRecord.userRef!);

                                      await AuditLogRecord.collection
                                          .doc()
                                          .set(createAuditLogRecordData(
                                            createdAt: getCurrentTimestamp,
                                            action: 'Approved Review',
                                            actionType: 'Approved',
                                            entity: 'Reviews & Report',
                                            details:
                                                'Approved review of  ${_model.useroforder?.displayName}',
                                            userref: currentUserReference,
                                          ));
                                      Navigator.pop(context);

                                      safeSetState(() {});
                                    },
                                    text: 'Approve Review',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    if (containerOrderRecord
                                            .review.reviewStatus !=
                                        'Hidden') {
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          await containerOrderRecord.reference
                                              .update(createOrderRecordData(
                                            review: createReviewStruct(
                                              reviewStatus: 'Hidden',
                                              clearUnsetFields: false,
                                            ),
                                          ));
                                          _model.hidenreview =
                                              await UsersRecord.getDocumentOnce(
                                                  containerOrderRecord
                                                      .userRef!);

                                          await AuditLogRecord.collection
                                              .doc()
                                              .set(createAuditLogRecordData(
                                                createdAt: getCurrentTimestamp,
                                                action: 'Hidden Review',
                                                actionType: 'Hidden',
                                                entity: 'Reviews & Report',
                                                details:
                                                    'Hide review of  ${_model.hidenreview?.displayName}',
                                                userref: currentUserReference,
                                              ));
                                          Navigator.pop(context);

                                          safeSetState(() {});
                                        },
                                        text: 'Hide Review',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.transparent,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      );
                                    } else {
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          await containerOrderRecord.reference
                                              .update(createOrderRecordData(
                                            review: createReviewStruct(
                                              reviewStatus: 'Pending',
                                              clearUnsetFields: false,
                                            ),
                                          ));
                                          _model.hidenreview1 =
                                              await UsersRecord.getDocumentOnce(
                                                  containerOrderRecord
                                                      .userRef!);

                                          await AuditLogRecord.collection
                                              .doc()
                                              .set(createAuditLogRecordData(
                                                createdAt: getCurrentTimestamp,
                                                action: 'Restore Review',
                                                actionType: 'Restore Review',
                                                entity: 'Reviews & Report',
                                                details:
                                                    'Restore review of  ${_model.hidenreview1?.displayName}',
                                                userref: currentUserReference,
                                              ));
                                          Navigator.pop(context);

                                          safeSetState(() {});
                                        },
                                        text: 'Restore Review',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.transparent,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await containerOrderRecord.reference
                                        .update(createOrderRecordData(
                                      levaeReview: false,
                                    ));
                                    _model.deleteReview =
                                        await UsersRecord.getDocumentOnce(
                                            containerOrderRecord.userRef!);

                                    await AuditLogRecord.collection
                                        .doc()
                                        .set(createAuditLogRecordData(
                                          createdAt: getCurrentTimestamp,
                                          action: 'Delete Review',
                                          actionType: 'Delete',
                                          entity: 'Reviews & Report',
                                          details:
                                              'Delete review of  ${_model.deleteReview?.displayName}',
                                          userref: currentUserReference,
                                        ));
                                    await actions.toast(
                                      context,
                                      'Review deleted successfully.',
                                    );
                                    Navigator.pop(context);

                                    safeSetState(() {});
                                  },
                                  text: 'Delete Review',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 48.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Colors.transparent,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 24.0)),
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
    );
  }
}

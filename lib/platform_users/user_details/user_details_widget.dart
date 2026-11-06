import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/currency/currency_utils.dart';
import '/components/data_load_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_details_model.dart';
export 'user_details_model.dart';

class UserDetailsWidget extends StatefulWidget {
  const UserDetailsWidget({
    super.key,
    required this.userRef,
  });

  final DocumentReference? userRef;

  @override
  State<UserDetailsWidget> createState() => _UserDetailsWidgetState();
}

class _UserDetailsWidgetState extends State<UserDetailsWidget> {
  late UserDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserDetailsModel());

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
      child: StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(widget!.userRef!),
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

          final containerUsersRecord = snapshot.data!;

          return Container(
            constraints: BoxConstraints(
              maxWidth: 800.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Container(
              decoration: BoxDecoration(),
              child: StreamBuilder<List<FarmsRecord>>(
                stream: queryFarmsRecord(
                  queryBuilder: (farmsRecord) => farmsRecord.where(
                    'user_ref',
                    isEqualTo: containerUsersRecord.reference,
                  ),
                  singleRecord: true,
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
                  List<FarmsRecord> containerFarmsRecordList = snapshot.data!;
                  final containerFarmsRecord =
                      containerFarmsRecordList.isNotEmpty
                          ? containerFarmsRecordList.first
                          : null;

                  return Container(
                    decoration: BoxDecoration(),
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
                                'User Details',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 64.0,
                                          height: 64.0,
                                          child:
                                              custom_widgets.CustomNetworkImage(
                                            width: 64.0,
                                            height: 64.0,
                                            imageUrl:
                                                containerUsersRecord.photoUrl,
                                            fallbackIcon: Icon(
                                              Icons.broken_image,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 25.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          containerUsersRecord.displayName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        Text(
                                          containerUsersRecord.email,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 2.0, 12.0, 2.0),
                                          child: Text(
                                            containerUsersRecord.role,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0x193BB273),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 2.0, 12.0, 2.0),
                                          child: Text(
                                            'Active',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
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
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Joined',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            dateTimeFormat(
                                                "yMMMd",
                                                containerUsersRecord
                                                    .createdTime!),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FutureBuilder<List<OrderRecord>>(
                            future: queryOrderRecordOnce(
                              queryBuilder: (orderRecord) => orderRecord.where(
                                'user_ref',
                                isEqualTo: containerUsersRecord.reference,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return DataLoadWidget(
                                  height: 48,
                                  width: 250,
                                  colour: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                );
                              }
                              List<OrderRecord> containerOrderRecordList =
                                  snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible:
                                      containerUsersRecord.role == 'consumer',
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Total Orders',
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
                                                    containerOrderRecordList
                                                        .length
                                                        .toString(),
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
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Total Spent',
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
                                                    formatLanguageCurrency(functions.totalsales(containerOrderRecordList.map((e) => e.totalAmmount).toList()), Localizations.localeOf(context).languageCode),
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
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Favorite Stores',
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
                                                    valueOrDefault<String>(
                                                      containerUsersRecord
                                                          .myFavouriteFarm
                                                          .length
                                                          .toString(),
                                                      '0',
                                                    ),
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
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 25.0)),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          StreamBuilder<List<OrderRecord>>(
                            stream: queryOrderRecord(
                              queryBuilder: (orderRecord) => orderRecord.where(
                                'farm_ref',
                                isEqualTo: containerFarmsRecord?.reference,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return DataLoadWidget(
                                  height: 48,
                                  width: 250,
                                  colour: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                );
                              }
                              List<OrderRecord> containerOrderRecordList =
                                  snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible:
                                      containerUsersRecord.role == 'producer',
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Store Name',
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
                                                    valueOrDefault<String>(
                                                      containerFarmsRecord
                                                          ?.farmName,
                                                      'farm_name',
                                                    ),
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
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: FutureBuilder<int>(
                                            future: queryProductRecordCount(
                                              queryBuilder: (productRecord) =>
                                                  productRecord.where(
                                                'farm_ref',
                                                isEqualTo: containerFarmsRecord
                                                    ?.reference,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return DataLoadWidget(
                                                  height: 42,
                                                  width: 150,
                                                  colour: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                );
                                              }
                                              int containerCount =
                                                  snapshot.data!;

                                              return Container(
                                                width: 100.0,
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
                                                child: Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'product',
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
                                                      Text(
                                                        valueOrDefault<String>(
                                                          containerCount
                                                              .toString(),
                                                          '0',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 4.0)),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Total Spent',
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
                                                    functions
                                                        .totalsales(
                                                            containerOrderRecordList
                                                                .map((e) =>
                                                                    valueOrDefault<
                                                                        double>(
                                                                      e.totalAmmount,
                                                                      0.0,
                                                                    ))
                                                                .toList())
                                                        .toString(),
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
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Rating',
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
                                                    functions
                                                        .avargeRating(
                                                            containerOrderRecordList
                                                                .where((e) => e
                                                                    .levaeReview)
                                                                .toList()
                                                                .map((e) =>
                                                                    valueOrDefault<
                                                                        double>(
                                                                      e.review
                                                                          .rate,
                                                                      0.0,
                                                                    ))
                                                                .toList())
                                                        .toString(),
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
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 25.0)),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          if (valueOrDefault(
                                  currentUserDocument?.subRole, '') !=
                              'Read-only')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (!containerUsersRecord.isSuspend)
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (containerUsersRecord.role ==
                                                'consumer') {
                                              await containerUsersRecord
                                                  .reference
                                                  .update(createUsersRecordData(
                                                isSuspend: true,
                                              ));
                                              _model.orders =
                                                  await queryOrderRecordOnce(
                                                queryBuilder: (orderRecord) =>
                                                    orderRecord.where(
                                                  'user_ref',
                                                  isEqualTo:
                                                      containerUsersRecord
                                                          .reference,
                                                ),
                                              );
                                              if (_model.orders?.length != 0) {
                                                for (int loop1Index = 0;
                                                    loop1Index <=
                                                        _model.orders!.length -
                                                            1;
                                                    loop1Index++) {
                                                  final currentLoop1Item =
                                                      _model
                                                          .orders![loop1Index];

                                                  await currentLoop1Item
                                                      .reference
                                                      .update(
                                                          createOrderRecordData(
                                                    isSuspend: true,
                                                  ));
                                                }
                                              }
                                              _model.chats =
                                                  await queryChatRecordOnce(
                                                queryBuilder: (chatRecord) =>
                                                    chatRecord.where(
                                                  'users',
                                                  arrayContains:
                                                      containerUsersRecord
                                                          .reference,
                                                ),
                                              );
                                              if (_model.chats?.length != 0) {
                                                for (int loop2Index = 0;
                                                    loop2Index <=
                                                        _model.chats!.length -
                                                            1;
                                                    loop2Index++) {
                                                  final currentLoop2Item =
                                                      _model.chats![loop2Index];

                                                  await currentLoop2Item
                                                      .reference
                                                      .update(
                                                          createChatRecordData(
                                                    isSuspend: true,
                                                  ));
                                                }
                                              }
                                            } else {
                                              await containerUsersRecord
                                                  .reference
                                                  .update(createUsersRecordData(
                                                isSuspend: true,
                                              ));

                                              await containerFarmsRecord!
                                                  .reference
                                                  .update(createFarmsRecordData(
                                                isSuspend: true,
                                                approvalType: 'Suspended',
                                              ));

                                              await containerUsersRecord
                                                  .reference
                                                  .update(createUsersRecordData(
                                                isSuspend: true,
                                              ));

                                              await containerFarmsRecord!
                                                  .reference
                                                  .update(createFarmsRecordData(
                                                isSuspend: true,
                                              ));
                                              await Future.wait([
                                                Future(() async {
                                                  _model.scaduleproductasuspend =
                                                      await queryScaduleProductRecordOnce(
                                                    queryBuilder:
                                                        (scaduleProductRecord) =>
                                                            scaduleProductRecord
                                                                .where(
                                                      'farmRef',
                                                      isEqualTo:
                                                          containerFarmsRecord
                                                              ?.reference,
                                                    ),
                                                  );
                                                  if (_model
                                                          .scaduleproductasuspend
                                                          ?.length !=
                                                      0) {
                                                    for (int loop3Index = 0;
                                                        loop3Index <=
                                                            _model.scaduleproductasuspend!
                                                                    .length -
                                                                1;
                                                        loop3Index++) {
                                                      final currentLoop3Item =
                                                          _model.scaduleproductasuspend![
                                                              loop3Index];

                                                      await currentLoop3Item
                                                          .reference
                                                          .update(
                                                              createScaduleProductRecordData(
                                                        isSuspend: true,
                                                      ));
                                                    }
                                                  }
                                                  _model.productssuspend =
                                                      await queryProductRecordOnce(
                                                    queryBuilder:
                                                        (productRecord) =>
                                                            productRecord.where(
                                                      'farm_ref',
                                                      isEqualTo:
                                                          containerFarmsRecord
                                                              ?.reference,
                                                    ),
                                                  );
                                                  if (_model.productssuspend
                                                          ?.length !=
                                                      0) {
                                                    for (int loop4Index = 0;
                                                        loop4Index <=
                                                            _model.productssuspend!
                                                                    .length -
                                                                1;
                                                        loop4Index++) {
                                                      final currentLoop4Item =
                                                          _model.productssuspend![
                                                              loop4Index];

                                                      await currentLoop4Item
                                                          .reference
                                                          .update(
                                                              createProductRecordData(
                                                        isSuspend: true,
                                                        activeStatus: false,
                                                        productStatus:
                                                            'Inactive',
                                                      ));
                                                      _model.cartproducts =
                                                          await queryCartRecordOnce();
                                                      if (_model.cartproducts
                                                              ?.length !=
                                                          0) {
                                                        for (int loop5Index = 0;
                                                            loop5Index <=
                                                                _model.cartproducts!
                                                                        .length -
                                                                    1;
                                                            loop5Index++) {
                                                          final currentLoop5Item =
                                                              _model.cartproducts![
                                                                  loop5Index];
                                                          await currentLoop5Item
                                                              .reference
                                                              .delete();
                                                        }
                                                      }
                                                      _model.favouriteproducts =
                                                          await queryUsersRecordOnce(
                                                        queryBuilder:
                                                            (usersRecord) =>
                                                                usersRecord
                                                                    .where(
                                                          'my_favourite_prodcut',
                                                          arrayContains:
                                                              currentLoop4Item
                                                                  .reference,
                                                        ),
                                                      );
                                                      if (_model
                                                              .favouriteproducts
                                                              ?.length !=
                                                          0) {
                                                        for (int loop6Index = 0;
                                                            loop6Index <=
                                                                _model.favouriteproducts!
                                                                        .length -
                                                                    1;
                                                            loop6Index++) {
                                                          final currentLoop6Item =
                                                              _model.favouriteproducts![
                                                                  loop6Index];

                                                          await currentLoop6Item
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'my_favourite_prodcut':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  currentLoop4Item
                                                                      .reference
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                        }
                                                      }
                                                    }
                                                  }
                                                }),
                                                Future(() async {
                                                  _model.producerchatsuspend =
                                                      await queryChatRecordOnce(
                                                    queryBuilder:
                                                        (chatRecord) =>
                                                            chatRecord.where(
                                                      'farm_ref',
                                                      isEqualTo:
                                                          containerFarmsRecord
                                                              ?.reference,
                                                    ),
                                                  );
                                                  if (_model.producerchatsuspend
                                                          ?.length !=
                                                      0) {
                                                    for (int loop7Index = 0;
                                                        loop7Index <=
                                                            _model.producerchatsuspend!
                                                                    .length -
                                                                1;
                                                        loop7Index++) {
                                                      final currentLoop7Item =
                                                          _model.producerchatsuspend![
                                                              loop7Index];

                                                      await currentLoop7Item
                                                          .reference
                                                          .update(
                                                              createChatRecordData(
                                                        isSuspend: true,
                                                      ));
                                                    }
                                                  }
                                                }),
                                                Future(() async {
                                                  _model.ordresproductsuspend =
                                                      await queryOrderRecordOnce(
                                                    queryBuilder:
                                                        (orderRecord) =>
                                                            orderRecord.where(
                                                      'farm_ref',
                                                      isEqualTo:
                                                          containerFarmsRecord
                                                              ?.reference,
                                                    ),
                                                  );
                                                  if (_model
                                                          .ordresproductsuspend
                                                          ?.length !=
                                                      0) {
                                                    for (int loop8Index = 0;
                                                        loop8Index <=
                                                            _model.ordresproductsuspend!
                                                                    .length -
                                                                1;
                                                        loop8Index++) {
                                                      final currentLoop8Item =
                                                          _model.ordresproductsuspend![
                                                              loop8Index];

                                                      await currentLoop8Item
                                                          .reference
                                                          .update(
                                                              createOrderRecordData(
                                                        isSuspend: true,
                                                      ));
                                                    }
                                                  }
                                                }),
                                                Future(() async {
                                                  _model.favouritfarms =
                                                      await queryUsersRecordOnce(
                                                    queryBuilder:
                                                        (usersRecord) =>
                                                            usersRecord.where(
                                                      'my_favourite_farm',
                                                      arrayContains:
                                                          containerFarmsRecord
                                                              ?.reference,
                                                    ),
                                                  );
                                                  if (_model.favouritfarms
                                                          ?.length !=
                                                      0) {
                                                    for (int loop9Index = 0;
                                                        loop9Index <=
                                                            _model.favouritfarms!
                                                                    .length -
                                                                1;
                                                        loop9Index++) {
                                                      final currentLoop9Item =
                                                          _model.favouritfarms![
                                                              loop9Index];

                                                      await currentLoop9Item
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'my_favourite_farm':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              containerFarmsRecord
                                                                  ?.reference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    }
                                                  }
                                                }),
                                              ]);
                                            }

                                            await AuditLogRecord.collection
                                                .doc()
                                                .set(createAuditLogRecordData(
                                                  createdAt:
                                                      getCurrentTimestamp,
                                                  action: 'Suspend User',
                                                  actionType: 'Suspend',
                                                  entity: 'Platform Users',
                                                  details:
                                                      'Suspend User ${containerUsersRecord.displayName}',
                                                  userref: currentUserReference,
                                                ));
                                            Navigator.pop(context);

                                            safeSetState(() {});
                                          },
                                          text: 'Suspend User',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 48.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    if (containerUsersRecord.isSuspend)
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (containerUsersRecord.role ==
                                                'consumer') {
                                              await containerUsersRecord
                                                  .reference
                                                  .update(createUsersRecordData(
                                                isSuspend: false,
                                              ));
                                              _model.ordersactivate =
                                                  await queryOrderRecordOnce(
                                                queryBuilder: (orderRecord) =>
                                                    orderRecord.where(
                                                  'user_ref',
                                                  isEqualTo:
                                                      containerUsersRecord
                                                          .reference,
                                                ),
                                              );
                                              if (_model
                                                      .ordersactivate?.length !=
                                                  0) {
                                                for (int loop1Index = 0;
                                                    loop1Index <=
                                                        _model.ordersactivate!
                                                                .length -
                                                            1;
                                                    loop1Index++) {
                                                  final currentLoop1Item =
                                                      _model.ordersactivate![
                                                          loop1Index];

                                                  await currentLoop1Item
                                                      .reference
                                                      .update(
                                                          createOrderRecordData(
                                                    isSuspend: false,
                                                  ));
                                                }
                                              }
                                              _model.chatsactivate =
                                                  await queryChatRecordOnce(
                                                queryBuilder: (chatRecord) =>
                                                    chatRecord.where(
                                                  'users',
                                                  arrayContains:
                                                      containerUsersRecord
                                                          .reference,
                                                ),
                                              );
                                              if (_model
                                                      .chatsactivate?.length !=
                                                  0) {
                                                for (int loop2Index = 0;
                                                    loop2Index <=
                                                        _model.chatsactivate!
                                                                .length -
                                                            1;
                                                    loop2Index++) {
                                                  final currentLoop2Item =
                                                      _model.chatsactivate![
                                                          loop2Index];

                                                  await currentLoop2Item
                                                      .reference
                                                      .update(
                                                          createChatRecordData(
                                                    isSuspend: false,
                                                  ));
                                                }
                                              }
                                            } else {
                                              await containerUsersRecord
                                                  .reference
                                                  .update(createUsersRecordData(
                                                isSuspend: false,
                                                email: '',
                                              ));

                                              await containerFarmsRecord!
                                                  .reference
                                                  .update(createFarmsRecordData(
                                                isSuspend: false,
                                                approvalType: 'Active',
                                              ));
                                              await Future.wait([
                                                Future(() async {
                                                  _model.scaduleproductactivate =
                                                      await queryScaduleProductRecordOnce(
                                                    queryBuilder:
                                                        (scaduleProductRecord) =>
                                                            scaduleProductRecord
                                                                .where(
                                                      'farmRef',
                                                      isEqualTo:
                                                          containerFarmsRecord
                                                              ?.reference,
                                                    ),
                                                  );
                                                  if (_model
                                                          .scaduleproductactivate
                                                          ?.length !=
                                                      0) {
                                                    for (int loop3Index = 0;
                                                        loop3Index <=
                                                            _model.scaduleproductactivate!
                                                                    .length -
                                                                1;
                                                        loop3Index++) {
                                                      final currentLoop3Item =
                                                          _model.scaduleproductactivate![
                                                              loop3Index];

                                                      await currentLoop3Item
                                                          .reference
                                                          .update(
                                                              createScaduleProductRecordData(
                                                        isSuspend: false,
                                                      ));
                                                    }
                                                  }
                                                  _model.productsactivate =
                                                      await queryProductRecordOnce(
                                                    queryBuilder:
                                                        (productRecord) =>
                                                            productRecord.where(
                                                      'farm_ref',
                                                      isEqualTo:
                                                          containerFarmsRecord
                                                              ?.reference,
                                                    ),
                                                  );
                                                  if (_model.productsactivate
                                                          ?.length !=
                                                      0) {
                                                    for (int loop4Index = 0;
                                                        loop4Index <=
                                                            _model.productsactivate!
                                                                    .length -
                                                                1;
                                                        loop4Index++) {
                                                      final currentLoop4Item =
                                                          _model.productsactivate![
                                                              loop4Index];

                                                      await currentLoop4Item
                                                          .reference
                                                          .update(
                                                              createProductRecordData(
                                                        isSuspend: false,
                                                        productStatus:
                                                            'Inactive',
                                                      ));
                                                    }
                                                  }
                                                }),
                                                Future(() async {
                                                  _model.producerchatactivate =
                                                      await queryChatRecordOnce(
                                                    queryBuilder:
                                                        (chatRecord) =>
                                                            chatRecord.where(
                                                      'farm_ref',
                                                      isEqualTo:
                                                          containerFarmsRecord
                                                              ?.reference,
                                                    ),
                                                  );
                                                  if (_model
                                                          .producerchatactivate
                                                          ?.length !=
                                                      0) {
                                                    for (int loop5Index = 0;
                                                        loop5Index <=
                                                            _model.producerchatactivate!
                                                                    .length -
                                                                1;
                                                        loop5Index++) {
                                                      final currentLoop5Item =
                                                          _model.producerchatactivate![
                                                              loop5Index];

                                                      await currentLoop5Item
                                                          .reference
                                                          .update(
                                                              createChatRecordData(
                                                        isSuspend: false,
                                                      ));
                                                    }
                                                  }
                                                }),
                                                Future(() async {
                                                  _model.ordresproductactivate =
                                                      await queryOrderRecordOnce(
                                                    queryBuilder:
                                                        (orderRecord) =>
                                                            orderRecord.where(
                                                      'farm_ref',
                                                      isEqualTo:
                                                          containerFarmsRecord
                                                              ?.reference,
                                                    ),
                                                  );
                                                  if (_model
                                                          .ordresproductactivate
                                                          ?.length !=
                                                      0) {
                                                    for (int loop6Index = 0;
                                                        loop6Index <=
                                                            _model.ordresproductactivate!
                                                                    .length -
                                                                1;
                                                        loop6Index++) {
                                                      final currentLoop6Item =
                                                          _model.ordresproductactivate![
                                                              loop6Index];

                                                      await currentLoop6Item
                                                          .reference
                                                          .update(
                                                              createOrderRecordData(
                                                        isSuspend: false,
                                                      ));
                                                    }
                                                  }
                                                }),
                                              ]);
                                            }

                                            await AuditLogRecord.collection
                                                .doc()
                                                .set(createAuditLogRecordData(
                                                  createdAt:
                                                      getCurrentTimestamp,
                                                  action: 'Activate User',
                                                  actionType: 'Activate',
                                                  entity: 'Platform Users',
                                                  details:
                                                      'Activate User ${containerUsersRecord.displayName}',
                                                  userref: currentUserReference,
                                                ));
                                            Navigator.pop(context);

                                            safeSetState(() {});
                                          },
                                          text: 'Activate User',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 48.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
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
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

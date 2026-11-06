// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/components/data_load_widget.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/kycverification/kycverification_producer_details_reject_approved/kycverification_producer_details_reject_approved_widget.dart';
import '/store/store_approved/store_approved_widget.dart';
import '/store/storereject/storereject_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;

class CustomListWidget extends StatefulWidget {
  const CustomListWidget({
    super.key,
    this.width,
    this.height,
    required this.farmsList,
  });

  final double? width;
  final double? height;
  final List<FarmsRecord> farmsList;

  @override
  State<CustomListWidget> createState() => _CustomListWidgetState();
}

class _CustomListWidgetState extends State<CustomListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: List.generate(widget.farmsList.length, (farmsIndex) {
        final farmsItem = widget.farmsList[farmsIndex];
        return StreamBuilder<List<UsersRecord>>(
          stream: queryUsersRecord(
            queryBuilder: (usersRecord) => usersRecord.where(
              'uid',
              isEqualTo: farmsItem.userRef?.id,
            ),
            singleRecord: true,
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            List<UsersRecord> rowUsersRecordList = snapshot.data!;
            final rowUsersRecord =
                rowUsersRecordList.isNotEmpty ? rowUsersRecordList.first : null;

            return Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          farmsItem.farmName,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Satoshi',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
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
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                rowUsersRecord?.displayName,
                                'Not Found',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              farmsItem.contactEmail,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<List<ProductRecord>>(
                      future: queryProductRecordOnce(
                        queryBuilder: (productRecord) => productRecord.where(
                          'farm_ref',
                          isEqualTo: farmsItem.reference,
                        ),
                      ),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return DataLoadWidget(
                            height: 26,
                            width: 150,
                            colour: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          );
                        }
                        List<ProductRecord> containerProductRecordList =
                            snapshot.data!;
                        return Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FutureBuilder<List<ScaduleProductRecord>>(
                              future: queryScaduleProductRecordOnce(
                                queryBuilder: (scaduleProductRecord) =>
                                    scaduleProductRecord.where(
                                  'farmRef',
                                  isEqualTo: farmsItem.reference,
                                ),
                              ),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return DataLoadWidget(
                                    height: 26,
                                    width: 150,
                                    colour: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  );
                                }
                                List<ScaduleProductRecord>
                                    containerScaduleProductRecordList =
                                    snapshot.data!;
                                return Text(
                                  '${(valueOrDefault<int>(containerProductRecordList.length, 0) + valueOrDefault<int>(containerScaduleProductRecordList.length, 0)).toString()} items',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<List<OrderRecord>>(
                      stream: queryOrderRecord(
                        queryBuilder: (orderRecord) => orderRecord.where(
                          'farm_ref',
                          isEqualTo: farmsItem.reference,
                        ),
                      ),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return DataLoadWidget(
                            height: 30,
                            width: 150,
                            colour: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          );
                        }
                        List<OrderRecord> containerOrderRecordList =
                            snapshot.data!;
                        return Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    functions
                                        .avargeRating(containerOrderRecordList
                                            .where((e) => e.levaeReview == true)
                                            .toList()
                                            .map((e) => valueOrDefault<double>(
                                                e.review.rate, 0.0))
                                            .toList())
                                        .toString(),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  '${valueOrDefault<String>(
                                    containerOrderRecordList
                                        .where((e) => e.levaeReview == true)
                                        .toList()
                                        .length
                                        .toString(),
                                    '0',
                                  )} reviews',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<List<OrderRecord>>(
                      stream: queryOrderRecord(
                        queryBuilder: (orderRecord) => orderRecord.where(
                          'farm_ref',
                          isEqualTo: farmsItem.reference,
                        ),
                      ),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return DataLoadWidget(
                            height: 30,
                            width: 150,
                            colour: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          );
                        }
                        List<OrderRecord> containerOrderRecordList =
                            snapshot.data!;
                        return Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              '\$${functions.totalsales(containerOrderRecordList.where((e) => e.orderStatus != 'Rejected').toList().map((e) => e.totalAmmount).toList()).toStringAsFixed(2)}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          height: 25.0,
                          decoration: BoxDecoration(
                            color: () {
                              if (farmsItem.approvalType == 'Active') {
                                return const Color(0x3D3BB273);
                              } else if (farmsItem.approvalType == 'Pending') {
                                return const Color(0x3EFF9500);
                              } else {
                                return const Color(0x3CE63946);
                              }
                            }(),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 2.0, 12.0, 2.0),
                            child: Text(
                              valueOrDefault<String>(
                                farmsItem.approvalType,
                                'Pending',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: () {
                                      if (farmsItem.approvalType == 'Active') {
                                        return FlutterFlowTheme.of(context)
                                            .primary;
                                      } else if (farmsItem.approvalType ==
                                          'Pending') {
                                        return FlutterFlowTheme.of(context)
                                            .tertiary;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .error;
                                      }
                                    }(),
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
                            if (farmsItem.approvalType == 'Active') {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: const AlignmentDirectional(
                                            0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: StorerejectWidget(
                                        farmref: farmsItem.reference,
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else if ((farmsItem.approvalType == 'Pending') ||
                                (farmsItem.approvalType == null ||
                                    farmsItem.approvalType == '')) {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: const AlignmentDirectional(
                                            0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: StoreApprovedWidget(
                                        farmref: farmsItem.reference,
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else if ((farmsItem.approvalType ==
                                    'Suspended') ||
                                (farmsItem.approvalType == 'Rejected')) {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: const AlignmentDirectional(
                                            0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child:
                                          KycverificationProducerDetailsRejectApprovedWidget(
                                        farmref: farmsItem.reference,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          text: 'View Details',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            color: const Color(0x003BB273),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Satoshi',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
            );
          },
        );
      }),
    );
  }
}

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

import '/components/nodata_widget.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/reviews_reports/review_details/review_details_widget.dart';

class CustomReviewListWidget extends StatefulWidget {
  const CustomReviewListWidget({
    super.key,
    this.width,
    this.height,
    required this.reviewsList,
    required this.searchText,
  });

  final double? width;
  final double? height;
  final List<OrderRecord> reviewsList;
  final String searchText;

  @override
  State<CustomReviewListWidget> createState() => _CustomReviewListWidgetState();
}

class _CustomReviewListWidgetState extends State<CustomReviewListWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.reviewsList.isEmpty) {
      return NodataWidget(
        message: 'No Reviews ',
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: List.generate(widget.reviewsList.length, (reviewsIndex) {
        final reviewsItem = widget.reviewsList[reviewsIndex];

        return _ReviewListItemWidget(
          key: ValueKey(reviewsItem.reference.id),
          reviewsItem: reviewsItem,
          searchText: widget.searchText,
        );
      }),
    );
  }
}

class _ReviewListItemWidget extends StatefulWidget {
  final OrderRecord reviewsItem;
  final String searchText;

  const _ReviewListItemWidget({
    Key? key,
    required this.reviewsItem,
    required this.searchText,
  }) : super(key: key);

  @override
  State<_ReviewListItemWidget> createState() => _ReviewListItemWidgetState();
}

class _ReviewListItemWidgetState extends State<_ReviewListItemWidget> {
  late Future<List<dynamic>> _dataFuture;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  void didUpdateWidget(_ReviewListItemWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.reviewsItem != widget.reviewsItem) {
      _fetchData();
    }
  }

  void _fetchData() {
    _dataFuture = Future.wait([
      _fetchUser(),
      _fetchFarm(),
      _fetchProduct(),
    ]);
  }

  Future<UsersRecord?> _fetchUser() async {
    if (widget.reviewsItem.review.userRef == null) return null;
    try {
      return await UsersRecord.getDocumentOnce(
          widget.reviewsItem.review.userRef!);
    } catch (e) {
      return null;
    }
  }

  Future<FarmsRecord?> _fetchFarm() async {
    if (widget.reviewsItem.farmRef == null) return null;
    try {
      return await FarmsRecord.getDocumentOnce(widget.reviewsItem.farmRef!);
    } catch (e) {
      return null;
    }
  }

  Future<ProductRecord?> _fetchProduct() async {
    if (widget.reviewsItem.orderItems.isEmpty ||
        widget.reviewsItem.orderItems.first.productRef == null) return null;
    try {
      return await ProductRecord.getDocumentOnce(
          widget.reviewsItem.orderItems.first.productRef!);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _dataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final userRecord = snapshot.data?[0] as UsersRecord?;
        final farmRecord = snapshot.data?[1] as FarmsRecord?;
        final productRecord = snapshot.data?[2] as ProductRecord?;

        final userName = userRecord?.displayName ?? 'Unknown User';
        final farmName = farmRecord?.farmName ?? 'Unknown Farm';
        final productName = productRecord?.productName ?? 'Unknown Product';
        final searchTextLower = widget.searchText.toLowerCase();

        final isVisible = userName.toLowerCase().contains(searchTextLower) ||
            farmName.toLowerCase().contains(searchTextLower) ||
            productName.toLowerCase().contains(searchTextLower);

        if (!isVisible) {
          return SizedBox.shrink();
        }

        return Padding(
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
                      if (userName != '')
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            userName,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      if (widget.reviewsItem.review.comment != null &&
                          widget.reviewsItem.review.comment != '')
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            widget.reviewsItem.review.comment,
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                      productName,
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
                    farmName,
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
                          widget.reviewsItem.review.rate.toString(),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Satoshi',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      FaIcon(
                        FontAwesomeIcons.star,
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
                      dateTimeFormat(
                          "MMMEd", widget.reviewsItem.review.createdAt!),
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
                          if (widget.reviewsItem.review.reviewStatus ==
                              'Approved') {
                            return Color(0x393BB273);
                          } else if (widget.reviewsItem.review.reviewStatus ==
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
                          widget.reviewsItem.review.reviewStatus,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Satoshi',
                                color: () {
                                  if (widget.reviewsItem.review.reviewStatus ==
                                      'Approved') {
                                    return FlutterFlowTheme.of(context).primary;
                                  } else if (widget
                                          .reviewsItem.review.reviewStatus ==
                                      'Pending') {
                                    return FlutterFlowTheme.of(context)
                                        .tertiary;
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
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: GestureDetector(
                                onTap: () {
                                  FocusScope.of(dialogContext).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: ReviewDetailsWidget(
                                  order: widget.reviewsItem.reference,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      text: 'View Details',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0x003BB273),
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
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
        );
      },
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/data_load_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'user_details_widget.dart' show UserDetailsWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserDetailsModel extends FlutterFlowModel<UserDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<OrderRecord>? orders;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ChatRecord>? chats;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ScaduleProductRecord>? scaduleproductasuspend;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ProductRecord>? productssuspend;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CartRecord>? cartproducts;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? favouriteproducts;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ChatRecord>? producerchatsuspend;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<OrderRecord>? ordresproductsuspend;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? favouritfarms;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<OrderRecord>? ordersactivate;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ChatRecord>? chatsactivate;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ScaduleProductRecord>? scaduleproductactivate;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ProductRecord>? productsactivate;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ChatRecord>? producerchatactivate;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<OrderRecord>? ordresproductactivate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

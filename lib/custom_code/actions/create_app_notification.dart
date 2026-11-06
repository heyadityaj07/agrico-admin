// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'index.dart';
import '../../backend/push_notifications/serialization_util.dart';
import '/auth/firebase_auth/auth_util.dart';

Future createAppNotification(
  String title,
  String message,
  String pageName,
  String category,
  String type,
  List<DocumentReference> userRefs,
  String? imageUrl,
  DocumentReference? productRef,
  DocumentReference? farmRef,
  DocumentReference? orderRef,
  DocumentReference? chatRef,
  DocumentReference? helpchat,
) async {
  final now = Timestamp.now();

  // ─────────────────────────────────────────
  // Build parameter data based on pageName
  // ─────────────────────────────────────────
  final Map<String, dynamic> parameterData = {};

  switch (pageName) {
    case 'ProductDetailsPage':
      if (productRef != null) parameterData['product'] = productRef;
      break;

    case 'producerproductDetailsPage':
      if (productRef != null) parameterData['product'] = productRef;
      break;

    case 'OrderDetailsPage':
      if (orderRef != null) parameterData['orderRef'] = orderRef;
      break;

    case 'FarmProfile':
      if (farmRef != null) parameterData['farm'] = farmRef;
      break;

    case 'ChatPage':
      if (chatRef != null) parameterData['chatRef'] = chatRef;
      break;

    case 'HelpAndSuppeortConversation':
      if (helpchat != null) parameterData['helpchat'] = helpchat;
      break;

    case 'OrderTracking':
      if (orderRef != null) parameterData['orderRef'] = orderRef;
      break;

    default:
      break;
  }

  // ─────────────────────────────────────────
  // Format user refs for FlutterFlow FCM
  // ─────────────────────────────────────────
  final userRefsStr = userRefs.map((e) => e.path).join(',');

  // ─────────────────────────────────────────
  // Write to ff_user_push_notifications
  // triggers FlutterFlow's FCM cloud function
  // ─────────────────────────────────────────
  await FirebaseFirestore.instance
      .collection('ff_user_push_notifications')
      .add({
    'notification_title': title,
    'notification_text': message,
    'notification_image_url': imageUrl,
    'notification_sound': 'default',
    'user_refs': userRefsStr,
    'timestamp': now,
    'initial_page_name': pageName,
    'parameter_data': serializeParameterData(parameterData),
    'status': '',
    'num_sent': 0,
    'category': category,
    'type': type,
    'is_read': false,
    'sender': currentUserReference,
    'product_ref': productRef,
    'farm_ref': farmRef,
    'order_ref': orderRef,
    'chat_ref': chatRef,
    'created_at': now,
  });
}

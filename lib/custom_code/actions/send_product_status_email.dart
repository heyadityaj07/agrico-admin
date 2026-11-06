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

// ignore_for_file: unused_import

import 'index.dart'; // Imports other custom actions

import 'package:url_launcher/url_launcher.dart';

Future<bool> sendProductStatusEmail(
  String producerEmail,
  String productName,
  bool isApproved,
  String? rejectionReason,
) async {
  final email = producerEmail.trim();
  final name =
      productName.trim().isNotEmpty ? productName.trim() : 'your product';
  final reason = rejectionReason?.trim();
  final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  final subject = isApproved
      ? 'Your Product Has Been Approved'
      : 'Your Product Has Been Rejected';

  final body = isApproved
      ? '''Hello,

Good news! Your product "$name" has been approved by the Agricoo admin team.

Status: Approved

Your product is now ready to be active in the marketplace.

Regards,
Agricoo Team'''
      : '''Hello,

We are sorry to inform you that your product "$name" has not been approved by the Agricoo admin team.

Reason for rejection:
${reason?.isNotEmpty == true ? reason : 'Not specified.'}

Status: Rejected

Please review the reason above and update your product details before submitting again.

Regards,
Agricoo Team''';

  if (email.isEmpty || !emailRegex.hasMatch(email)) {
    return false;
  }

  final mailUri = Uri(
    scheme: 'mailto',
    path: email,
    query: {
      'subject': subject,
      'body': body,
    }
        .entries
        .map(
          (entry) =>
              '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value)}',
        )
        .join('&'),
  );

  try {
    return await launchUrl(
      mailUri,
      mode: LaunchMode.externalApplication,
    );
  } catch (_) {
    return false;
  }
}

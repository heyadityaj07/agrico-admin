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

//
class PermissionIcon extends StatefulWidget {
  const PermissionIcon({
    super.key,
    this.width,
    this.height,
    required this.subRole,
    required this.section,
    required this.action,
  });

  final double? width;
  final double? height;
  final String subRole;
  final String section;
  final String action;

  @override
  State<PermissionIcon> createState() => _PermissionIconState();
}

class _PermissionIconState extends State<PermissionIcon> {
  @override
  Widget build(BuildContext context) {
    final allowed =
        hasPermission(widget.subRole, widget.section, widget.action);
    return Icon(
      allowed ? Icons.check : Icons.close,
      color: allowed
          ? FlutterFlowTheme.of(context).primary
          : FlutterFlowTheme.of(context).accent2,
      size: 24.0,
    );
  }
}

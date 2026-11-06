import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'data_load_model.dart';
export 'data_load_model.dart';

class DataLoadWidget extends StatefulWidget {
  const DataLoadWidget({
    super.key,
    required this.height,
    required this.width,
    required this.colour,
  });

  final int? height;
  final int? width;
  final Color? colour;

  @override
  State<DataLoadWidget> createState() => _DataLoadWidgetState();
}

class _DataLoadWidgetState extends State<DataLoadWidget> {
  late DataLoadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DataLoadModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget!.width?.toDouble(),
      height: widget!.height?.toDouble(),
      decoration: BoxDecoration(
        color: widget!.colour,
      ),
    );
  }
}

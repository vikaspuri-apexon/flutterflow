import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButtonWidget extends StatefulWidget {
  const PrimaryButtonWidget({Key? key}) : super(key: key);

  @override
  _PrimaryButtonWidgetState createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
      child: FFButtonWidget(
        onPressed: () async {
          context.pushNamed('HomePage');
        },
        text: 'Explore blogs',
        options: FFButtonOptions(
          width: 300,
          height: 50,
          color: FlutterFlowTheme.of(context).secondaryBackground,
          textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
          elevation: 2,
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
        ),
      ),
    );
  }
}

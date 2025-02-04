import '/flutter_flow/flutter_flow_util.dart';
import 'enter_mobile_widget.dart' show EnterMobileWidget;
import 'package:flutter/material.dart';

class EnterMobileModel extends FlutterFlowModel<EnterMobileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

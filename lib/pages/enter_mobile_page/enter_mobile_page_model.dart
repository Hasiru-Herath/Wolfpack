import '/flutter_flow/flutter_flow_util.dart';
import 'enter_mobile_page_widget.dart' show EnterMobilePageWidget;
import 'package:flutter/material.dart';

class EnterMobilePageModel extends FlutterFlowModel<EnterMobilePageWidget> {
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

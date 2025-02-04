import '/flutter_flow/flutter_flow_util.dart';
import 'age_confirmation_page_widget.dart' show AgeConfirmationPageWidget;
import 'package:flutter/material.dart';

class AgeConfirmationPageModel
    extends FlutterFlowModel<AgeConfirmationPageWidget> {
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

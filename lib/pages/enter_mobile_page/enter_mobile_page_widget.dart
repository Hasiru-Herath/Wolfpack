import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:wolf_pack/index.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'enter_mobile_page_model.dart';
export 'enter_mobile_page_model.dart';


class EnterMobilePageWidget extends StatefulWidget {
  const EnterMobilePageWidget({super.key});

  @override
  State<EnterMobilePageWidget> createState() => _EnterMobilePageWidgetState();
}


class _EnterMobilePageWidgetState extends State<EnterMobilePageWidget> {
  late EnterMobilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  PhoneNumber? _phoneNumber;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EnterMobilePageModel());

    _model.textController ??=
        TextEditingController(text: 'Enter mobile number');
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(15.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            actions: const [],
            centerTitle: true,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'What’s Your Digits?',
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Raleway',
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                'Don’t worry, we’re not calling you \n(unless it’s love).',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Raleway',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.7,
                                child: InternationalPhoneNumberInput(
                                  onInputChanged: (PhoneNumber number) {
                                    _phoneNumber = number;
                                  },
                                  onInputValidated: (bool isValid) {
                                    print('Valid number: $isValid');
                                  },
                                  selectorConfig: SelectorConfig(
                                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET, // Dropdown or dialog
                                  ),
                                  ignoreBlank: false,
                                  autoValidateMode: AutovalidateMode.onUserInteraction,
                                  textStyle: TextStyle(fontSize: 16),
                                  selectorTextStyle: TextStyle(color: Colors.black),
                                  initialValue: _phoneNumber,
                                  textFieldController: _model.textController,
                                  formatInput: true,
                                  keyboardType: TextInputType.phone,
                                  inputDecoration: InputDecoration(
                                    hintText: 'Mobile Number',
                                    // border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your mobile number';
                                    }
                                    return null;
                                  },
                                  onSaved: (PhoneNumber number) {
                                    print('Saved number: $number');
                                  },
                                ),

                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  String mobileNumber = _model.textController.text.trim();
                                  print(mobileNumber.length.toString());
                                  if (mobileNumber.isEmpty || mobileNumber.length > 12) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Please enter a valid mobile number')),
                                    );
                                    return;
                                  }

                                  // Send OTP
                                  await _auth.verifyPhoneNumber(
                                    phoneNumber: '+94$mobileNumber',  // Change country code accordingly
                                    verificationCompleted: (PhoneAuthCredential credential) async {
                                      await _auth.signInWithCredential(credential);
                                    },
                                    verificationFailed: (FirebaseAuthException e) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Verification failed: ${e.message}')),
                                      );
                                    },
                                    codeSent: (String verificationId, int? resendToken) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => VerificationPageWidget(verificationId: verificationId, mobileNumber: mobileNumber),
                                        ),
                                      );
                                    },
                                    codeAutoRetrievalTimeout: (String verificationId) {},
                                  );
                                },
                                text: 'Send the Code',
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.9,
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.black,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        color: const Color(0xFFD4AF37),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  elevation: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

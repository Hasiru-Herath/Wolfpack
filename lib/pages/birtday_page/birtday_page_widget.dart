import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:wolf_pack/index.dart';

import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'birtday_page_model.dart';
export 'birtday_page_model.dart';

class BirtdayPageWidget extends StatefulWidget {
  final String id;
  const BirtdayPageWidget({Key? key, this.id = "DefaultID"}) : super(key: key);

  @override
  State<BirtdayPageWidget> createState() => _BirtdayPageWidgetState();
}

class _BirtdayPageWidgetState extends State<BirtdayPageWidget> {
  late BirtdayPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  Future<void> saveUserDOB() async {
    User? user = _auth.currentUser;
    if (user != null) {
      String uid = widget.id;
      String dob = _model.textController .text.trim();

      print(widget.id+""+dob);

      await _database.child("users").child(uid).update({
        "dob": dob,
      }).then(
              (_){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AgeConfirmationPageWidget()),
            );
          }
      );


    }
  }
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BirtdayPageModel());

    _model.textController ??= TextEditingController(text: 'DD/MM/YYYY');
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
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Row(
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
                          'When’s the Party?',
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
                              'We need your birthday \nto make it special (and legal).',
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
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x63000000),
                                      width: 1.0,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .error,
                                      width: 1.0,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .error,
                                      width: 1.0,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                cursorColor: FlutterFlowTheme.of(context)
                                    .primaryText,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
              child: FlutterFlowCalendar(
                color: const Color(0xFF292929),
                iconColor: FlutterFlowTheme.of(context).secondaryText,
                weekFormat: false,
                weekStartsMonday: true,
                rowHeight: 48.0,
                onChange: (DateTimeRange? newSelectedDate) {
                  if (newSelectedDate != null) {
                    setState(() {
                      _model.calendarSelectedDay = newSelectedDate;
                      _model.textController?.text =
                          DateFormat('dd/MM/yyyy').format(newSelectedDate.start);
                    });
                  }
                },
                titleStyle: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Inter Tight',
                  letterSpacing: 0.0,
                ),
                dayOfWeekStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Inter',
                  color: const Color(0xFF5E5D5C),
                  letterSpacing: 0.0,
                ),
                dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: const Color(0xFF808080),
                  letterSpacing: 0.0,
                ),
                selectedDateStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Inter Tight',
                  color: const Color(0xFFD4AF37),
                  letterSpacing: 0.0,
                ),
                inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
              ),

            ),
            Flexible(
              child: Row(
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
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                                saveUserDOB();
                              },
                              text: 'Next',
                              options: FFButtonOptions(
                                width:
                                    MediaQuery.sizeOf(context).width * 0.9,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF292929),
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
            ),
          ],
        ),
      ),
    );
  }
}

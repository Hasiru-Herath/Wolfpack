import 'package:firebase_database/firebase_database.dart';
import 'package:wolf_pack/index.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'age_confirmation_page_model.dart';
export 'age_confirmation_page_model.dart';

class AgeConfirmationPageWidget extends StatefulWidget {
  final String id;
  const AgeConfirmationPageWidget({super.key,required this.id });

  @override
  State<AgeConfirmationPageWidget> createState() =>
      _AgeConfirmationPageWidgetState();
}

class _AgeConfirmationPageWidgetState extends State<AgeConfirmationPageWidget> {
  late AgeConfirmationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();


  Future<String> getUserAge() async {
    String uid=widget.id;
    final DatabaseReference _database = FirebaseDatabase.instance.ref();

    try {
      DataSnapshot snapshot = await _database.child("users").child(uid).child('dob').get();

      if (snapshot.exists && snapshot.value != null) {
        String dobString = snapshot.value.toString();
        DateTime dob = DateFormat("MM/dd/yyyy").parse(dobString);

        DateTime today = DateTime.now();
        int age = today.year - dob.year;

        if (today.month < dob.month || (today.month == dob.month && today.day < dob.day)) {
          age--;
        }

        print(age);
        return age.toString();
      } else {
        return "DOB not found";
      }
    } catch (e) {
      print("Error fetching DOB: $e");
      return "Error fetching age";
    }
  }
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgeConfirmationPageModel());


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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Wait… ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                fontFamily: 'Raleway',
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            FutureBuilder<String>(
                              future: getUserAge(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Text(
                                    "Loading...",
                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Raleway',
                                      color: const Color(0xFFD4AF37),
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text(
                                    "Error fetching age",
                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Raleway',
                                      color: Colors.red,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    "You’re ${snapshot.data}?",
                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Raleway',
                                      color: const Color(0xFFD4AF37),
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                }
                              },
                            )

                          ],
                        ),
                        Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child:FutureBuilder<String>(
                              future: getUserAge(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Text(
                                    "Loading...",
                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Raleway',
                                      color: const Color(0xFFD4AF37),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text(
                                    "Error fetching age",
                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Raleway',
                                      color: Colors.red,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    "Let’s Lock in ${snapshot.data}. Just so you know,  ",
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: 'Raleway',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                }
                              },
                            )

                        ),
                        Text(
                          'you can’t change this later.',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                            fontFamily: 'Raleway',
                            color: const Color(0xFFD4AF37),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                                getUserAge();
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>GenderConfirmationPageWidget(id: widget.id,)));
                              },
                              text: 'Got It!',
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BirtdayPageWidget(id: widget.id,)));
                            },
                            child: Text(
                              'Edit my Date of Birth',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                fontFamily: 'Poppins',
                                color: const Color(0xFFD4AF37),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
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
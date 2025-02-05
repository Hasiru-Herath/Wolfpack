import 'package:wolf_pack/index.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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
      child:  Scaffold(
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
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Pushes content to top and button to bottom
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Genuine',
                        style: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Good Morning, ',
                  style: FlutterFlowTheme.of(context)
                      .bodyLarge
                      .override(
                    fontFamily: 'Raleway',
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Shebin',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                        fontFamily: 'Raleway',
                        color: const Color(0xFFD4AF37),
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Your date is ready.',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                        fontFamily: 'Raleway',
                        color: Colors.black,
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Button at the bottom
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: FFButtonWidget(
            onPressed: () {
              print('Button pressed ...');
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage2Widget()));
            },
            text: 'Click to reveal',
            options: FFButtonOptions(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 40.0,
              color: Colors.black,
              textStyle: FlutterFlowTheme.of(context)
                  .titleSmall
                  .override(
                fontFamily: 'Inter Tight',
                color: const Color(0xFFD4AF37),
                letterSpacing: 0.0,
                fontWeight: FontWeight.w400,
              ),
              elevation: 1.0,
            ),
          ),
        ),
      ],
    ),
    ),
    )
    ,
    );
  }
}

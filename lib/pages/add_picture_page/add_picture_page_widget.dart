import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'add_picture_page_model.dart';
export 'add_picture_page_model.dart';

class AddPicturePageWidget extends StatefulWidget {
  const AddPicturePageWidget({super.key});

  @override
  State<AddPicturePageWidget> createState() => _AddPicturePageWidgetState();
}

class _AddPicturePageWidgetState extends State<AddPicturePageWidget> {
  late AddPicturePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddPicturePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
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
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Let’s See That Gorgeous\n Face!',
                        style: FlutterFlowTheme.of(context)
                            .bodyLarge
                            .override(
                          fontFamily: 'Raleway',
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildInfoRow(Icons.camera_alt,
                          'Upload a clear, solo photo \nwhere your face is fully visible.'),
                      _buildInfoRow(Icons.block,
                          'No group selfies – this isn’t a squad\npic contest.'),
                      _buildInfoRow(Icons.search,
                          'No long shots – we want to see you \nup close, not in the next zip code.'),
                      _buildInfoRow(Icons.adb,
                          'No object photos – yes, your bike \nand kitten are cute, but we’re here for you.'),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: 'Let’s move on!',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
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
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.black, size: 24.0),
          const SizedBox(width: 8.0),
          Expanded(
            child: AutoSizeText(
              text,
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context)
                  .bodyMedium
                  .override(
                fontFamily: 'Raleway',
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

}

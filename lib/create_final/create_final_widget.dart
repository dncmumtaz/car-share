import 'package:carshare/active_trips_created/active_trips_created.dart';
import 'package:carshare/models/saved_trip_model.dart';
import 'package:carshare/models/user_model.dart';
import 'package:carshare/services/get_saved_trip.dart';
import 'package:carshare/services/login_service.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../navbar.dart';
import '../your_trips_creator/your_trips_creator_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carshare/globals.h';
class CreateFinalWidget extends StatefulWidget {

  const CreateFinalWidget({Key key}) : super(key: key);

  @override
  _CreateFinalWidgetState createState() => _CreateFinalWidgetState();
}

class _CreateFinalWidgetState extends State<CreateFinalWidget> {
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 108,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xFFEEEEEE),
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Create a Trip',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF2596BE),
                                    fontSize: 34,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Congratulations! Your trip published!',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.bodyText1,
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 80, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(

                              onPressed: () async {
                                try{


                                UserModel user = new UserModel(Globals.id,Globals.address,Globals.email,Globals.firstname,Globals.lastname,Globals.mobile, Globals.password, Globals.username, Globals.points);
                                LoginService loginService = new LoginService();
                                loginService.setData(Globals.username, Globals.password);
                                user = await loginService.postData();

                                SavedTripService savedTripService = new SavedTripService();

                                SavedTripModel savedTripModel;// = await savedTripService.getSavedTrips(user.id);

                                NavBarPage nv = new NavBarPage(user: user);

                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    nv,
                                  ),
                                );
                                }

                                 finally {
                                setState(() => _loadingButton = false);
                                 }

                              },


                              text: 'Go to Main Page',
                              options: FFButtonOptions(
                                width: 180,
                                height: 50,
                                color: Color(0xFF2596BE),
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                              loading: _loadingButton,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:carshare/active_trips_requested/active_trips_requested.dart';
import 'package:carshare/google_map_screens/google_map_screen.dart';
import 'package:carshare/join_a_trip_date/join_a_trip_date_widget.dart';
import 'package:carshare/join_saved_trip_date/join_a_trip_date_widget.dart';
import 'package:carshare/models/join_a_trip_model.dart';
import 'package:carshare/models/saved_trip_model.dart';
import 'package:carshare/related_trips/related_trips_widget.dart';
import 'package:carshare/selectChoice/select_start_choice.dart';
import 'package:carshare/services/joined_trip_service.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../join_a_trip_time/join_a_trip_time_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../join_a_trip_start/join_a_trip_start_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:carshare/globals.h";
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carshare/globals.h';
import 'package:permission_handler/permission_handler.dart';

class JoinTripFirstPageWidget extends StatefulWidget {

  const JoinTripFirstPageWidget({Key key}) : super(key: key);

  @override
  _JoinTripFirstPageWidgetState createState() =>
      _JoinTripFirstPageWidgetState();
}
var jsonTrips;

class _JoinTripFirstPageWidgetState extends State<JoinTripFirstPageWidget> {
  JoinATripModel joinATripModel = new JoinATripModel();

  JoinedTripService joinedTripService = new JoinedTripService();

  TextEditingController textController1;
  TextEditingController textController2;
  DateTimeRange calendarSelectedDay;

  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  getSavedTrips()async{
    Future.delayed(Duration(seconds:0), () => setState(() async{

      String url = "https://carshareflutter.herokuapp.com/getSavedTrips?id="+Globals.id.toString();
      print("url : "+url);
      var response = await http.get(Uri.parse(url),
      );

      Map<String, dynamic> responseJson = json.decode(response.body);



      Globals.jsonTrips = responseJson;

      print(Globals.jsonTrips ['result'][0]['start']);
      print(Globals.jsonTrips['result'][0]['endPoint']);

      print(Globals.jsonTrips['result'].length);
    }));

  }

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
 //   getSavedTrips();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

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
                height: 118,
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
                                  'Join a Trip',
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
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Color(0xFFB6ADAD),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 1, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "100 Points",
                                                      style: FlutterFlowTheme
                                                          .bodyText1,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 15,
                                                        height: 15,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 2,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 15,
                                                        height: 15,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEEEEE),
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.05, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 10,
                                                                height: 10,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  'Pendik Köprüsü D100\n34896 Pendik/İstanbul',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme
                                                                      .bodyText1,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10,
                                                                    40, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 10,
                                                              height: 10,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .black,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'Sabiha Gökçen Uluslararası Havalimanı\n (SAW), Pendik/İstanbul',
                                                                style: FlutterFlowTheme
                                                                    .bodyText1,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),

 
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 20, 0),
                                                          child: FFButtonWidget(
                                                            onPressed: () async {

                                                              joinATripModel.setStartAddress('Pendik Köprüsü D100\n34896 Pendik/İstanbul');
                                                              joinATripModel.setEndAddress('Sabiha Gökçen Uluslararası Havalimanı\n (SAW), Pendik/İstanbul');
                                                              joinATripModel.setStartLat(40.878830.toString());
                                                              joinATripModel.setStartLong(29.260180.toString());
                                                              joinATripModel.setEndLat(40.905371.toString());
                                                              joinATripModel.setEndLong(29.3168603.toString());
                                                              Globals.JoinTripAddress = 'Pendik Köprüsü D100\n34896 Pendik/İstanbul';

                                                              await Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) =>

                                                                      JoinATripDateWidget(joinATripModel: joinATripModel),
                                                                ),
                                                              );
                                                            },
                                                            text: 'Select Date',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 150,
                                                              height: 40,
                                                              color: Color(
                                                                  0xFF2596BE),
                                                              textStyle:
                                                                  FlutterFlowTheme
                                                                      .subtitle2
                                                                      .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1,
                                                              ),
                                                              borderRadius: 12,
                                                            ),
                                                            loading:
                                                                _loadingButton,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () async {
                                  var status = await Permission.location.request();

                                  if (status.isDenied) {
                                    print('restr1');
                                    // We didn't ask for permission yet.
                                  }

                                  // You can can also directly ask the permission about its status.
                                  if (await Permission.location.isRestricted) {
                                      print('restr2');
                                  }

                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    SelectChoice(),
                                  ),
                                );
                              },
                              child: Text(
                                'Search for Another Trip',
                                style: FlutterFlowTheme.bodyText1,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional
                            .fromSTEB(0,
                            50, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            var joinedArr = await joinedTripService.getJoinedTrips(Globals.id);
                            int joinedArrLength = joinedTripService.arrSize;

                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ActiveTripsRequested(joinedArr: joinedArr, joinedArrLength: joinedArrLength),
                              ),
                            );

                          },
                          text: 'Active Trips Requested',
                          options:
                          FFButtonOptions(
                            width: 330,
                            height: 50,
                            color: Color(
                                0xFF2596BE),
                            textStyle:
                            FlutterFlowTheme
                                .subtitle2
                                .override(
                              fontFamily:
                              'Poppins',
                              color: Colors
                                  .white,
                            ),
                            borderSide:
                            BorderSide(
                              color: Colors
                                  .transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                          loading:
                          _loadingButton,
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

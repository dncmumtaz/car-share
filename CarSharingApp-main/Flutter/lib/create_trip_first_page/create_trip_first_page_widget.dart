import 'package:carshare/active_trips_created/active_trips_created.dart';
import 'package:carshare/active_trips_requested/active_trips_requested.dart';
import 'package:carshare/createSelect/create_select.dart';
import 'package:carshare/create_a_new_trip_date/create_a_new_trip_date_widget.dart';
import 'package:carshare/google_map_screens/create_go_google_map.dart';
import 'package:carshare/google_map_screens/google_map_screen.dart';
import 'package:carshare/join_saved_trip_date/join_a_trip_date_widget.dart';
import 'package:carshare/models/CreateATripModel.dart';
import 'package:carshare/models/saved_trip_model.dart';
import 'package:carshare/related_trips/related_trips_widget.dart';
import 'package:carshare/services/get_users_trips_service.dart';
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

class CreateTripFirstPageWidget extends StatefulWidget {

  final SavedTripModel savedTripModel;

  const CreateTripFirstPageWidget({Key key,  @required this.savedTripModel}) : super(key: key);

  @override
  _CreateTripFirstPageWidgetState createState() =>
      _CreateTripFirstPageWidgetState(savedTripModel: savedTripModel);
}
var jsonTrips;

class _CreateTripFirstPageWidgetState extends State<CreateTripFirstPageWidget> {
  final SavedTripModel savedTripModel;

  GetUsersTripService getUsersTripService = new GetUsersTripService();
  CreateATripModel createATripModel = new CreateATripModel();
  _CreateTripFirstPageWidgetState({@required this.savedTripModel});

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
                                                              createATripModel.setStartAddress('Pendik Köprüsü D100\n34896 Pendik/İstanbul');
                                                              createATripModel.setEndAddress('Sabiha Gökçen Uluslararası Havalimanı\n (SAW), Pendik/İstanbul');
                                                              createATripModel.setStartLat(40.878830.toString());
                                                              createATripModel.setStartLong(29.260180.toString());
                                                              createATripModel.setEndLat(40.905371.toString());
                                                              createATripModel.setEndLong(29.3168603.toString());

                                                              await Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      CreateATripDateWidget(createATripModel: createATripModel)
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
                                        CreateSelectChoice(),
                                  ),
                                );
                              },
                              child: Text(
                                'Create Another Trip',
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
                            print("Date"+textController1.text);
                            print("Time"+textController2.text);/*
                            Globals.tripStartJoin = Globals.jsonTrips['result'][0]['start'];
                            Globals.tripEndJoin = Globals.jsonTrips['result'][0]['endPoint'];
*/
                            var tripArr = await getUsersTripService.getUsersTrip(Globals.id);
                            int arrLength = getUsersTripService.arrSize;

                            print(tripArr);

                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>

                                    ActiveTripsCreated(tripsArr: tripArr, tripsArrSize: arrLength),
                              ),
                            );

                          },
                          text: 'Active Trips Created',
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

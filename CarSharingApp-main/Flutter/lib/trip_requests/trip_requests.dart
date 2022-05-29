import 'package:carshare/active_trips_created/active_trips_created.dart';
import 'package:carshare/flutter_flow/flutter_flow_widgets.dart';
import 'package:carshare/models/CreateATripModel.dart';
import 'package:carshare/models/join_a_trip_model.dart';
import 'package:carshare/models/user_model.dart';
import 'package:carshare/services/ApproveService.dart';
import 'package:carshare/services/add_user_in_trip.dart';
import 'package:carshare/services/delete_request_service.dart';
import 'package:carshare/services/get_users_trips_service.dart';
import 'package:carshare/services/reject_request_service.dart';
import 'package:carshare/services/setNotfFalse.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../trip_page/trip_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carshare/globals.h';

class TripRequestsWidget extends StatefulWidget {
  final requestsArr;
  final requestsArrLength;
  const TripRequestsWidget({Key key, this.requestsArr, this.requestsArrLength}) : super(key: key);

  @override
  _TripRequestsWidgetState createState() => _TripRequestsWidgetState(requestsArr, requestsArrLength);
}

class _TripRequestsWidgetState extends State<TripRequestsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var userNames;

  var _loadingButton1 = false;

  var requestsArr;
  int requestsArrLength;
  _TripRequestsWidgetState(var requestsArr, int requestsArrLength){
      this.requestsArr = requestsArr;
      this.requestsArrLength = requestsArrLength;
  }
  getUserInfo()async{
    String url2 = "https://carshareflutter.herokuapp.com/getUsersInTrip?id=10";
    print("url2 : "+url2);
    var response2 = await http.get(Uri.parse(url2),
    );
  }


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
/*
      onWillPop: () async {
        GetUsersTripService getUsersTripService = new GetUsersTripService();

        var tripArr = await getUsersTripService.getUsersTrip(Globals.id);
        int arrLength = getUsersTripService.arrSize;


        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>

                ActiveTripsCreated(tripsArr: tripArr, tripsArrSize: arrLength),

          ),
        );
      },
 */
      key: scaffoldKey,
      child: Scaffold(
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
                                  'Trip Requests',
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
                      for (int i = 0; i < requestsArrLength ; i++)

                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [

                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: InkWell(

                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 260,
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
                                                        .fromSTEB(0, 10, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      5,
                                                                      8,
                                                                      8,
                                                                      8),
                                                                  child:
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        100),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/profile.png',
                                                                      width: 55,
                                                                      height: 55,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                              children: [
                                                                Text(
                                                                  requestsArr[i]['namesurname']??'name surname',
                                                                  style: FlutterFlowTheme
                                                                      .bodyText1,
                                                                )
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,

                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(10, 10, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                              children: [
                                                                Text(
                                                                  'Location: '
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                              children: [
                                                                Text(
                                                                  (requestsArr[i]['location'].toString())??'Location',
                                                                  style: FlutterFlowTheme
                                                                      .bodyText1,
                                                                )
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,

                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
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
                                                                  0, 20, 20),
                                                              child: FFButtonWidget(
                                                                onPressed: () async {
                                                                  DeleteRequestService deleteRequestService = new DeleteRequestService();

                                                                  SetNotfFalseService setNotfFalseService = new SetNotfFalseService();
                                                                  setNotfFalseService.setNotfFalse(requestsArr[i]['trip_id']);

                                                                  ApproveService approveService = new ApproveService();
                                                                  await approveService.approveRequest(requestsArr[i]['trip_id'], requestsArr[i]['sender_id']);
                                                                  AddUserInATrip addUserInATrip = new AddUserInATrip();

                                                                  await addUserInATrip.setTrip_id(requestsArr[i]['trip_id']);
                                                                  await addUserInATrip.setCreator_id(requestsArr[i]['getter_id']);
                                                                  await addUserInATrip.setPassenger_id(requestsArr[i]['sender_id']);
                                                                  await addUserInATrip.setPassenger_name(requestsArr[i]['namesurname']);

                                                                  await addUserInATrip.addUserInATrip();

                                                                  GetUsersTripService getUsersTripService = new GetUsersTripService();

                                                                  var tripArr = await getUsersTripService.getUsersTrip(Globals.id);
                                                                  int arrLength = getUsersTripService.arrSize;

                                                                  print(tripArr);
                                                                  
                                                                  deleteRequestService.deleteRequest(requestsArr[i]['id']);
                                                                  requestsArr.removeAt(i);

                                                                  await Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (context) =>

                                                                          ActiveTripsCreated(tripsArr: tripArr, tripsArrSize: arrLength),
                                                                    ),
                                                                  );

                                                                  },
                                                                text: 'Approve',
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
                                                                _loadingButton1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                1, 0),
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                  0, 20, 20),
                                                              child: FFButtonWidget(
                                                                onPressed: () async{
                                                                  SetNotfFalseService setNotfFalseService = new SetNotfFalseService();
                                                                  setNotfFalseService.setNotfFalse(requestsArr[i]['trip_id']);

                                                                  RejectService rejectService = new RejectService();
                                                                  rejectService.rejectRequest(requestsArr[i]['trip_id'], requestsArr[i]['sender_id']);

                                                                  GetUsersTripService getUsersTripService = new GetUsersTripService();

                                                                  var tripArr = await getUsersTripService.getUsersTrip(Globals.id);
                                                                  int arrLength = getUsersTripService.arrSize;

                                                                  print(tripArr);
                                                                  DeleteRequestService deleteRequestService = new DeleteRequestService();
                                                                  deleteRequestService.deleteRequest(requestsArr[i]['id']);
                                                                  requestsArr.removeAt(i);

                                                                  await Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (context) =>

                                                                          ActiveTripsCreated(tripsArr: tripArr, tripsArrSize: arrLength),
                                                                    ),
                                                                  );

                                                                },
                                                                text: 'Reject',
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
                                                                _loadingButton1,
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
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
    );
  }
}

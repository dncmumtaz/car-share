import 'package:carshare/join_a_trip_date/join_a_trip_date_widget.dart';
import 'package:carshare/models/user_model.dart';
import 'package:carshare/postpone_trip/postpone_trip.dart';
import 'package:carshare/services/cancel_trip_service.dart';
import 'package:carshare/services/getUserService.dart';
import 'package:carshare/services/get_trip_requests.dart';
import 'package:carshare/services/get_users_trips_service.dart';
import 'package:carshare/services/login_service.dart';
import 'package:carshare/services/trip_canceled_service.dart';
import 'package:carshare/trip_requests/trip_requests.dart';
import 'package:carshare/globals.h';
import 'package:carshare/user_profile_page/user_profile_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../navbar.dart';



class ActiveTripsCreated extends StatefulWidget {
  final tripsArr;
  final tripsArrSize;
  const ActiveTripsCreated({Key key,  @required this.tripsArr, @required this.tripsArrSize}) : super(key: key);

  @override
  _ActiveTripsCreatedState createState() => _ActiveTripsCreatedState(tripsArr,tripsArrSize);
}

class _ActiveTripsCreatedState extends State<ActiveTripsCreated> {
  var tripsArr;
  int tripsArrSize;
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int passArrayLength = 1;
  double containerHeight;
  String notf = ' ';
  GetTripRequests getTripRequests = new GetTripRequests();

  _ActiveTripsCreatedState(var tripsArr, int tripsArrSize){
    this.tripsArr = tripsArr;
    this.tripsArrSize = tripsArrSize;



  }
  @override
  Widget build(BuildContext context) {



    return WillPopScope(

      onWillPop: () async {

        print('Poppeeddd');
        UserModel user;
        LoginService loginService = new LoginService();

        String email = Globals.username;
        String password = Globals.password;


        loginService.setData(email, password);
        user = await loginService.postData();

        print('\n\n\nUser:\n\n'+user.toString());
        print(email);
        print(password);
        NavBarPage nv = new NavBarPage(user: user, initialPage: 'CreateTripFirstPage');

        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
            nv,
          ),
        );
      },


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
                                  'Active Trips Created',
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

                      for (int i = 0; i < tripsArrSize ; i++)
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
                                  height: containerHeight,
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
                                                      tripsArr[i]['trip']['point'].toString()+ ' Points'??'x Point ',
                                                      style: FlutterFlowTheme
                                                          .bodyText1,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 0, 10, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              tripsArr[i]['trip']['time']??'time',
                                                              style:
                                                              FlutterFlowTheme
                                                                  .bodyText1,
                                                            )
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(0,
                                                              40, 0, 0),

                                                        )
                                                      ],
                                                    ),
                                                  ),
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
                                                                  tripsArr[i]['trip']['startaddress']??'Start',
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
                                                                tripsArr[i]['trip']['endaddress']??'End',
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
                                              for(int j=0 ; j<tripsArr[i]['users'].length ; j++)

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
                                                          MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  5,
                                                                  8,
                                                                  8,
                                                                  8),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    100),
                                                                child:
                                                                Image.asset(
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
                                                          MainAxisSize.max,
                                                          children: [
                                                            InkWell(
                                                              onTap: () async{
                                                                GetUserService getUserService = new GetUserService();
                                                                var jsonVar = await getUserService.getUser(tripsArr[i]['users'][j]['passenger_id']);
                                                                print(jsonVar);
                                                                setState(() =>
                                                                _loadingButton1 = true);
                                                                try {
                                                                  await Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          UserProfilePageWidget(userInfo: jsonVar),
                                                                    ),
                                                                  );
                                                                } finally {
                                                                  setState(() =>
                                                                  _loadingButton1 =
                                                                  false);
                                                                }                                                              },
                                                                child: Text(
                                                                  tripsArr[i]['users'][j]['passenger_name']??'Name Surname',
                                                                  style:
                                                                  FlutterFlowTheme
                                                                      .bodyText1,
                                                                )


                                                            ),

                                                          ],
                                                        ),
                                                        Row(

                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            Column(
                                                              children: [
                                                                InkWell(
                                                                    onTap: () async{
                                                                      GetUserService getUserService = new GetUserService();
                                                                      var jsonVar = await getUserService.getUser(tripsArr[i]['users'][j]['passenger_id']);
                                                                      print(jsonVar);
                                                                      setState(() =>
                                                                      _loadingButton1 = true);
                                                                      try {
                                                                        await Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                UserProfilePageWidget(userInfo: jsonVar),
                                                                          ),
                                                                        );
                                                                      } finally {
                                                                        setState(() =>
                                                                        _loadingButton1 =
                                                                        false);
                                                                      }                                                              },
                                                                    child: Text(
                                                                      'Payment: ',
                                                                      style:
                                                                      FlutterFlowTheme
                                                                          .bodyText1,
                                                                    )


                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                InkWell(
                                                                    onTap: () async{
                                                                      GetUserService getUserService = new GetUserService();
                                                                      var jsonVar = await getUserService.getUser(tripsArr[i]['users'][j]['passenger_id']);
                                                                      print(jsonVar);
                                                                      setState(() =>
                                                                      _loadingButton1 = true);
                                                                      try {
                                                                        await Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                UserProfilePageWidget(userInfo: jsonVar),
                                                                          ),
                                                                        );
                                                                      } finally {
                                                                        setState(() =>
                                                                        _loadingButton1 =
                                                                        false);
                                                                      }                                                              },
                                                                    child: Text(
                                                                      tripsArr[i]['users'][j]['payment']??'Waiting',
                                                                      style: TextStyle(fontWeight: FontWeight.bold),

                                                                    )


                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )

                                                      ],
                                                    ),

                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          20, 0, 0, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .end,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            children: [
                                                              Text(
                                                                ' ',
                                                                style: FlutterFlowTheme
                                                                    .bodyText1,
                                                              ),

                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),

                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 30, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Date :',
                                                      style: FlutterFlowTheme
                                                          .bodyText1,
                                                    ),
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          10, 0, 0, 0),
                                                      child: Text(
                                                        tripsArr[i]['trip']['date'].toString()??'date',
                                                        style: FlutterFlowTheme
                                                            .bodyText1,
                                                      ),
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

                                                              int tempTripId = int.parse(tripsArr[i]['trip']['id'].toString());
                                                              await Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      PostponeTripWidget(tripId: tempTripId),
                                                                ),
                                                              );

                                                            },
                                                            text: 'Postpone',
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
                                                              TripCanceledService tripCanceledService = new TripCanceledService();
                                                              tripCanceledService.tripCanceled(tripsArr[i]['trip']['id']);

                                                              CancelTripService cancelTripService = new CancelTripService();
                                                              await cancelTripService.cancelTrip(tripsArr[i]['trip']['id']);

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
                                                            text: 'Cancel',
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
                                                            _loadingButton2,
                                                          ),
                                                        ),
                                                      ),
                                                    ),

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

                                                    if(tripsArr[i]['trip']['notf'] == 'true')
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                        AlignmentDirectional(
                                                            1, 0),
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(100,
                                                              0, 0, 20),
                                                          child: FFButtonWidget(
                                                            onPressed: () async{


                                                                },


                                                            text: '1'+notf,
                                                            options:
                                                            FFButtonOptions(
                                                              width: 45,
                                                              height: 40,
                                                              color: Color(
                                                                  0xFF711212),
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
                                                              borderRadius: 102,
                                                            ),
                                                            loading:
                                                            _loadingButton2,
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

                                                              var reqArr = await getTripRequests.getTripRequests(Globals.id, tripsArr[i]['trip']['id']);


                                                              setState(() =>
                                                              _loadingButton1 = true);
                                                              try {
                                                                await Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        TripRequestsWidget(requestsArr: reqArr, requestsArrLength: getTripRequests.arrLength),
                                                                  ),
                                                                );
                                                              } finally {
                                                                setState(() =>
                                                                _loadingButton1 =
                                                                false);
                                                              }

                                                            },


                                                            text: 'Requests'+notf,
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
                                                            _loadingButton2,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
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
                      )
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

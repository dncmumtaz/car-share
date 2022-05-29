import 'package:carshare/models/user_model.dart';
import 'package:carshare/payment_page/payment_page.dart';
import 'package:carshare/services/cancelDeleteTripFromRequests1_service.dart';
import 'package:carshare/services/getUserService.dart';
import 'package:carshare/services/get_users_trips_service.dart';
import 'package:carshare/services/joined_cancel_service.dart';
import 'package:carshare/services/joined_trip_service.dart';
import 'package:carshare/services/login_service.dart';
import 'package:carshare/services/paymentUserCanceled.dart';
import 'package:carshare/services/setNotfFalse.dart';
import 'package:carshare/user_profile_page/user_profile_page_widget.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carshare/globals.h';
import '../navbar.dart';

class ActiveTripsRequested extends StatefulWidget {
  final joinedArr;
  final joinedArrLength;

  const ActiveTripsRequested({Key key, this.joinedArr, this.joinedArrLength}) : super(key: key);

  @override
  _ActiveTripsRequestedState createState() => _ActiveTripsRequestedState(joinedArr, joinedArrLength);
}

class _ActiveTripsRequestedState extends State<ActiveTripsRequested> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var joinedArr;
  int joinedArrLength;
  

  _ActiveTripsRequestedState(var joinedArr, int joinedArrLength){
    this.joinedArr = joinedArr;
    this.joinedArrLength = joinedArrLength;
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
          NavBarPage nv = new NavBarPage(user: user);

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
                                  'Active Trips Requested',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF2596BE),
                                    fontSize: 28,
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
                      for(int i=0 ; i<joinedArrLength ; i++)

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
                                  height: 430,
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
                                                      joinedArr[i]['point'].toString()+' Points'??'Point ',
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
                                                              joinedArr[i]['time']??'time',
                                                              style:
                                                              FlutterFlowTheme
                                                                  .bodyText1,
                                                            )
                                                          ],
                                                        ),

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
                                                                  joinedArr[i]['startaddress']??'start',
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
                                                                joinedArr[i]['endaddress']??'end',
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
                                                                var jsonVar = await getUserService.getUser(joinedArr[i]['getter_id']);
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
                                                                joinedArr[i]['namesurname']??'name',
                                                                style:
                                                                FlutterFlowTheme
                                                                    .bodyText1,
                                                              ),
                                                            )
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
                                                                joinedArr[i]['situation']??'Waiting',
                                                                style: TextStyle(fontWeight: FontWeight.bold),
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
                                                        joinedArr[i]['date']??'date',
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
                                                    if(joinedArr[i]['situation'] != 'Payment Done')
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
                                                            onPressed: () async{
                                                              if(joinedArr[i]['situation'] == 'Trip Canceled'){

                                                                JoinCancelService joinCancelService = new JoinCancelService();
                                                                await joinCancelService.tripCanceled(joinedArr[i]['trip_id']);

                                                                JoinedTripService joinedTripService = new JoinedTripService();
                                                                var joinedArr2 = await joinedTripService.getJoinedTrips(Globals.id);
                                                                int joinedArrLength2 = joinedTripService.arrSize;


                                                                await Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        ActiveTripsRequested(joinedArr: joinedArr2, joinedArrLength: joinedArrLength2),
                                                                  ),
                                                                );
                                                              }
                                                              if(joinedArr[i]['situation'] == 'Rejected'){

                                                                JoinCancelService joinCancelService = new JoinCancelService();
                                                                await joinCancelService.tripCanceled(joinedArr[i]['trip_id']);

                                                                JoinedTripService joinedTripService = new JoinedTripService();
                                                                var joinedArr2 = await joinedTripService.getJoinedTrips(Globals.id);
                                                                int joinedArrLength2 = joinedTripService.arrSize;


                                                                await Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        ActiveTripsRequested(joinedArr: joinedArr2, joinedArrLength: joinedArrLength2),
                                                                  ),
                                                                );
                                                              }
                                                              if(joinedArr[i]['situation'] == 'Approved'){
                                                                PaymentUserCanceledService paymentUserCanceledService = new PaymentUserCanceledService();
                                                                paymentUserCanceledService.paymentUserCanceled(int.parse(joinedArr[i]['trip_id']), Globals.id);
                                                                JoinCancelService joinCancelService = new JoinCancelService();
                                                                await joinCancelService.tripCanceled(joinedArr[i]['trip_id']);

                                                                JoinedTripService joinedTripService = new JoinedTripService();
                                                                var joinedArr2 = await joinedTripService.getJoinedTrips(Globals.id);
                                                                int joinedArrLength2 = joinedTripService.arrSize;


                                                                await Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        ActiveTripsRequested(joinedArr: joinedArr2, joinedArrLength: joinedArrLength2),
                                                                  ),
                                                                );
                                                              }

                                                              if(joinedArr[i]['situation'] == null){
                                                                JoinCancelService joinCancelService = new JoinCancelService();
                                                                await joinCancelService.tripCanceled(joinedArr[i]['trip_id']);

                                                                JoinedTripService joinedTripService = new JoinedTripService();
                                                                var joinedArr2 = await joinedTripService.getJoinedTrips(Globals.id);
                                                                int joinedArrLength2 = joinedTripService.arrSize;


                                                                await Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        ActiveTripsRequested(joinedArr: joinedArr2, joinedArrLength: joinedArrLength2),
                                                                  ),
                                                                );
                                                                CancelDeleteTripFromRequests cancelDeleteTripFromRequests = new CancelDeleteTripFromRequests();
                                                                cancelDeleteTripFromRequests.cancelDeleteTripFromRequests(int.parse(joinedArr[i]['trip_id']), Globals.id);
                                                                SetNotfFalseService setNotfFalseService = new SetNotfFalseService();
                                                                setNotfFalseService.setNotfFalse(int.parse(joinedArr[i]['trip_id']));
                                                              }
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
                                                    if(joinedArr[i]['situation'] == 'Approved')
                                                      
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
                                                            onPressed: () async{
                                                              setState(() =>
                                                              _loadingButton1 = true);
                                                              try {
                                                                await Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        PaymentPage(tripInfo: joinedArr[i]),
                                                                  ),
                                                                );
                                                              } finally {
                                                                setState(() =>
                                                                _loadingButton1 =
                                                                false);
                                                              }

                                                            },
                                                            text: 'Payment',
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
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    )
    );
  }
}

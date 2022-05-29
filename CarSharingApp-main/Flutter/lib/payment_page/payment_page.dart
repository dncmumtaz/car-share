import 'package:carshare/active_trips_requested/active_trips_requested.dart';
import 'package:carshare/models/user_model.dart';
import 'package:carshare/services/getUserService.dart';
import 'package:carshare/services/get_user_points_service.dart';
import 'package:carshare/services/get_users_trips_service.dart';
import 'package:carshare/services/joined_trip_service.dart';
import 'package:carshare/services/login_service.dart';
import 'package:carshare/services/make_payment.dart';
import 'package:carshare/services/paymentActiveRequest_service.dart';
import 'package:carshare/services/payment_done_service.dart';
import 'package:carshare/user_profile_page/user_profile_page_widget.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carshare/globals.h';
import '../navbar.dart';

class PaymentPage extends StatefulWidget {

  final tripInfo;
  const PaymentPage({Key key, this.tripInfo}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState(tripInfo);
}

class _PaymentPageState extends State<PaymentPage> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var tripInfo;

  _PaymentPageState(var tripInfo){
    this.tripInfo = tripInfo;
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(

        /*
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
                                      'Payment',
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
                                        height: 580,
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
                                                          .fromSTEB(0, 20, 10, 40),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            '100 points will be send for payment.\nAre you sure?',
                                                            style: TextStyle(fontWeight: FontWeight.bold,
                                                            fontSize: 20),
                                                            
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
                                                                    '17:30',
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
                                                                        tripInfo['startaddress']??'start',
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
                                                                      tripInfo['endaddress']??'end',
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
                                                                      var jsonVar = await getUserService.getUser(tripInfo['getter_id']);
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
                                                                      tripInfo['namesurname']??'name',
                                                                      style:
                                                                      FlutterFlowTheme
                                                                          .bodyText1,
                                                                    ),
                                                                  )


                                                                ],
                                                              )
                                                            ],
                                                          ),

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
                                                              '06/12/2021',
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
                                                                      0, 20, 0),
                                                                  child: FFButtonWidget(
                                                                    onPressed: () async{

                                                                      MakePaymentService makePaymentService = new MakePaymentService();

                                                                      GetUserPoints getUserPoints = new GetUserPoints();
                                                                      var senderUserPoint = await getUserPoints.getUserPoints(tripInfo['sender_id']);
                                                                      var getterUserPoint = await getUserPoints.getUserPoints(tripInfo['getter_id']);

                                                                      print('sender point: '+ senderUserPoint.toString());
                                                                      print('getter point: '+ getterUserPoint.toString());
                                                                      print('trip point: '+ tripInfo['point'].toString());
                                                                      print('getter id: '+ tripInfo['getter_id'].toString());

                                                                      makePaymentService.makePayment(tripInfo['sender_id'], senderUserPoint-tripInfo['point']);
                                                                      makePaymentService.makePayment(tripInfo['getter_id'], getterUserPoint+tripInfo['point']);

                                                                      PaymentDoneService paymentDoneService = new PaymentDoneService();
                                                                      await paymentDoneService.paymentDone(int.parse(tripInfo['trip_id']), tripInfo['sender_id']);
                                                                      PaymentActiveRequestService paymentActiveRequestService = new PaymentActiveRequestService();
                                                                      await paymentActiveRequestService.paymentDone(int.parse(tripInfo['trip_id']), tripInfo['sender_id']);

                                                                      JoinedTripService joinedTripService = new JoinedTripService();
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

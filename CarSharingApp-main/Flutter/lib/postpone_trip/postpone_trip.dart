import 'package:carshare/active_trips_created/active_trips_created.dart';
import 'package:carshare/google_map_screens/google_map_screen.dart';
import 'package:carshare/models/join_a_trip_model.dart';
import 'package:carshare/related_trips/related_trips_widget.dart';
import 'package:carshare/services/get_users_trips_service.dart';
import 'package:carshare/services/related_trips_service.dart';
import 'package:carshare/services/trip_postpone_service.dart';

import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../join_a_trip_time/join_a_trip_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carshare/globals.h';
class PostponeTripWidget extends StatefulWidget {
  final tripId;

  const PostponeTripWidget({Key key, @required this.tripId}) : super(key: key);

  @override
  _PostponeTripWidgetState createState() => _PostponeTripWidgetState(tripId);
}

class _PostponeTripWidgetState extends State<PostponeTripWidget> {
  DateTimeRange calendarSelectedDay;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int tripId;
  RelatedTripService relatedTripService = new RelatedTripService();

  _PostponeTripWidgetState(int tripId)
  {
    this.tripId = tripId;
  }

  @override
  void initState() {
    super.initState();
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
                                  'Postpone the Trip',
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
                            Expanded(
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    FlutterFlowCalendar(
                                      color: FlutterFlowTheme.primaryColor,
                                      weekFormat: false,
                                      weekStartsMonday: false,
                                      onChange:

                                          (DateTimeRange newSelectedDate) {
                                        setState(() => calendarSelectedDay =
                                            newSelectedDate);
                                      },

                                      titleStyle: TextStyle(),
                                      dayOfWeekStyle: TextStyle(),
                                      dateStyle: TextStyle(),
                                      selectedDateStyle: TextStyle(),
                                      inactiveDateStyle: TextStyle(),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 40, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment:
                                              AlignmentDirectional(1, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 20, 0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    var dateAr = calendarSelectedDay.start.toString().split(' ');
                                                    print('\n\nnew date: '+dateAr[0]);
                                                    TripPostPonedService tripPostPonedService = new TripPostPonedService();
                                                    await tripPostPonedService.tripPostPoned(tripId, dateAr[0]);

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
                                                  text: 'Postpone',
                                                  options: FFButtonOptions(
                                                    width: 150,
                                                    height: 40,
                                                    color: Color(0xFF2596BE),
                                                    textStyle: FlutterFlowTheme
                                                        .subtitle2
                                                        .override(
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

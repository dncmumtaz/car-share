import 'package:carshare/blocs/application_bloc.dart';
import 'package:carshare/google_map_screens/join_go_google_map.dart';
import 'package:carshare/join_a_trip_date/join_a_trip_date_widget.dart';
import 'package:carshare/join_a_trip_start/join_a_trip_start_widget.dart';
import 'package:carshare/models/join_a_trip_model.dart';
import 'package:carshare/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:carshare/globals.h';
class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Completer<GoogleMapController> _mapController = Completer();

  JoinATripModel joinATripModel;
  StreamSubscription locationSubscription;

  _GoogleMapScreenState(){
    joinATripModel = new JoinATripModel();
    print('HHHHHeeeeye');
  }
  @override
  void initState() {
    final applicationBloc = Provider.of<ApplicatonBloc>(context, listen: false);

    locationSubscription = applicationBloc.selectedLocation.stream.listen((place) {
      if (place!=null){
        _goToPlace(place);
      }
    });
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    final applicationBloc = Provider.of<ApplicatonBloc>(context, listen: false);
    applicationBloc.dispose();
    locationSubscription.cancel();
    super.dispose();
  }

  Set<Marker> _markers = {};
  TextEditingController textController;


  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
            Marker(
                markerId: MarkerId('id-1'),
                position: LatLng(22.5448131, 88.3403691)
            ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicatonBloc>(context);

    return Scaffold(

        body: (applicationBloc.currentLocation == null)
        ? Center(child: CircularProgressIndicator(),
        )
        :ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
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
            ),

            Padding(
              padding: const EdgeInsets.all(19.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(
                        color: Color(0xFFDBE2E7),
                        width: 1,

                      ),


                    ),
                    focusedBorder:
                    OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFDBE2E7),
                        width: 1,
                      ),
                      borderRadius:
                      const BorderRadius.only(
                        topLeft:
                        Radius.circular(4.0),
                        topRight:
                        Radius.circular(4.0),
                      ),
                    ),
                    hintText: 'Where Will You Start?',
                    suffixIcon: Icon(Icons.search)
                ),
                onChanged: (value) => applicationBloc.searchPlaces(value),

              ),
            ),

            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Stack(
                children: [
                  Container(
                    height: 400.0,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(applicationBloc.currentLocation.latitude, applicationBloc.currentLocation.longitude),
                        zoom: 14
                      ),
                      onMapCreated: (GoogleMapController controller){
                        _mapController.complete(controller);
                      },
                    ),
                  ),
                  if(applicationBloc.searchResults != null &&
                      applicationBloc.searchResults.length != 0)
                    Container(
                    height: 300.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.6),
                      backgroundBlendMode: BlendMode.darken
                    ),
                  ),
                  if(applicationBloc.searchResults != null &&
                      applicationBloc.searchResults.length != 0)
                  Container(
                    height: 300.0,
                    child: ListView.builder(
                      itemCount:  applicationBloc.searchResults.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          title: Text(applicationBloc.searchResults[index].description, style: TextStyle(color: Colors.white),),

                        onTap: (){
                            applicationBloc.setSelectedLocation(
                              applicationBloc.searchResults[index].placeId
                            );

                            String startAddress = applicationBloc.searchResults[index].description;

                            var endAddressArr = startAddress.split(' ');

                            String endArranged = '';
                            for(int i=0 ; i< endAddressArr.length ; i++){

                              endArranged += endAddressArr[i];
                              endArranged+=' ';

                              if((i+1)%3 == 0){
                                endArranged+='\n';
                              }
                            }

                            Globals.JoinTripAddress = endArranged;

                            joinATripModel.setStartAddress(startAddress);
                            joinATripModel.setEndAddress('Sabiha Gökçen Uluslararası Havalimanı (SAW), Pendik/İstanbul');

                            applicationBloc.searchResults = null;

                        },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: ElevatedButton(
                onPressed: () async {
             //     print('\n\n\n\n\n**********Lat: '+joinATripModel.startpointLat.toString()+' Long: '+joinATripModel.startpointLong.toString()+' Name: '+joinATripModel.startAddress);
                  try {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            JoinATripDateWidget(joinATripModel: joinATripModel),
                      ),
                    );
                  } finally {

                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF2596BE),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),

                  ),
                ),
                child: Text(
                    "Next"
                ),
              )
            ),

          ]
        )

    );
  }

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(place.geometry.location.lat,place.geometry.location.lng), zoom: 14

          )

      )
    );
    var locLat = place.geometry.location.lat;
    var locLong = place.geometry.location.lng;


    print('locLat Start: '+locLat.toString());
    print('locLong Start: '+locLong.toString());


    await joinATripModel.setStartLat(locLat.toString());
    await joinATripModel.setStartLong(locLong.toString());
    await joinATripModel.setEndLat('40.905371');
    await joinATripModel.setEndLong('29.3168603');


  }
}

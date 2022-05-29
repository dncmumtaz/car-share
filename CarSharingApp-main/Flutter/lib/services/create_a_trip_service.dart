import 'package:carshare/models/saved_trip_model.dart';
import 'dart:convert';
import 'package:carshare/globals.h';
import 'package:carshare/models/login_model.dart';
import 'package:carshare/models/place.dart';
import 'package:carshare/models/place_search.dart';
import 'package:carshare/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CreateATripService {

  String startpointLat;
  String startpointLong;
  String startAddress;

  String endpointLat;
  String endpointLong;
  String endAddress;

  String date;

  String tripTime;

  int passenger;

  String namesurname;

  createTrip( )async{

    print('Create Objects:');
    print('sLAt'+startpointLat);
    print('sLong'+startpointLong);
    print('sAddres'+startAddress);
    print('endLat'+endpointLat);
    print('endLong'+endpointLong);
    print('endAdd'+endAddress);
    print('date'+date);
    print('triptime:'+tripTime);
    print('pass'+passenger.toString());

    var startAddressArr = startAddress.split(' ');
    String startArranged = '';
    for(int i=0 ; i< startAddressArr.length ; i++){

      startArranged += startAddressArr[i];
      startArranged+=' ';
      if((i+1)%3 == 0){
        startArranged+='\n';
      }
    }

    var endAddressArr = endAddress.split(' ');
    String endArranged = '';
    for(int i=0 ; i< endAddressArr.length ; i++){

      endArranged += endAddressArr[i];
      endArranged+=' ';

      if((i+1)%3 == 0){
        endArranged+='\n';
      }
    }
    print('\n------\narranged start : '+ startArranged);

    print('\n------\narranged end : '+ endArranged);

    var req_body = new Map();
    req_body["startaddress"] = startArranged;
    req_body["endaddress"] = endArranged;
    req_body["point"] = "100";
    req_body["user_id"] = Globals.id.toString();
    req_body["date"] = date;
    req_body["time"] = tripTime;
    req_body["startlat"] = startpointLat;
    req_body["startlong"] = startpointLong;
    req_body["endlat"] = endpointLat;
    req_body["endlong"] = endpointLong;
    req_body["namesurname"] = namesurname;

    var response = await http.post(Uri.parse("https://carshareflutter.herokuapp.com/newTrip"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(req_body));

    print("POSTED ");
    print(req_body);
    print(response.body);


  }

  setNameSurname(String namesurname){
    this.namesurname = namesurname;
  }
  setStartLat(String startpointLat){
    this.startpointLat = startpointLat;
  }
  setStartLong(String startpointLong){
    this.startpointLong = startpointLong;
  }

  setStartAddress(String startAddress){
    this.startAddress = startAddress;
  }

  setEndLat(String endpointLat){
    this.endpointLat = endpointLat;
  }
  setEndLong(String endpointLong){
    this.endpointLong = endpointLong;
  }

  setEndAddress(String endAddress){
    this.endAddress = endAddress;
  }
  setDate(String date) {
    this.date = date;
  }

  setPassenger(int passenger){
    this.passenger = passenger;
  }

  setTripTime(String tripTime){
    this.tripTime = tripTime;
  }

}
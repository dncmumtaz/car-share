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

class AddUserInATrip {

  int creator_id;
  int passenger_id;
  int trip_id;
  String passenger_name;


  addUserInATrip( )async{

    var req_body = new Map();
    req_body["creator_id"] = creator_id;
    req_body["passenger_id"] = passenger_id;
    req_body["trip_id"] = trip_id;
    req_body["passenger_name"] = passenger_name;


    var response = await http.post(Uri.parse("https://carshareflutter.herokuapp.com/addUserInTrip"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(req_body));

    print("POSTED ");
    print(req_body);
    print(response.body);

  }

  setCreator_id(int creator_id){
    this.creator_id = creator_id;
  }
  setPassenger_id(int passenger_id){
    this.passenger_id = passenger_id;
  }
  setTrip_id(int trip_id){
    this.trip_id = trip_id;
  }
  setPassenger_name(String passenger_name){
    this.passenger_name = passenger_name;
  }

}
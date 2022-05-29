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

class NewTripRequestSer {

  int sender_id;
  int getter_id;
  String namesurname;
  String location;
  int trip_id;

  newRequest() async {

    var req_body = new Map();
    req_body["sender_id"] = sender_id;
    req_body["getter_id"] = getter_id;
    req_body["namesurname"] = namesurname;
    req_body["trip_id"] = trip_id;
    req_body["location"] = location;

    var response = await http.post(Uri.parse("https://carshareflutter.herokuapp.com/tripRequest"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(req_body));


  }

  setSender_id(int sender_id){
    this.sender_id = sender_id;
  }

  setGetter_id(int getter_id){
    this.getter_id = getter_id;
  }

  setNamesurname(String namesurname){
    this.namesurname = namesurname;
  }
  setTrip_id(int trip_id){
    this.trip_id = trip_id;
  }

  setLocation(String location){
    this.location = location;
  }

}


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

class NewJoinService {

  int sender_id;
  int getter_id;
  String namesurname;
  int trip_id;
  String startaddress;
  String endaddress;
  int point;
  String date;
  String time;

  newJoin() async {

    var req_body = new Map();
    req_body["sender_id"] = sender_id;
    req_body["getter_id"] = getter_id;
    req_body["namesurname"] = namesurname;
    req_body["startaddress"] = startaddress;
    req_body["endaddress"] = endaddress;
    req_body["trip_id"] = trip_id;
    req_body["point"] = point;
    req_body["situation"] = 'waiting';
    req_body["date"] = date;
    req_body["time"] = time;

    var response = await http.post(Uri.parse("https://carshareflutter.herokuapp.com/tripsJoin"),
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

  setPoint(int point){
    this.point = point;
  }
  setStartAddress(String startaddress){
    this.startaddress = startaddress;
  }
  setEndaddress(String endaddress){
    this.endaddress =endaddress;
  }

  setDate(String date){
    this.date = date;
  }
  setTime(String time){
    this.time = time;
  }
}


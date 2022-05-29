import 'package:carshare/models/saved_trip_model.dart';
import 'dart:convert';

import 'package:carshare/models/login_model.dart';
import 'package:carshare/models/place.dart';
import 'package:carshare/models/place_search.dart';
import 'package:carshare/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SavedTripService {

  getSavedTrips(int userid)async{


    String url = "https://carshareflutter.herokuapp.com/getSavedTrips?id="+userid.toString();
    print("url : "+url);
    var response = await http.get(Uri.parse(url),
    );

    Map<String, dynamic> responseJson = json.decode(response.body);


    SavedTripModel stm = new SavedTripModel(responseJson['result'][0]['id'],responseJson['result'][0]['start'],responseJson['result'][0]['endPoint'],responseJson['result'][0]['points'],responseJson['result'][0]['user_id']);


    //print('stm: '+stm.tripStartJoin+stm.tripEndJoin+stm.points.toString());

    return stm;

  }
}
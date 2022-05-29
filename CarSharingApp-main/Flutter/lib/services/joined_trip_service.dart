import 'package:carshare/models/saved_trip_model.dart';
import 'dart:convert';

import 'package:carshare/models/login_model.dart';
import 'package:carshare/models/place.dart';
import 'package:carshare/models/place_search.dart';
import 'package:carshare/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class JoinedTripService {

  int arrSize;

  getJoinedTrips(int user_id) async {

    String url = "https://carshareflutter.herokuapp.com/getJoinedTrips?user_id="+user_id.toString();

    var response = await http.get(Uri.parse(url),
    );

    Map<String, dynamic> responseJson = json.decode(response.body);


    arrSize = responseJson['result'].length;
    var resultArr = responseJson['result'];
    print(resultArr.toString());
    print('//URL: '+url);


    return responseJson['result'];

  }

}
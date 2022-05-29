import 'package:carshare/models/saved_trip_model.dart';
import 'dart:convert';

import 'package:carshare/models/login_model.dart';
import 'package:carshare/models/place.dart';
import 'package:carshare/models/place_search.dart';
import 'package:carshare/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class GetTripRequests {

  int arrLength;

  getTripRequests(int userid, int tripId)async{

    String url = "https://carshareflutter.herokuapp.com/getTripRequestsId?userId="+userid.toString()+"&tripId="+tripId.toString();
    print("url : "+url);
    var response = await http.get(Uri.parse(url),
    );

    Map<String, dynamic> responseJson = json.decode(response.body);


    print('---requested trip service---');
    print(responseJson['result']);

    arrLength = responseJson['result'].length;
    return responseJson['result'];

  }
}
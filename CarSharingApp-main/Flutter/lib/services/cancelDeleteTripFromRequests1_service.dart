import 'package:carshare/models/saved_trip_model.dart';
import 'dart:convert';

import 'package:carshare/models/login_model.dart';
import 'package:carshare/models/place.dart';
import 'package:carshare/models/place_search.dart';
import 'package:carshare/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CancelDeleteTripFromRequests {

  cancelDeleteTripFromRequests(int tripId, int senderId)async{


    String url = "https://carshareflutter.herokuapp.com/cancelDeleteTripFromRequests?tripId="+tripId.toString()+"&senderId="+senderId.toString();

    var response = await http.delete(Uri.parse(url),
    );


    print('\n\n\nResponse:\n');
    print(url);

  }



}
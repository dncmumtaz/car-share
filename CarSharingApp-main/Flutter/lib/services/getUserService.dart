import 'package:carshare/models/saved_trip_model.dart';
import 'dart:convert';

import 'package:carshare/models/login_model.dart';
import 'package:carshare/models/place.dart';
import 'package:carshare/models/place_search.dart';
import 'package:carshare/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class GetUserService {

  int arrSize;
  getUser(int userId)async{


    String url = "https://carshareflutter.herokuapp.com/getUserInfo?userId="+userId.toString();

    var response = await http.get(Uri.parse(url),
    );

    Map<String, dynamic> responseJson = json.decode(response.body);

    print('url : '+url);
    arrSize = responseJson['result'].length;
    var resultArr = responseJson['result'];
    print('-----get trip results-----');
    print(resultArr.toString());

/*

    for( var i = 0 ; i < arrSize; i++ ) {
      print('XXX: '+resultArr[i]['namesurname']);

    }
*/
    return responseJson['result'];

  }



}
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


  getUser(String id)async{

    String url = "https://carshareflutter.herokuapp.com/getUserById?id="+id;
    print("url : "+url);
    var response = await http.get(Uri.parse(url),
    );

    Map<String, dynamic> responseJson = json.decode(response.body);
    return await parseJSON(responseJson);


  }
}

parseJSON(var responseJson)async{

  print('LOGIN SERVICE\n');
  print(responseJson);
  UserModel user = new UserModel(responseJson["id"],responseJson["address"],responseJson["email"],responseJson["firstname"],responseJson["lastname"],responseJson["mobile"], responseJson["password"], responseJson["username"], responseJson["points"]);

  print('usermodel:'+user.password);

  return user;

}
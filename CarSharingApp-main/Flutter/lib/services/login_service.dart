import 'dart:convert';
import 'package:carshare/globals.h';
import 'package:carshare/models/login_model.dart';
import 'package:carshare/models/place.dart';
import 'package:carshare/models/place_search.dart';
import 'package:carshare/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginService {


   String email;
   String password;

   setData(String email, String password){
    this.email = email;
    this.password = password;
   }
   postData()async {
     String url = "https://carshareflutter.herokuapp.com/login?username=" +
         email + "&password=" + password;
     print("url : " + url);
     var response = await http.get(Uri.parse(url),
     );


     if (response.statusCode == 200 ) {
       print(response.body);

       Map<String, dynamic> responseJson = json.decode(response.body);
       return await parseJSON(responseJson);
     }
     else {
        return null;
     }

  }
}

parseJSON(var responseJson)async{

  print('LOGIN SERVICE\n');
  print(responseJson);
  UserModel user = new UserModel(responseJson["id"],responseJson["address"],responseJson["email"],responseJson["firstname"],responseJson["lastname"],responseJson["mobile"], responseJson["password"], responseJson["username"], responseJson["points"]);

  print('usermodel:'+user.password);

  Globals.id = responseJson['id'];
  Globals.firstname = responseJson['firstname'];
  Globals.lastname = responseJson['lastname'];
  Globals.username = responseJson['username'];
  Globals.email = responseJson['email'];
  Globals.password = responseJson['password'];
  Globals.address = responseJson['address'];
  Globals.points = responseJson['points'];
  Globals.mobile = responseJson['mobile'];

  print('\n\n\n\nheeeeeeey:'+user.toString());
  return user;

}
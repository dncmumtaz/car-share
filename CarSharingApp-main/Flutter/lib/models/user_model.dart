// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';



class UserModel {

  UserModel(int id, String address, String email, String firstname, String lastname, String mobile, String password, String username, int points){
    this.id = id;
    this.address = address;
    this.email = email;
    this.firstname = firstname;
    this.lastname = lastname;
    this.mobile = mobile;
    this.password = password;
    this.username = username;
    this.points = points;

  }


  int id;
  String address;
  String email;
  String firstname;
  String lastname;
  String mobile;
  String password;
  String username;
  int points;


}

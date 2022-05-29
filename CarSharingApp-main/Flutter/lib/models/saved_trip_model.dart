// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';



class SavedTripModel {

  SavedTripModel(int id, String tripStartJoin, String tripEndJoin, int points, int userId){
    this.id = id;
    this.tripStartJoin = tripStartJoin;
    this.tripEndJoin = tripEndJoin;
    this.points = points;
    this.userId = userId;


  }

/*
    Globals.tripStartJoin = responseJson['result'][0]['start'];
    Globals.tripEndJoin = responseJson['result'][0]['endPoint'];
    Globals.points = responseJson['result'][0]['points'];


*/
  int id;
  String tripStartJoin;
  String tripEndJoin;
  int points;
  int userId;


}

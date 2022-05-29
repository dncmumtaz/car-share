// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

class TripRequestModel {

  TripRequestModel(int id, int getter_id, int sender_id, int trip_id, String namesurname){
    this.id = id;
    this.getter_id = getter_id;
    this.sender_id = sender_id;
    this.trip_id = trip_id;
    this.namesurname = namesurname;

  }

  int id;
  int getter_id;
  int sender_id;
  int trip_id;
  String namesurname;

}

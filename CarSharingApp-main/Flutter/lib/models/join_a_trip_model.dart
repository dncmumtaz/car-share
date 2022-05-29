// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';


class JoinATripModel {
  JoinATripModel(){

  }

  setStartLat(String startpointLat){
    this.startpointLat = startpointLat;
  }
  setStartLong(String startpointLong){
    this.startpointLong = startpointLong;
  }

  setStartAddress(String startAddress){
    this.startAddress = startAddress;
  }

  setEndLat(String endpointLat){
    this.endpointLat = endpointLat;
  }
  setEndLong(String endpointLong){
    this.endpointLong = endpointLong;
  }

  setEndAddress(String endAddress){
    this.endAddress = endAddress;
  }
  setDate(String date) {
    this.date = date;
  }


  String startpointLat;
  String startpointLong;
  String startAddress;

  String endpointLat;
  String endpointLong;
  String endAddress;

  String date;


}

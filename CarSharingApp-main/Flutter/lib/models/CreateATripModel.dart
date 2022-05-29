// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:carshare/services/getUserService.dart';

class CreateATripModel {
  CreateATripModel(){

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

  setPassenger(int passenger){
    this.passenger = passenger;
  }

  setTripTime(String tripTime){
    this.tripTime = tripTime;
  }

  setTripUserId(String tripUserId){
    this.tripUserId = tripUserId;
  }
/*
  setUserInfos(){

    GetUserService getUserService = new GetUserService();
    var object =  getUserService.getUser(tripUserId);
    this.namesurname = object['firstname'].toString()+' '+object['lastname'].toString();

  }
  */

  setNameSurname(String namesurname){
    this.namesurname = namesurname;
  }

  setTripId(int tripId){
    this.tripId = tripId;
  }

  String tripUserId;
  String startpointLat;
  String startpointLong;
  String startAddress;

  String endpointLat;
  String endpointLong;
  String endAddress;

  String date;

  String tripTime;

  int passenger;

  int tripId;

  String namesurname;

}

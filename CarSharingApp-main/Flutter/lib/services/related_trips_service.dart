import 'package:carshare/models/saved_trip_model.dart';
import 'dart:convert';

import 'package:carshare/models/login_model.dart';
import 'package:carshare/models/place.dart';
import 'package:carshare/models/place_search.dart';
import 'package:carshare/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:math' show cos, sqrt, asin;
import 'package:vector_math/vector_math.dart';
class RelatedTripService {

  int arrSize;
  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }
  getRelatedTrips(String date, String lat1, String long1, String lat2, String long2)async{


    String url = "https://carshareflutter.herokuapp.com/getRelatedTrips?startlat=&startlong=&date="+date+"&endlat&endlong";

    var response = await http.get(Uri.parse(url),
    );

    Map<String, dynamic> responseJson = json.decode(response.body);


    arrSize = responseJson['result'].length;

    var resultArr = responseJson['result'];


    if(lat2 == '40.905371' && long2 == '29.3168603') { // to the sabiha
      print('\n\nhere to sabiha\n\n');

      for (var i = 0; i < arrSize; i++) {
        print(resultArr[i]['endlat']);
        print(resultArr[i]['endlong']);
        if(resultArr[i]['endlat']!='40.905371' || resultArr[i]['endlong']!='29.3168603'){
          resultArr.removeAt(i);
          arrSize = arrSize-1;
        //  print('here: '+resultArr[i]['endaddress']);
        }
        if(i==arrSize)
          break;
        if(calculateDistance(double.parse(lat1), double.parse(long1), double.parse(resultArr[i]['startlat']), double.parse(resultArr[i]['startlong']))<30){
        //  print('XXX: ' + resultArr[i]['startaddress']);
        }
        else {
          resultArr.removeAt(i);
          arrSize = arrSize-1;
        }

      }
    }
    else { // from sabiha
      print('\n\nhere from sabiha\n\n');


      for (var i = 0; i < arrSize; i++) {


        if(resultArr[i]['startlat']!='40.905371' || resultArr[i]['startlong']!='29.3168603'){
          print(resultArr[i]['startlat']);
          print(resultArr[i]['startlong']);
          resultArr.removeAt(i);

          arrSize = arrSize-1;
          i--;
        }
        if(i==arrSize)
          break;


        if(calculateDistance(double.parse(lat2), double.parse(long2), double.parse(resultArr[i]['endlat']), double.parse(resultArr[i]['endlong']))<30){
          //print('XXX: ' + resultArr[i]['endaddress']);
        }
        else {
          resultArr.removeAt(i);
          arrSize = arrSize-1;
        }


      }

    }
    return resultArr;

  }



}
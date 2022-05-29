import 'package:carshare/models/place.dart';
import 'package:carshare/models/place_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService {

  final key = 'AIzaSyDkeN50W6_2mmnYmD4fdH6LT1ggymZSoEo';

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=establishment&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  Future<Place> getPlace(String placeId) async {
    var url = 'https://maps.googleapis.com/maps/api/place/details/json?key=$key&place_id=$placeId';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String, dynamic>;
    return Place.fromJson(jsonResult);
  }
}
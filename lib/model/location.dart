import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:flutter_application_1/endpoint.dart';
import 'location_fact.dart';
import '../endpoint.dart';
import 'package:json_annotation/json_annotation.dart';
part 'location.g.dart';
@JsonSerializable()
class Location{
  final String name;
  final String url;
  final int id;
  final String user_itinerary_summary;
  final String tour_package_name;
  final List <LocationFact>? facts;
  Location( { required this.user_itinerary_summary,
  required this.tour_package_name,
     required this.id,
     required this.name,
     required this.url,
     required this.facts} );

     Location.blank(): id=0,
     name="",
     url="",
     user_itinerary_summary="",
     tour_package_name="",
     facts=[];
  factory Location.fromJson(Map<String,dynamic>json)=>_$LocationFromJson(json);

   static Future<List<Location>> fetchAll() async {
    var uri = Endpoint.uri('/locations', queryParameters: {});
     final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    List<Location> list = <Location>[];
    for (var jsonItem in json.decode(resp.body)) {
      list.add(Location.fromJson(jsonItem));
    }
    return list;
  }
   static Future<Location> fetchByID(int id) async {
    var uri = Endpoint.uri('/locations/$id', queryParameters: {});

    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    final Map<String, dynamic> itemMap = json.decode(resp.body);
    return Location.fromJson(itemMap);
  }
}

 
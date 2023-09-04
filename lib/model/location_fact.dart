import 'package:json_annotation/json_annotation.dart';
part 'location_fact.g.dart';
@JsonSerializable()
class LocationFact {
  final dynamic title;
  final dynamic text;
  LocationFact({required this.title, required this.text});
  factory LocationFact.fromJson(Map<String,dynamic>json)=>_$LocationFactFromJson(json);
}

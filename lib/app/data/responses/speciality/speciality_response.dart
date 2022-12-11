import 'package:freezed_annotation/freezed_annotation.dart';
part 'speciality_response.g.dart';

@JsonSerializable()
class SpecialityResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;

  SpecialityResponse(this.id, this.name);

  /// fromJson named constructor to convert json to SpecialityResponse object
  /// by giving [json] which is a map object as a parameter
  factory SpecialityResponse.fromJson(Map<String, dynamic> json) => _$SpecialityResponseFromJson(json);

  /// toJson named constructor to convert SpecialityResponse object to json "map object"
  Map<String, dynamic> toJson() => _$SpecialityResponseToJson(this);

}
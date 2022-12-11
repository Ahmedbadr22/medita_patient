import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medita_patient/app/data/responses/speciality/speciality_response.dart';

part 'hospital_response.g.dart';

@JsonSerializable()
class HospitalResponse {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? imageUrl;
  @JsonKey(name: "location")
  String? location;
  @JsonKey(name: "specialities")
  List<SpecialityResponse>? specialities;
  @JsonKey(name: "rates")
  List<int>? rates;

  HospitalResponse(this.name, this.imageUrl, this.location, this.specialities, this.rates);

  /// fromJson named constructor to convert json to HospitalResponse object
  /// by giving [json] which is a map object as a parameter
  factory HospitalResponse.fromJson(Map<String, dynamic> json) => _$HospitalResponseFromJson(json);

  /// toJson named constructor to convert HospitalResponse   object to json "map object"
  Map<String, dynamic> toJson() => _$HospitalResponseToJson(this);

}
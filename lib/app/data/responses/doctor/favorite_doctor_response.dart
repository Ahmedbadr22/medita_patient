
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medita_patient/app/data/responses/doctor/doctor_response.dart';

part 'favorite_doctor_response.g.dart';


@JsonSerializable()
class FavoriteDoctorResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "doctor")
  DoctorResponse? doctorResponse;

  FavoriteDoctorResponse(this.id, this.doctorResponse);

  /// fromJson named constructor to convert json to FavoriteDoctorResponse object
  /// by giving [json] which is a map object as a parameter
  factory FavoriteDoctorResponse.fromJson(Map<String, dynamic> json) => _$FavoriteDoctorResponseFromJson(json);

  /// toJson named constructor to convert FavoriteDoctorResponse object to json "map object"
  Map<String, dynamic> toJson() => _$FavoriteDoctorResponseToJson(this);
}
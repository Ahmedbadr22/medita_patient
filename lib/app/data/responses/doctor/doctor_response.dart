import 'package:freezed_annotation/freezed_annotation.dart';

import '../hospitals/hospital_response/hospital_response.dart';
import '../speciality/speciality_response.dart';
import '../user/user_response.dart';

part 'doctor_response.g.dart';

@JsonSerializable()
class DoctorResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user")
  UserResponse? userResponse;
  @JsonKey(name: "speciality")
  SpecialityResponse? specialityResponse;
  @JsonKey(name: "work_on_hospital")
  HospitalResponse? hospitalResponse;
  @JsonKey(name: "about")
  String? about;
  @JsonKey(name: "years_of_exp")
  int? yearsOfExp;


  DoctorResponse(this.id, this.userResponse, this.specialityResponse, this.hospitalResponse, this.about, this.yearsOfExp);

  /// fromJson named constructor to convert json to DoctorResponse object
  /// by giving [json] which is a map object as a parameter
  factory DoctorResponse.fromJson(Map<String, dynamic> json) => _$DoctorResponseFromJson(json);

  /// toJson named constructor to convert DoctorResponse   object to json "map object"
  Map<String, dynamic> toJson() => _$DoctorResponseToJson(this);
}
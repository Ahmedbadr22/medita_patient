// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorResponse _$DoctorResponseFromJson(Map<String, dynamic> json) =>
    DoctorResponse(
      json['id'] as int?,
      json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      json['speciality'] == null
          ? null
          : SpecialityResponse.fromJson(
              json['speciality'] as Map<String, dynamic>),
      json['work_on_hospital'] == null
          ? null
          : HospitalResponse.fromJson(
              json['work_on_hospital'] as Map<String, dynamic>),
      json['about'] as String?,
      json['years_of_exp'] as int?,
    );

Map<String, dynamic> _$DoctorResponseToJson(DoctorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.userResponse,
      'speciality': instance.specialityResponse,
      'work_on_hospital': instance.hospitalResponse,
      'about': instance.about,
      'years_of_exp': instance.yearsOfExp,
    };

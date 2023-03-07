// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_doctor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteDoctorResponse _$FavoriteDoctorResponseFromJson(
        Map<String, dynamic> json) =>
    FavoriteDoctorResponse(
      json['id'] as int?,
      json['doctor'] == null
          ? null
          : DoctorResponse.fromJson(json['doctor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteDoctorResponseToJson(
        FavoriteDoctorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor': instance.doctorResponse,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speciality_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialityResponse _$SpecialityResponseFromJson(Map<String, dynamic> json) =>
    SpecialityResponse(
      json['id'] as int?,
      json['name'] as String?,
    )..iconPath = json['icon'] as String?;

Map<String, dynamic> _$SpecialityResponseToJson(SpecialityResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.iconPath,
    };

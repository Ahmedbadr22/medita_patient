// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalResponse _$HospitalResponseFromJson(Map<String, dynamic> json) =>
    HospitalResponse(
      json['name'] as String?,
      json['image'] as String?,
      json['location'] as String?,
      (json['specialities'] as List<dynamic>?)
          ?.map((e) => SpecialityResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['rates'] as List<dynamic>?)?.map((e) => e as int).toList(),
      (json['latitude'] as num?)?.toDouble(),
      (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HospitalResponseToJson(HospitalResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.imageUrl,
      'location': instance.location,
      'specialities': instance.specialities,
      'rates': instance.rates,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

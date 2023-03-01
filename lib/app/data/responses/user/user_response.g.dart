// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['id'] as int?,
      json['profile_image'] as String?,
      json['email'] as String?,
      json['fullname'] as String?,
      json['birth_date'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile_image': instance.profileImagePath,
      'email': instance.email,
      'fullname': instance.fullName,
      'birth_date': instance.birthDate,
    };

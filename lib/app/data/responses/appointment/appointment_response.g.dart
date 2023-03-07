// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentResponse _$AppointmentResponseFromJson(Map<String, dynamic> json) =>
    AppointmentResponse(
      json['id'] as int?,
      json['doctor'] == null
          ? null
          : DoctorResponse.fromJson(json['doctor'] as Map<String, dynamic>),
      json['date'] as String?,
      json['time'] as String?,
      json['problem_detail'] as String?,
      json['booking_request_date'] as String?,
      json['is_canceled'] as bool?,
    );

Map<String, dynamic> _$AppointmentResponseToJson(
        AppointmentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor': instance.doctorResponse,
      'date': instance.date,
      'time': instance.time,
      'problem_detail': instance.problemDetail,
      'booking_request_date': instance.bookingRequestDate,
      'is_canceled': instance.isCanceled,
    };

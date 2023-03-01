import 'package:freezed_annotation/freezed_annotation.dart';

import '../doctor/doctor_response.dart';

part 'appointment_response.g.dart';

@JsonSerializable()
class AppointmentResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "doctor")
  DoctorResponse? doctorResponse;
  @JsonKey(name: "date")
  String? date;
  @JsonKey(name: "time")
  String? time;
  @JsonKey(name: "problem_detail")
  String? problemDetail;
  @JsonKey(name: "booking_request_date")
  String? bookingRequestDate;
  @JsonKey(name: "is_canceled")
  bool? isCanceled;



  AppointmentResponse(this.id, this.doctorResponse, this.date, this.time, this.problemDetail, this.bookingRequestDate, this.isCanceled);

  /// fromJson named constructor to convert json to ArticleResponse object
  /// by giving [json] which is a map object as a parameter
  factory AppointmentResponse.fromJson(Map<String, dynamic> json) => _$AppointmentResponseFromJson(json);

  /// toJson named constructor to convert ArticleResponse   object to json "map object"
  Map<String, dynamic> toJson() => _$AppointmentResponseToJson(this);
}

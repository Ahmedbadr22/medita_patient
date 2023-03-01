
import 'package:dio/dio.dart';
import 'package:medita_patient/app/data/responses/appointment/appointment_response.dart';
import 'package:retrofit/http.dart';

import '../../../../app/constants.dart';

part 'appointment_client_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppointmentClientApi {
  factory AppointmentClientApi(Dio dio, {String baseUrl}) = _AppointmentClientApi;


  @GET(ApiConstants.listUserAppointments)
  Future<List<AppointmentResponse>> listUserAppointments(@Path() int id);
}


import 'package:dio/dio.dart';
import 'package:medita_patient/app/data/responses/doctor/doctor_response.dart';
import 'package:medita_patient/app/data/responses/doctor/favorite_doctor_response.dart';
import 'package:retrofit/http.dart';

import '../../../../app/constants.dart';

part 'doctor_client_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class DoctorClientApi {
  factory DoctorClientApi(Dio dio, {String baseUrl}) = _DoctorClientApi;

  @GET(ApiConstants.listDoctorsBySpecialityId)
  Future<List<DoctorResponse>> listDoctorsBySpecialityId(@Path() int id);
  
  @GET(ApiConstants.listUserFavoriteDoctors)
  Future<List<FavoriteDoctorResponse>> listUserFavoriteDoctors(@Header("Authorization") String access);
}
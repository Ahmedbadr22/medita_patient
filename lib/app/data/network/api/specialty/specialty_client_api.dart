

import 'package:dio/dio.dart';
import 'package:medita_patient/app/data/responses/speciality/speciality_response.dart';
import 'package:retrofit/http.dart';

import '../../../../app/constants.dart';

part 'specialty_client_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SpecialtyClientApi {
  factory SpecialtyClientApi(Dio dio, {String baseUrl}) = _SpecialtyClientApi;

  @GET(ApiConstants.listSpecialties)
  Future<List<SpecialityResponse>> listSpecialities();
}
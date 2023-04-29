import 'package:medita_patient/app/app/constants.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../../../responses/registration/registration_response.dart';

part 'registration_api_service_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RegistrationApiServiceClient {
  factory RegistrationApiServiceClient(Dio dio, {String baseUrl}) = _RegistrationApiServiceClient;

  @POST(ApiConstants.userRegistrationUrl)
  Future<RegistrationResponse> register(
      @Field("fullname") String fullname,
      @Field("email") String email,
      @Field("password") String password,
  );
}
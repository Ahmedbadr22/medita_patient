import 'package:medita_patient/app/app/constants.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../../../responses/login/login_response.dart';
part 'login_api_service_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class LoginApiServiceClient {
  factory LoginApiServiceClient(Dio dio, {String baseUrl}) = _LoginApiServiceClient;

  @POST(ApiConstants.loginUrl)
  Future<LoginResponse> login(@Field("email") String email, @Field("password") String password);
}

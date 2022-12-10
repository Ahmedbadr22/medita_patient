import 'package:medita_patient/app/app/constants.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../../responses/login_response.dart';


part 'api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(ApiConstants.loginUrl)
  Future<LoginResponse> login(@Field("email") String email, @Field("password") String password);
}

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../../app/constants.dart';
import '../../../../responses/hospitals/hospital_response/hospital_response.dart';

part 'list_near_hospitals_api_service_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HospitalApiServiceClient {
  factory HospitalApiServiceClient(Dio dio, {String baseUrl}) = _HospitalApiServiceClient;

  @GET(ApiConstants.listHospitals)
  Future<List<HospitalResponse>> listNearHospitals();
}
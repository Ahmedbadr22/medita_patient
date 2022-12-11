import 'package:medita_patient/app/data/network/api/near_hospitals/list_near_hospitals/list_near_hospitals_api_service_client.dart';

import '../../../responses/hospitals/hospital_response/hospital_response.dart';

class HospitalDataSource {
  late final HospitalApiServiceClient _apiServiceClient;

  HospitalDataSource(this._apiServiceClient);

  /// call the listNearHospitals api
  /// and return [List] of [HospitalResponse]
  Future<List<HospitalResponse>> listNearHospitals() async {
    return await _apiServiceClient.listNearHospitals();
  }
}
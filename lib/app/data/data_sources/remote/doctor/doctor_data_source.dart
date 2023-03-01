

import 'package:medita_patient/app/data/network/api/doctor/doctor_client_api.dart';
import 'package:medita_patient/app/data/responses/doctor/doctor_response.dart';

class DoctorDataSource {
  final DoctorClientApi _doctorClientApi;

  DoctorDataSource(this._doctorClientApi);

  Future<List<DoctorResponse>> listDoctorsBySpecialityId(int id) {
    return _doctorClientApi.listDoctorsBySpecialityId(id);
  }
}


import 'package:medita_patient/app/data/network/api/doctor/doctor_client_api.dart';
import 'package:medita_patient/app/data/responses/doctor/doctor_response.dart';
import 'package:medita_patient/app/data/responses/doctor/favorite_doctor_response.dart';

class DoctorDataSource {
  final DoctorClientApi _doctorClientApi;

  DoctorDataSource(this._doctorClientApi);

  Future<List<DoctorResponse>> listDoctorsBySpecialityId(int id) {
    return _doctorClientApi.listDoctorsBySpecialityId(id);
  }


  Future<List<FavoriteDoctorResponse>> listUserFavoriteDoctors(String accessToken) {
    return _doctorClientApi.listUserFavoriteDoctors(accessToken);
  }
}
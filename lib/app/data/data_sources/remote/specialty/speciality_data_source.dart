



import 'package:medita_patient/app/data/network/api/specialty/specialty_client_api.dart';
import 'package:medita_patient/app/data/responses/speciality/speciality_response.dart';

class SpecialtyDataSource {
  late final SpecialtyClientApi specialtyClientApi;

  SpecialtyDataSource(this.specialtyClientApi);
  
  Future<List<SpecialityResponse>> listSpecialties() {
    return specialtyClientApi.listSpecialities();
  }
}
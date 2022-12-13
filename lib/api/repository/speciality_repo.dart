import 'package:dio/dio.dart';
import 'package:medita_patient/api/models/speciality_model.dart';

class SpecialityRepo {
  Future<List<SpecialityModel>> getSpecialityData() async {
    final response = await Dio().get(
        'https://6081-154-239-215-52.eu.ngrok.io/clinic/list-specialities');
    final List<SpecialityModel> listOfSpeciality =
        List<SpecialityModel>.from(response.data.map((element) {
      return SpecialityModel(
        id: element['id'],
        name: element['name'],
      );
    }));
    return listOfSpeciality;
  }
}

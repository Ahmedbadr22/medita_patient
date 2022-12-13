import 'package:dio/dio.dart';
import 'package:medita_patient/api/models/hospital_model.dart';

class HospitalRepoModel {
  Future<List<HospitalDataModel>> getHospitalsData() async {
    final response = await Dio()
        .get('https://6081-154-239-215-52.eu.ngrok.io/clinic/list-hospitals');

    final List<HospitalDataModel> listOfHospitals =
        List<HospitalDataModel>.from(response.data.map((element) {
      return HospitalDataModel(
          name: element['name'],
          image: element['image'],
          location: element['location'],
          rates: element['rates'],
          specialities: element['specialities']);
    }));
    return listOfHospitals;
  }
}

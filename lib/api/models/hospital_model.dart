import 'package:medita_patient/api/models/speciality_model.dart';

class HospitalDataModel {
  final String name;
  final String location;
  final List rates;
  final String image;
  final List specialities;

  HospitalDataModel(
      {required this.name,
      required this.image,
      required this.location,
      required this.rates,
      required this.specialities});
}

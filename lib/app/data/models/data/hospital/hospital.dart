import 'package:medita_patient/app/data/models/data/speciality/speciality.dart';

class Hospital {
  String name;
  String imageUrl;
  String location;
  List<Speciality> specialities;
  List<int> rates;
  double latitude;
  double longitude;

  Hospital(this.name, this.imageUrl, this.location, this.specialities, this.rates, this.latitude, this.longitude);

  String getStringSpecialities() {
    return specialities.map((speciality) => speciality.name).toString();
  }
}
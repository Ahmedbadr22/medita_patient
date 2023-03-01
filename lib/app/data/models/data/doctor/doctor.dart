import 'package:medita_patient/app/data/models/data/hospital/hospital.dart';
import 'package:medita_patient/app/data/models/data/speciality/speciality.dart';

import '../user/user.dart';

class Doctor {
  int id;
  User user;
  Speciality speciality;
  Hospital hospital;
  String about;
  int yearsOfExp;

  Doctor(this.id, this.user, this.speciality, this.hospital, this.about, this.yearsOfExp);
}
import 'package:medita_patient/app/data/models/data/hospital/hospital.dart';
import 'package:medita_patient/app/data/models/data/speciality/speciality.dart';

import '../user/user.dart';

class Doctor {
  final int id;
  final User user;
  final Speciality speciality;
  final Hospital hospital;
  final String about;
  final int yearsOfExp;

  Doctor(this.id, this.user, this.speciality, this.hospital, this.about,
      this.yearsOfExp);
}

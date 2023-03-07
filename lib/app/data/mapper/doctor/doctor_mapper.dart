


import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/mapper/hospital/hospital.dart';
import 'package:medita_patient/app/data/mapper/speciality/speciality_mapper.dart';
import 'package:medita_patient/app/data/mapper/user/user_mapper.dart';
import 'package:medita_patient/app/data/models/data/doctor/doctor.dart';
import 'package:medita_patient/app/data/models/data/hospital/hospital.dart';
import 'package:medita_patient/app/data/models/data/speciality/speciality.dart';
import 'package:medita_patient/app/data/models/data/user/user.dart';

import '../../responses/doctor/doctor_response.dart';

extension DoctorResponseMapper on DoctorResponse {
  Doctor toDomain() {
    User user = userResponse.toDomain();
    Hospital hospital = hospitalResponse.toDomain();
    Speciality speciality = specialityResponse.toDomain();

    return Doctor(id.orZero(), user, speciality, hospital, about.orEmpty(), yearsOfExp.orZero());
  }
}

extension NullableDoctorResponseMapper on DoctorResponse? {
  Doctor toDomain() {
    User user = this!.userResponse.toDomain();
    Hospital hospital = this!.hospitalResponse.toDomain();
    Speciality speciality = this!.specialityResponse.toDomain();

    return Doctor(this!.id.orZero(), user, speciality, hospital, this!.about.orEmpty(), this!.yearsOfExp.orZero());
  }
}
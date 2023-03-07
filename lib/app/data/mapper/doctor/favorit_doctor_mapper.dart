


import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/mapper/doctor/doctor_mapper.dart';
import 'package:medita_patient/app/data/models/data/doctor/doctor.dart';
import 'package:medita_patient/app/data/models/data/doctor/favorite_doctor.dart';
import 'package:medita_patient/app/data/responses/doctor/favorite_doctor_response.dart';

import '../../responses/doctor/doctor_response.dart';

extension FavoriteDoctorsResponseMapper on FavoriteDoctorResponse {
  FavoriteDoctor toDomain() {
    Doctor doctor = doctorResponse.toDomain();
    return FavoriteDoctor(id.orZero(), doctor);
  }
}
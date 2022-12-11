import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/mapper/speciality/speciality_mapper.dart';
import 'package:medita_patient/app/data/models/data/hospital/hospital.dart';
import 'package:medita_patient/app/data/responses/hospitals/hospital_response/hospital_response.dart';

extension HospitalResponseMapper on HospitalResponse {
  /// this function map the [HospitalResponse] object
  /// to be [Hospital] object
  Hospital toDomain() {
    var convertedSpecialities = specialities?.map((speciality) => speciality.toDomain()).toList();
    return Hospital(name.orEmpty(), imageUrl.orEmpty(), location.orEmpty(), convertedSpecialities ?? [], rates.orEmpty());
  }
}
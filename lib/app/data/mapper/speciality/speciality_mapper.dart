import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/models/data/speciality/speciality.dart';
import '../../responses/speciality/speciality_response.dart';

extension SpecialityResponseMapper on SpecialityResponse {
  /// this function map the [SpecialityResponse] object
  /// to be [Speciality] object
  Speciality toDomain() {
    return Speciality(id.orZero(), name.orEmpty(), iconPath.orEmpty());
  }
}

extension NullSpecialityResponseMapper on SpecialityResponse? {
  /// this function map the [SpecialityResponse] object
  /// to be [Speciality] object
  Speciality toDomain() {
    if (this == null) return Speciality(0, "", "");

    return Speciality(this!.id.orZero(), this!.name.orEmpty(), this!.iconPath.orEmpty());
  }
}
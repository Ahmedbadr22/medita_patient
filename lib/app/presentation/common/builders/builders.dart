import '../../../data/models/data/speciality/speciality.dart';
import '../../widgets/speciality_button/speciality_button.dart';

specialtyItemBuilder(int index, List<Speciality> data) {
  Speciality speciality = data[index];
  return SpecialityButton(speciality: speciality);
}
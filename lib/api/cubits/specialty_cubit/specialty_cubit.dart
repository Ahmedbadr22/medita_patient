import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/api/cubits/specialty_cubit/specialty_state.dart';
import 'package:medita_patient/api/models/speciality_model.dart';
import 'package:medita_patient/api/repository/speciality_repo.dart';

class SpecialtyCubit extends Cubit<SpecialtyState> {
  SpecialtyCubit() : super(SpecialtyInitial());

  void getSpecialty() async {
    try {
      emit(SpecialtyLoading());
      final List<SpecialityModel> listOfCards =
          await SpecialityRepo().getSpecialityData();
      emit(SpecialtySuccess(listOfCards));
    } on Exception catch (error) {
      emit(SpecialtyFailure(error));
    }
  }
}

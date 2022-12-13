import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/api/cubits/hospital_cubit/hospital_state.dart';
import 'package:medita_patient/api/models/hospital_model.dart';
import 'package:medita_patient/api/repository/hospital_repo_model.dart';

class HospitalDataCubit extends Cubit<HospitalDataState> {
  HospitalDataCubit() : super(HospitalInitial());

  void getHospitalData() async {
    try {
      emit(HospitalLoading());
      final List<HospitalDataModel> listOfHospitals =
          await HospitalRepoModel().getHospitalsData();
      emit(HospitalSuccess(listOfHospitals));
    } on Exception catch (error) {
      emit(HospitalFailure(error));
    }
  }
}

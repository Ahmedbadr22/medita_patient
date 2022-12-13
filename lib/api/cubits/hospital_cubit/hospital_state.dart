import 'package:medita_patient/api/models/hospital_model.dart';

abstract class HospitalDataState {}

class HospitalSuccess extends HospitalDataState {
  final List<HospitalDataModel>? listOfHospitals;
  HospitalSuccess(this.listOfHospitals);
}

class HospitalInitial extends HospitalDataState {}

class HospitalLoading extends HospitalDataState {}

class HospitalFailure extends HospitalDataState {
  final Exception? error;
  HospitalFailure(this.error);
}

class HospitalNotFound extends HospitalDataState {}

class HospitalNotInternetConnection extends HospitalDataState {}

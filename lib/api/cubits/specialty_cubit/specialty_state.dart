import 'package:medita_patient/api/models/speciality_model.dart';

abstract class SpecialtyState {}

class SpecialtySuccess extends SpecialtyState {
  final List<SpecialityModel>? listOfSpeciality;
  SpecialtySuccess(this.listOfSpeciality);
}

class SpecialtyInitial extends SpecialtyState {}

class SpecialtyLoading extends SpecialtyState {}

class SpecialtyFailure extends SpecialtyState {
  final Exception? error;
  SpecialtyFailure(this.error);
}

class SpecialtyNotFound extends SpecialtyState {}

class SpecialtyNotInternetConnection extends SpecialtyState {}

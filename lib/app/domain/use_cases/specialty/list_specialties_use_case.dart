

import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';
import 'package:medita_patient/app/data/models/data/speciality/speciality.dart';
import 'package:medita_patient/app/data/repositories/specialty/specialty_repository.dart';

class ListSpecialtiesUseCase {
  late final SpecialtyRepository _repository;

  ListSpecialtiesUseCase(this._repository);

  Future<Either<Failure,List<Speciality>>> execute() async  {
    return await _repository.listSpecialties();
  }
}
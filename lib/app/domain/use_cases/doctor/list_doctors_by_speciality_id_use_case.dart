

import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/models/data/doctor/doctor.dart';
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';
import 'package:medita_patient/app/data/repositories/doctor/doctor_repository.dart';
import 'package:medita_patient/app/domain/use_cases/base/base_use_case.dart';

class ListDoctorsBySpecialityIdUseCase extends BaseUseCase<int, List<Doctor>> {
  final DoctorRepository _doctorRepository;

  ListDoctorsBySpecialityIdUseCase(this._doctorRepository);

  @override
  Future<Either<Failure, List<Doctor>>> execute(int input) {
    return _doctorRepository.listDoctorsBySpecialityId(input);
  }

}
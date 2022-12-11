import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';
import 'package:medita_patient/app/data/models/data/hospital/hospital.dart';

import '../../../data/repositories/hospital/hospital_repository.dart';

class ListNearHospitalsUseCase  {
  final HospitalRepository _hospitalRepository;

  ListNearHospitalsUseCase(this._hospitalRepository);

  /// This function execute list near hospitals api call
  /// return [Either] object
  /// [List] of [Hospital] if success call
  /// [Failure] if fail call
  Future<Either<Failure, List<Hospital>>> execute() async {
    return await _hospitalRepository.listNearHospitals();
  }
}
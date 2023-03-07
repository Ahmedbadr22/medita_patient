

import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/repositories/doctor/doctor_repository.dart';
import 'package:medita_patient/app/domain/use_cases/token/get_local_token_use_case.dart';

import '../../../data/models/data/doctor/favorite_doctor.dart';
import '../../../data/models/data/failure/auth/auth_failure.dart';
import '../../../data/models/data/token.dart';

class ListUserFavoriteDoctorsUseCase {
  late final DoctorRepository _doctorRepository;
  late final GetLocalTokenUseCase _getLocalTokenUseCase;

  ListUserFavoriteDoctorsUseCase(this._doctorRepository, this._getLocalTokenUseCase);

  Future<Either<Failure, List<FavoriteDoctor>>> execute() async  {
    Token? token = _getLocalTokenUseCase.execute();
    if(token != null) {
      String access = token.getBearerToken();
      return await _doctorRepository.listUserFavoriteDoctors(access);
    } else {
      return Left(Failure(401, "UnAuthorized"));
    }
  }

}
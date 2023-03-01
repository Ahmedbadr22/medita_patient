

import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/data_sources/remote/specialty/speciality_data_source.dart';
import 'package:medita_patient/app/data/mapper/speciality/speciality_mapper.dart';
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';
import 'package:medita_patient/app/data/models/data/speciality/speciality.dart';
import 'package:medita_patient/app/data/network/network_info.dart';
import 'package:medita_patient/app/data/responses/speciality/speciality_response.dart';

import '../../handler/exception_handler/login/login_exception_handler.dart';
import '../../network/status_code/status_code.dart';

class SpecialtyRepository {
  late final SpecialtyDataSource _specialtyDataSource;
  late final NetworkInfo _networkInfo;

  SpecialtyRepository(this._specialtyDataSource, this._networkInfo);


  Future<Either<Failure, List<Speciality>>> listSpecialties() async {
    if(!await _networkInfo.isConnected()) {
      Failure noInternetConnectionFailure = StatusCode.noInternetConnection.getAuthenticationFailure();
      return Left(noInternetConnectionFailure);
    }

    try {
      List<SpecialityResponse> specialtiesResponse = await _specialtyDataSource.listSpecialties();
      List<Speciality> specialties = specialtiesResponse.map((specialty) => specialty.toDomain()).toList();
      return Right(specialties);
    } catch(error) {
      BaseExceptionHandler baseExceptionHandler = BaseExceptionHandler();
      baseExceptionHandler.handler(error);
      return Left(baseExceptionHandler.failure);
    }


  }
}
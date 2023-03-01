import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:medita_patient/app/data/data_sources/remote/doctor/doctor_data_source.dart';
import 'package:medita_patient/app/data/mapper/doctor/doctor_mapper.dart';
import 'package:medita_patient/app/data/network/network_info.dart';
import 'package:medita_patient/app/data/responses/doctor/doctor_response.dart';

import '../../handler/exception_handler/login/login_exception_handler.dart';
import '../../models/data/doctor/doctor.dart';
import '../../models/data/failure/auth/auth_failure.dart';
import '../../network/status_code/status_code.dart';

class DoctorRepository {
  final DoctorDataSource _doctorDataSource;
  final NetworkInfo _networkInfo;

  DoctorRepository(this._doctorDataSource, this._networkInfo);

  Future<Either<Failure, List<Doctor>>> listDoctorsBySpecialityId(int id) async {
    if(!await _networkInfo.isConnected()) {
      Failure noInternetConnectionFailure = StatusCode.noInternetConnection.getAuthenticationFailure();
      return Left(noInternetConnectionFailure);
    }

    try {
      List<DoctorResponse> doctorsResponse = await _doctorDataSource.listDoctorsBySpecialityId(id);
      List<Doctor> doctors = doctorsResponse.map((doctor) => doctor.toDomain()).toList();
      return Right(doctors);
    } catch(error) {
      if (kDebugMode) {
        print("Repo Error ${error.toString()}");
      }
      BaseExceptionHandler baseExceptionHandler = BaseExceptionHandler();
      baseExceptionHandler.handler(error);
      return Left(baseExceptionHandler.failure);
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:medita_patient/app/data/data_sources/remote/hospital/hospital_data_source.dart';
import 'package:medita_patient/app/data/mapper/hospital/hospital.dart';
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';
import 'package:medita_patient/app/data/models/data/hospital/hospital.dart';
import 'package:medita_patient/app/data/network/network_info.dart';

import '../../handler/exception_handler/login/login_exception_handler.dart';
import '../../network/status_code/status_code.dart';

class HospitalRepository {
  final HospitalDataSource _hospitalDataSource;
  final NetworkInfo _networkInfo;

  HospitalRepository(this._hospitalDataSource, this._networkInfo);

  /// this function call check the internet Connection
  /// then call the list hospitals api
  /// and return [Either] object
  /// [List] of [Hospital] if success call
  /// and [Failure] object if call fail
  Future<Either<Failure, List<Hospital>>> listNearHospitals() async {
    if(!await _networkInfo.isConnected()) {
      Failure noInternetConnectionFailure = StatusCode.noInternetConnection.getAuthenticationFailure();
      return Left(noInternetConnectionFailure);
    }

    try {
      var response = await _hospitalDataSource.listNearHospitals();
      var hospitals = response.map((hospital) => hospital.toDomain()).toList();
      return Right(hospitals);
    } catch (error) {
      if (kDebugMode) {
        print("Repo Error ${error.toString()}");
      }
      LoginExceptionHandler failureHandledError = LoginExceptionHandler.handler(error);
      return Left(failureHandledError.failure);
    }
  }
}
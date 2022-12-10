import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medita_patient/app/data/handler/exception_handler/network_exception_handler.dart';
import 'package:medita_patient/app/data/mapper/login_response_mapper.dart';
import 'package:medita_patient/app/data/models/token.dart';
import 'package:medita_patient/app/data/models/failure.dart';
import 'package:medita_patient/app/data/network/requests/login_request.dart';
import 'package:medita_patient/app/data/network/status_code/status_code.dart';
import 'package:medita_patient/app/domain/repositories/login_repository.dart';

import '../data_sources/remote/date_source.dart';
import '../network/network_info.dart';

class LoginRepositoryImp implements LoginRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  LoginRepositoryImp(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Token>> login(LoginRequest loginRequest) async {
    if(!await _networkInfo.isConnected()) {
      Failure noInternetConnectionFailure = StatusCode.noInternetConnection.getFailure();
      return Left(noInternetConnectionFailure);
    }
    try {
      final response = await _remoteDataSource.login(loginRequest);
      return Right(response.toDomain());
    } catch (error) {
      ExceptionHandler failureHandledError = ExceptionHandler.handler(error);
      return Left(failureHandledError.failure);
    }
  }

}
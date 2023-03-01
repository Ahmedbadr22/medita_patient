import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/handler/exception_handler/login/login_exception_handler.dart';
import 'package:medita_patient/app/data/mapper/login/login_response_mapper.dart';
import 'package:medita_patient/app/data/models/data/token.dart';
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';
import 'package:medita_patient/app/data/network/requests/login/login_request.dart';
import 'package:medita_patient/app/data/network/status_code/status_code.dart';

import '../../data_sources/remote/login/login_date_source.dart';
import '../../network/network_info.dart';

class LoginRepository {
  final LoginDataSource _loginDataSource;
  final NetworkInfo _networkInfo;

  LoginRepository(this._loginDataSource, this._networkInfo);

  /// this function call check the internet Connection
  /// then call the login api
  /// and return [Either] object
  /// [Token] if success call
  /// and [Failure] object if call fail
  Future<Either<Failure, Token>> login(LoginRequest loginRequest) async {
    if(!await _networkInfo.isConnected()) {
      Failure noInternetConnectionFailure = StatusCode.noInternetConnection.getAuthenticationFailure();
      return Left(noInternetConnectionFailure);
    }

    try {
      final response = await _loginDataSource.login(loginRequest);
      return Right(response.toDomain());
    } catch (error) {
      LoginExceptionHandler failureHandledError = LoginExceptionHandler.handler(error);
      return Left(failureHandledError.failure);
    }
  }

}
import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/data_sources/remote/registration/registration_data_source.dart';
import 'package:medita_patient/app/data/mapper/registration/registration_response_mapper.dart';
import 'package:medita_patient/app/data/models/data/registration.dart';
import 'package:medita_patient/app/data/network/network_info.dart';
import 'package:medita_patient/app/data/network/requests/registration/registration_request.dart';

import '../../handler/exception_handler/login/login_exception_handler.dart';
import '../../models/data/failure/auth/auth_failure.dart';
import '../../network/status_code/status_code.dart';

class RegistrationRepository {
  final RegistrationDataSource _registrationDataSource;
  final NetworkInfo _networkInfo;

  RegistrationRepository(this._registrationDataSource, this._networkInfo);

  /// this function call check the internet Connection
  /// then call the registration api
  /// and return [Either] object
  /// [Registration] object if success call
  /// and [Failure] object if call fail
  Future<Either<Failure, Registration>> register(RegistrationRequest registrationRequest) async {
    if(!await _networkInfo.isConnected()) {
      Failure noInternetConnectionFailure = StatusCode.noInternetConnection.getAuthenticationFailure();
      return Left(noInternetConnectionFailure);
    }

    try {
      final response = await _registrationDataSource.registration(registrationRequest);
      Registration registration = response.toDomain();
      return Right(registration);
    } catch (error) {
      LoginExceptionHandler failureHandledError = LoginExceptionHandler.handler(error);
      Failure failure = failureHandledError.failure;
      return Left(failure);
    }
  }
}
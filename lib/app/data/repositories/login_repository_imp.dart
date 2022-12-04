import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/mapper/login_response_mapper.dart';
import 'package:medita_patient/app/data/models/token.dart';
import 'package:medita_patient/app/data/network/failure.dart';
import 'package:medita_patient/app/data/network/requests/login_request.dart';
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
      return Left(Failure("Fail Yaa Ahmed"));
    }
    try {
      final response = await _remoteDataSource.login(loginRequest);

      return Right(response.toDomain());
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

}
import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/models/token.dart';

import '../../data/network/failure.dart';
import '../../data/network/requests/login_request.dart';


abstract class  LoginRepository {
  Future<Either<Failure, Token>> login(LoginRequest loginRequest);
}
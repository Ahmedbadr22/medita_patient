import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/models/token.dart';
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';
import 'package:medita_patient/app/data/network/requests/login/login_request.dart';
import 'package:medita_patient/app/domain/use_cases/base/base_use_case.dart';

import '../../../data/repositories/login/login_repository.dart';

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Token> {
  final LoginRepository _loginRepository;
  
  LoginUseCase(this._loginRepository);

  /// This function execute the login api call
  /// by passing [LoginUseCaseInput] object as a parameter
  /// return [Either] object of
  /// [Token] if success call or
  /// [Failure] if fail call
  @override
  Future<Either<Failure, Token>> execute(LoginUseCaseInput input) async {
    LoginRequest loginRequest = LoginRequest(input.email, input.password);
    return await _loginRepository.login(loginRequest);
  }
    
}
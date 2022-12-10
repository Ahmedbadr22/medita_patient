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
  
  @override
  Future<Either<AuthenticationFailure, Token>> execute(LoginUseCaseInput input) async {
    LoginRequest loginRequest = LoginRequest(input.email, input.password);
    return await _loginRepository.login(loginRequest);
  }
    
}
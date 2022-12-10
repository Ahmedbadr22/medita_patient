import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/models/token.dart';
import 'package:medita_patient/app/data/models/failure.dart';
import 'package:medita_patient/app/data/network/requests/login_request.dart';
import 'package:medita_patient/app/domain/repositories/login_repository.dart';
import 'package:medita_patient/app/domain/use_cases/base_use_case.dart';

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Token> {
  final LoginRepository _loginRepository;
  
  LoginUseCase(this._loginRepository);
  
  @override
  Future<Either<Failure, Token>> execute(LoginUseCaseInput input) async {
    LoginRequest loginRequest = LoginRequest(input.email, input.password);
    return await _loginRepository.login(loginRequest);
  }
    
}
import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/models/data/token.dart';
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';
import 'package:medita_patient/app/data/network/requests/login/login_request.dart';
import 'package:medita_patient/app/domain/use_cases/base/base_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/token/save_token_use_case.dart';

import '../../../data/repositories/login/login_repository.dart';

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Token> {
  final LoginRepository _loginRepository;
  final SaveTokenUseCase _saveTokenUseCase;
  
  LoginUseCase(this._loginRepository, this._saveTokenUseCase);

  /// This function execute the login api call
  /// by passing [LoginUseCaseInput] object as a parameter
  /// return [Either] object of
  /// [Token] if success call or
  /// [Failure] if fail call
  @override
  Future<Either<Failure, Token>> execute(LoginUseCaseInput input) async {
    LoginRequest loginRequest = LoginRequest(input.email, input.password);
    Either<Failure, Token> result = await _loginRepository.login(loginRequest);
    result.fold((failure) => null, (token) => _saveTokenUseCase.execute(token));
    return result;
  }
    
}
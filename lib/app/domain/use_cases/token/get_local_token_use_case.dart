


import 'package:medita_patient/app/data/models/data/token.dart';
import 'package:medita_patient/app/data/repositories/token/token_repository.dart';

class GetLocalTokenUseCase {
  late final TokenRepository _tokenRepository;

  GetLocalTokenUseCase(this._tokenRepository);

  Token? execute() {
    return _tokenRepository.getToken();
  }
}


import 'package:medita_patient/app/data/models/data/token.dart';
import 'package:medita_patient/app/data/repositories/token/token_repository.dart';

class SaveTokenUseCase {
  late final TokenRepository _tokenRepository;

  SaveTokenUseCase(this._tokenRepository);

  execute(Token token) {
    _tokenRepository.setToken(token);
  }
}
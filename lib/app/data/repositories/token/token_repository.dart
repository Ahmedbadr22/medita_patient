

import 'package:medita_patient/app/data/data_sources/local/sharedPref/token_local_data_source.dart';
import 'package:medita_patient/app/data/models/data/token.dart';

class TokenRepository {
  late final TokenLocalDataSource _tokenLocalDataSource;

  TokenRepository(this._tokenLocalDataSource);

  void setToken(Token token) {
    _tokenLocalDataSource.setTokens(token);
  }

  Token? getToken() {
    return _tokenLocalDataSource.getToken();
  }
}
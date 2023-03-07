import 'package:medita_patient/app/app/constants.dart';
import 'package:medita_patient/app/data/models/data/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenLocalDataSource {
  late final SharedPreferences _sharedPreferences;

  TokenLocalDataSource(this._sharedPreferences);


  void setTokens(Token token) async {
    await _sharedPreferences.setString(SharedPrefConstants.accessToken, token.access);
    await _sharedPreferences.setString(SharedPrefConstants.refreshToken, token.refresh);
  }

  Token? getToken() {
    String? accessToken  = _sharedPreferences.getString(SharedPrefConstants.accessToken);
    String? refreshToken  = _sharedPreferences.getString(SharedPrefConstants.refreshToken);
    if (accessToken == null || refreshToken == null) {
      return null;
    }
    return Token(accessToken, refreshToken);
  }

}
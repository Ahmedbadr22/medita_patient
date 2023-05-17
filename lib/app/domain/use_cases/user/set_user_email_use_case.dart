
import 'package:shared_preferences/shared_preferences.dart';

class SetUserEmailUsecase {
  final SharedPreferences _sharedPreferences;

  SetUserEmailUsecase(this._sharedPreferences);

  void execute(String email) async {
    await _sharedPreferences.setString("user_email", email);
  }

}
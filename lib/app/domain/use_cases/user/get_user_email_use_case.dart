
import 'package:shared_preferences/shared_preferences.dart';

class GetUserEmailUsecase {
  final SharedPreferences _sharedPreferences;

  GetUserEmailUsecase(this._sharedPreferences);

  Future<String> execute() async {
    String? email = _sharedPreferences.getString("user_email");
    return email ?? "";
  }

}
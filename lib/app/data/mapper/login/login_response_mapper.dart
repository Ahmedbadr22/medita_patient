import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/models/data/token.dart';
import 'package:medita_patient/app/data/responses/login/login_response.dart';

extension LoginResponseMapper on LoginResponse {
  /// this function map the [LoginResponse] object
  /// to be [Token] object
  Token toDomain() {
    return Token(accessToken.orEmpty(), refreshToken.orEmpty());
  }
}
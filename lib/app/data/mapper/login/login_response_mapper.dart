import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/models/token.dart';
import 'package:medita_patient/app/data/responses/login/login_response.dart';

extension LoginResponseMapper on LoginResponse {
  Token toDomain() {
    return Token(accessToken.orEmpty(), refreshToken.orEmpty());
  }
}
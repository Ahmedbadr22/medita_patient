import 'package:medita_patient/app/data/network/api/login/login_api_service_client.dart';
import 'package:medita_patient/app/data/network/requests/login/login_request.dart';
import '../../../responses/login/login_response.dart';


class LoginDataSource  {
  final LoginApiServiceClient _appServiceClient;

  LoginDataSource(this._appServiceClient);

  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(loginRequest.email, loginRequest.password);
  }

}
import 'package:medita_patient/app/data/network/api/api.dart';
import 'package:medita_patient/app/data/network/requests/login_request.dart';
import '../../responses/login_response.dart';

abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImp implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImp(this._appServiceClient);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(loginRequest.email, loginRequest.password);
  }

}
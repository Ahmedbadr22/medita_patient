import 'package:medita_patient/app/data/network/api/registration/registration_api_service_client.dart';

import '../../../network/requests/registration/registration_request.dart';
import '../../../responses/registration/registration_response.dart';

class RegistrationDataSource {
  final RegistrationApiServiceClient _registrationApiServiceClient;

  RegistrationDataSource(this._registrationApiServiceClient);

  /// call the registration api
  /// return [Future] response of [RegistrationResponse]
  Future<RegistrationResponse> registration(RegistrationRequest registrationRequest) async {
    return await _registrationApiServiceClient.register(registrationRequest.fullName, registrationRequest.email, registrationRequest.password);
  }
}
import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/responses/registration/registration_response.dart';

import '../../models/registration.dart';

extension RegistrationResponseMapper on RegistrationResponse {
  Registration toDomain() {
    return Registration(firstName.orEmpty(), lastName.orEmpty(), email.orEmpty());
  }
}
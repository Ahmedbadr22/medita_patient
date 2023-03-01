import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';
import 'package:medita_patient/app/data/models/data/registration.dart';
import 'package:medita_patient/app/data/network/requests/registration/registration_request.dart';
import 'package:medita_patient/app/data/repositories/registration/registration_repository.dart';
import 'package:medita_patient/app/domain/use_cases/base/base_use_case.dart';

class RegistrationUseCaseInput {
  String firstName;
  String lastName;
  String email;
  String password;

  RegistrationUseCaseInput(this.firstName, this.lastName, this.email, this.password);

  @override
  String toString() {
    return "$firstName $lastName $email $password";
  }
}

class RegisterUseCase implements BaseUseCase<RegistrationUseCaseInput, Registration> {
  final RegistrationRepository _registrationRepository;

  RegisterUseCase(this._registrationRepository);

  /// This function execute the registration api call
  /// by passing [RegistrationUseCaseInput] object as a parameter
  /// return [Either] object of
  /// [Registration] if success call or
  /// [Failure] if fail call
  @override
  Future<Either<Failure, Registration>> execute(RegistrationUseCaseInput registrationUseCaseInput) async {
    RegistrationRequest registrationRequest = RegistrationRequest(registrationUseCaseInput.firstName, registrationUseCaseInput.lastName, registrationUseCaseInput.email, registrationUseCaseInput.password);
    return await _registrationRepository.register(registrationRequest);
  }
}
import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:medita_patient/app/data/models/data/appointment/appointment.dart';
import 'package:medita_patient/app/data/repositories/appointment/appointment_repository.dart';

import '../../../data/models/data/failure/auth/auth_failure.dart';
import '../../../data/models/data/token.dart';
import '../token/get_local_token_use_case.dart';

class ListUserAppointmentsUseCase {
  late final AppointmentRepository _repository;
  late final GetLocalTokenUseCase _getLocalTokenUseCase;

  ListUserAppointmentsUseCase(this._repository, this._getLocalTokenUseCase);

  Future<Either<Failure, List<Appointment>>> execute() async {
    Token? token = _getLocalTokenUseCase.execute();
    int userId = JwtDecoder.decode(token!.access)["user_id"];
    return await _repository.listUserAppointments(userId);
  }
}
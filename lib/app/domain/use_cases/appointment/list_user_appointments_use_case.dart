import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/models/data/appointment/appointment.dart';
import 'package:medita_patient/app/data/repositories/appointment/appointment_repository.dart';

import '../../../data/models/data/failure/auth/auth_failure.dart';

class ListUserAppointmentsUseCase {
  late final AppointmentRepository _repository;

  ListUserAppointmentsUseCase(this._repository);

  Future<Either<Failure, List<Appointment>>> execute() async {
    return await _repository.listUserAppointments(2);
  }
}
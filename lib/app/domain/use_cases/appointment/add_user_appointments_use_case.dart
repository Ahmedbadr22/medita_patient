import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/models/data/appointment/appointment.dart';
import 'package:medita_patient/app/data/repositories/appointment/appointment_repository.dart';

import '../../../data/models/data/failure/auth/auth_failure.dart';

class AddUserAppointmentsUseCase {
  late final AppointmentRepository _repository;

  AddUserAppointmentsUseCase(this._repository);

  Future<Either<Failure, Appointment>> execute(int doctorId, int patientId, String problemDetail, String dateTime, String meetingLink) async {
    return await _repository.addUserAppointments(doctorId, patientId, problemDetail, dateTime, meetingLink);
  }
}
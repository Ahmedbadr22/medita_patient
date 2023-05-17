
import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';
import 'package:medita_patient/app/data/repositories/meeting/meeting_repository.dart';
import 'package:medita_patient/app/domain/models/meeting.dart';

class CreateMeetingUseCase {

  final MeetingRepository _repository;

  CreateMeetingUseCase(this._repository);

  Future<Either<Failure, Meeting>> invoke(String title, String description, String doctorEmail, String patientEmail,String startTime) {
    return _repository.createMeeting(title, description, doctorEmail, patientEmail, startTime);
  }

}


import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/responses/appointment/meeting_response.dart';
import 'package:medita_patient/app/domain/models/meeting.dart';

extension MeetingResponseMapper on MeetingResponse {
  /// this function map the [HospitalResponse] object
  /// to be [Hospital] object
  Meeting toDomain() {
    return Meeting(
        meetingLink.orEmpty()
    );
  }
}
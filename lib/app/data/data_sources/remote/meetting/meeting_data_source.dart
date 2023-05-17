
import 'package:medita_patient/app/data/network/api/meeting/meeting_api_service_client.dart';

import '../../../responses/appointment/meeting_response.dart';

class MeetingRemoteDatasource {
  final MeetingApiServiceClient _client;

  MeetingRemoteDatasource(this._client);

  Future<MeetingResponse> createMeeting(String title, String description, String doctorEmail, String patientEmail,String startTime) {
    return _client.createMeeting(title, description, doctorEmail, patientEmail, startTime);
  }
}
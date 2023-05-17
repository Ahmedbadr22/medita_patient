import 'package:dio/dio.dart';
import 'package:medita_patient/app/data/responses/appointment/meeting_response.dart';
import 'package:retrofit/http.dart';

import '../../../../app/constants.dart';

part 'meeting_api_service_client.g.dart';

@RestApi(baseUrl: ApiConstants.meetingBaseUrl)
abstract class MeetingApiServiceClient {
  factory MeetingApiServiceClient(Dio dio, {String baseUrl}) = _MeetingApiServiceClient;

  @POST(ApiConstants.createMeeting)
  Future<MeetingResponse> createMeeting(
    @Field("meeting_title") String title,
    @Field("meeting_description") String description,
    @Field("doctor_email") String doctorEmail,
    @Field("patient_email") String patientEmail,
    @Field("start_time") String startTime,
  );
}

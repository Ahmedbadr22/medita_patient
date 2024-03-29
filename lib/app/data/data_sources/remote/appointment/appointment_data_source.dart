import 'package:medita_patient/app/data/network/api/appointment/appointment_client_api.dart';
import 'package:medita_patient/app/data/responses/appointment/appointment_response.dart';

class AppointmentDataSource {
  late final AppointmentClientApi _api;

  AppointmentDataSource(this._api);

  Future<List<AppointmentResponse>> listUserAppointments(int id) {
    return _api.listUserAppointments(id);
  }

  Future<AppointmentResponse> addUserAppointments(
    int doctorId,
    int patientId,
    String problemDetail,
    String dateTime,
    String meetingLink,
  ) {
    return _api.addUserAppointments(doctorId, patientId, problemDetail, dateTime, meetingLink);
  }
}

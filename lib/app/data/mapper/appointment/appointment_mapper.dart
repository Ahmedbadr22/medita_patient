


import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/mapper/doctor/doctor_mapper.dart';
import 'package:medita_patient/app/data/models/data/appointment/appointment.dart';
import 'package:medita_patient/app/data/models/data/doctor/doctor.dart';
import 'package:medita_patient/app/data/responses/appointment/appointment_response.dart';

extension AppointmentResponseMapper on AppointmentResponse {
  Appointment toDomain() {
    Doctor doctor = doctorResponse!.toDomain();
    return Appointment(id.orZero(), doctor, date.orEmpty(), time.orEmpty(), problemDetail.orEmpty(), bookingRequestDate.orEmpty(), isCanceled ?? false);
  }
}
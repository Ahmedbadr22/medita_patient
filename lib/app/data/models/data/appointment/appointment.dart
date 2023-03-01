
import 'package:medita_patient/app/data/models/data/doctor/doctor.dart';

class Appointment {
  int id;
  Doctor doctor;
  String date;
  String time;
  String problemDetail;
  String bookingRequestDate;
  bool isCanceled;


  Appointment(this.id, this.doctor, this.date, this.time, this.problemDetail, this.bookingRequestDate, this.isCanceled);


  bool isUpcoming() {
    DateTime currentDateTime = DateTime.now();
    DateTime appointmentDateTime = DateTime.parse("$date $time");
    print("Current : $currentDateTime, App: $appointmentDateTime, isUp = ${appointmentDateTime.isAfter(currentDateTime)}");
    return appointmentDateTime.isAfter(currentDateTime);
  }

  bool isCompleted() {
    DateTime currentDateTime = DateTime.now();
    DateTime appointmentDateTime = DateTime.parse("$date $time");
    print("Current : $currentDateTime, App: $appointmentDateTime is Com: ${currentDateTime.isAfter(appointmentDateTime)}");
    return currentDateTime.isAfter(appointmentDateTime);
  }
}
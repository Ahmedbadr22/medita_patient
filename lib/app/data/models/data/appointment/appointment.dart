
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medita_patient/app/data/models/data/doctor/doctor.dart';

class Appointment {
  int id;
  Doctor doctor;
  String dateTime;
  String problemDetail;
  String meetingLink;
  String bookingRequestDate;
  bool isCanceled;


  Appointment(this.id, this.doctor, this.dateTime, this.meetingLink, this.problemDetail, this.bookingRequestDate, this.isCanceled);


  bool isUpcoming() {
    DateTime currentDateTime = DateTime.now();
    DateTime appointmentDateTime = DateTime.parse(dateTime);
    return appointmentDateTime.isAfter(currentDateTime);
  }

  bool isCompleted() {
    DateTime currentDateTime = DateTime.now();
    DateTime appointmentDateTime = DateTime.parse(dateTime);
    return currentDateTime.isAfter(appointmentDateTime);
  }

  String getFormattedDate(BuildContext context) {
    DateTime appointmentDateTime = DateTime.parse(dateTime);
    TimeOfDay.fromDateTime(appointmentDateTime).toString();
    String time = TimeOfDay.fromDateTime(appointmentDateTime).format(context);
    String date = DateFormat("dd-MM-yyyy").format(appointmentDateTime);
    return "$date $time";
  }

  String getDayName() {
    DateTime appointmentDateTime = DateTime.parse(dateTime);
    String date = DateFormat("EEEE").format(appointmentDateTime);
    return date;
  }

  String getNamedDate() {
    DateTime appointmentDateTime = DateTime.parse(dateTime);
    String day = DateFormat("EEEE").format(appointmentDateTime);
    String month = DateFormat("MMMM").format(appointmentDateTime);
    String year = DateFormat("y").format(appointmentDateTime);
    return "$day, $month ${appointmentDateTime.day}, $year";
  }

  String getTime(BuildContext context) {
    DateTime appointmentDateTime = DateTime.parse(dateTime);
    String time = TimeOfDay.fromDateTime(appointmentDateTime).format(context);
    return time;
  }

}
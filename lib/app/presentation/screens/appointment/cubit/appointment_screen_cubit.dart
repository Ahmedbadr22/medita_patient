import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/data/models/data/appointment/appointment.dart';
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';

import '../../../../domain/use_cases/appointment/list_user_appointments_use_case.dart';
import 'appointment_screen_state.dart';

class AppointmentScreenCubit extends Cubit<AppointmentScreenState> {
  final ListUserAppointmentsUseCase _listUserAppointmentsUseCase;

  AppointmentScreenCubit(this._listUserAppointmentsUseCase) : super(AppointmentScreenInitState());

  static AppointmentScreenCubit get(BuildContext context) => BlocProvider.of(context);

  List<Appointment> upcomingAppointments = [];
  List<Appointment> completedAppointments = [];
  List<Appointment> canceledAppointments = [];

  init() {
   listUserAppointments();
  }

   listUserAppointments() async {
    Either<Failure, List<Appointment>> result = await _listUserAppointmentsUseCase.execute();
    result.fold((failure) => {

    }, (data) => {
      splitAppointments(data)
    });
  }

  void splitAppointments(List<Appointment> appointments) {
    for (var appointment in appointments) {
      if(appointment.isUpcoming()) {
        upcomingAppointments.add(appointment);
      } else if (appointment.isCompleted()) {
        completedAppointments.add(appointment);
      } else if (appointment.isCanceled) {
        canceledAppointments.add(appointment);
      }
    }
    emit(AppointmentScreenSuccessProcessState());
  }

}
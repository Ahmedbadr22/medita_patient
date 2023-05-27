abstract class BookAppointmentState {
  bool loading;

  BookAppointmentState({this.loading = false});
}
class BookAppointmentMainState extends BookAppointmentState {}
class BookAppointmentPageIndexChangeState extends BookAppointmentState {}
class BookAppointmentDateChangeState extends BookAppointmentState {}
class BookAppointmentTimeChangeState extends BookAppointmentState {}

class BookAppointmentLoadingState extends BookAppointmentState {
  BookAppointmentLoadingState(bool loading) : super(loading: loading);
}
class BookAppointmentNextState extends BookAppointmentState {}
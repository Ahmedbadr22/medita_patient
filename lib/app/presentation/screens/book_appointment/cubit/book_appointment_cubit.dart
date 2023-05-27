import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/models/data/doctor/doctor.dart';
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';
import 'package:medita_patient/app/data/models/data/token.dart';
import 'package:medita_patient/app/domain/models/meeting.dart';
import 'package:medita_patient/app/domain/use_cases/token/get_local_token_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/user/get_user_email_use_case.dart';

import '../../../../domain/use_cases/appointment/add_user_appointments_use_case.dart';
import '../../../../domain/use_cases/metting/create_meeting_usecase.dart';
import '../../../manager/values_manager.dart';
import '../screen/appointment_date_time_screen.dart';
import '../screen/appointment_problem_detail_screen.dart';
import 'book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  int currentPageIndex = 0;

  List<Widget> pages = [
    const AppointmentDateTimeScreen(),
    const AppointmentProblemDetailScreen(),
  ];

  DateTime selectedDay = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  late Doctor appDoctor;

  TextEditingController problemDetailController = TextEditingController();
  PageController pageController = PageController();

  // useCases
  CreateMeetingUseCase createMeetingUseCase;
  GetUserEmailUsecase getUserEmailUsecase;
  GetLocalTokenUseCase getLocalTokenUseCase;
  AddUserAppointmentsUseCase addUserAppointmentsUseCase;

  DateFormat dateFormatter = DateFormat('yyyy-MM-dd');

  BookAppointmentCubit(
    this.createMeetingUseCase,
    this.getUserEmailUsecase,
    this.getLocalTokenUseCase,
    this.addUserAppointmentsUseCase,
  ) : super(BookAppointmentMainState());

  static BookAppointmentCubit get(BuildContext context) =>
      BlocProvider.of(context);

  void changeCurrentPageItemIndex(int? index) {
    currentPageIndex = index ?? 0;
    emit(BookAppointmentPageIndexChangeState());
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    selectedDay = day;
    emit(BookAppointmentDateChangeState());
  }

  void onSelectedTimeChanged(TimeOfDay? timeOfDay) {
    if (timeOfDay == null) {
      return;
    }

    selectedTime = timeOfDay;
    emit(BookAppointmentTimeChangeState());
  }

  void onNextClick() async {
    if (currentPageIndex < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(
          seconds: TimeValue.onBoardingPageChangeDuration,
        ),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      emit(BookAppointmentLoadingState(true));
      String dateTime = "${dateFormatter.format(selectedDay)} ${selectedTime.to24hours()}:00";

      String userEmail = await getUserEmailUsecase.execute();
      Token? token = getLocalTokenUseCase.execute();

      int userId = JwtDecoder.decode(token!.access)["user_id"];

      Either<Failure, Meeting> response = await createMeetingUseCase.invoke(
        "Doctor Appointment Meeting",
        problemDetailController.text.orEmpty(),
        userEmail,
        appDoctor.user.email,
        dateTime,
      );

      response.fold((Failure fail) {
        if (kDebugMode) {
          print("Error ${fail.message}");
        }
      }, (Meeting meeting) async {
        var result = await addUserAppointmentsUseCase.execute(
          appDoctor.id,
          userId,
          problemDetailController.text.orEmpty(),
          dateTime,
          meeting.link,
        );

        result.fold((Failure error) {
          if (kDebugMode) {
            print("Fail App ${error.message}");
          }
        }, (_) {
          if (kDebugMode) {
            print("Appointment Created Successfully");
          }
        });
        emit(BookAppointmentLoadingState(false));
      });
    }
  }

  void setAppointmentDoctor(Doctor doctor) {
    appDoctor = doctor;
  }
}

extension TimeOfDayConverter on TimeOfDay {
  String to24hours() {
    // to handle the difference of the time of egypt
    int updatedHour = this.hour - 1;
    final hour = updatedHour.toString().padLeft(2, "0");
    final min = minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}

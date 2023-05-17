import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/screens/book_appointment/cubit/book_appointment_cubit.dart';
import 'package:medita_patient/app/presentation/screens/book_appointment/widget/time_chip.dart';
import 'package:table_calendar/table_calendar.dart';

import '../cubit/book_appointment_state.dart';

class AppointmentDateTimeScreen extends StatelessWidget {
  const AppointmentDateTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BookAppointmentCubit cubit = BookAppointmentCubit.get(context);

    Widget timeChipItemBuilder(_, int index) {
      String time = cubit.times[index];
      return TimeChip(
        time: time,
        isSelected: index == cubit.selectedTimeIndex,
        onClick: (value) => cubit.onTimeSelected(index),
      );
    }

    return BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          backgroundColor: ColorManager.white,
          body: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSize.s20,
                  top: AppSize.s14,
                  right: AppSize.s20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringManager.selectDate,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: ColorManager.darkBlack),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffEEF4FF),
                        borderRadius: BorderRadius.circular(AppSize.s20),
                      ),
                      padding: const EdgeInsets.all(AppSize.s20),
                      margin: const EdgeInsets.symmetric(vertical: AppSize.s8),
                      child: TableCalendar(
                        firstDay: DateTime.now(),
                        focusedDay: cubit.selectedDay,
                        lastDay: DateTime.utc(2030, 12, 30),
                        locale: 'en_US',
                        rowHeight: AppSize.s40,
                        headerStyle: const HeaderStyle(
                          headerMargin: EdgeInsets.only(left: AppSize.s10),
                          titleTextStyle: TextStyle(
                            color: ColorManager.darkBlack,
                            fontSize: AppSize.s18,
                            fontWeight: FontWeight.w500,
                          ),
                          formatButtonVisible: false,
                          leftChevronVisible: false,
                          rightChevronVisible: false,
                          headerPadding: EdgeInsets.only(bottom: AppSize.s18),
                        ),
                        availableGestures: AvailableGestures.all,
                        onDaySelected: cubit.onDaySelected,
                        selectedDayPredicate: (day) =>
                            isSameDay(day, cubit.selectedDay),
                      ),
                    ),
                    Text(
                      StringManager.selectHour,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: ColorManager.darkBlack),
                    ),
                    10.ph,
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: AppSize.s50,
                        crossAxisSpacing: AppSize.s10,
                        crossAxisCount: 3,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: cubit.times.length,
                      itemBuilder: timeChipItemBuilder,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

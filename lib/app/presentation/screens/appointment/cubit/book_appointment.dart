import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  List time = [
    '09:00 AM',
    '09:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '01:00 PM',
    '01:30 PM',
    '02:00 PM',
    '02:30 PM',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: ColorManager.darkBlack,
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Text(StringManager.bookAppointMent)),
        body: ListView(children: [
          Padding(
              padding: const EdgeInsets.only(
                  left: AppSize.s20, top: AppSize.s14, right: AppSize.s20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(StringManager.selectDate,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: ColorManager.darkBlack)),
                  _calenderWidget(),
                  Text(StringManager.selectHour,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: ColorManager.darkBlack)),
                  const SizedBox(height: AppSize.s10),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: AppSize.s50,
                              crossAxisSpacing: AppSize.s10,
                              crossAxisCount: 3),
                      scrollDirection: Axis.vertical,
                      itemCount: time.length,
                      itemBuilder: ((context, index) {
                        var name = time[index];
                        return FilterChip(
                          padding: const EdgeInsets.only(
                              left: AppSize.s14,
                              right: AppSize.s14,
                              top: AppSize.s10,
                              bottom: AppSize.s10),
                          label: Text(
                            name,
                            style: TextStyle(
                                color: index == 0
                                    ? Colors.white
                                    : ColorManager.lightBlue),
                          ),
                          onSelected: (bool value) {},
                          backgroundColor: index == 0
                              ? Theme.of(context).primaryColor
                              : Colors.transparent,
                          shape: StadiumBorder(
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.5)),
                        );
                      })),
                  const SizedBox(height: AppSize.s24),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              elevation: AppSize.s0,
                              padding: const EdgeInsets.all(AppSize.s14),
                              shape: const StadiumBorder()),
                          child: Text(StringManager.next,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: ColorManager.white)))),
                ],
              ))
        ]));
  }

  Container _calenderWidget() {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffEEF4FF),
          borderRadius: BorderRadius.circular(AppSize.s20)),
      padding: const EdgeInsets.all(AppSize.s20),
      margin: const EdgeInsets.only(top: AppSize.s16, bottom: AppSize.s20),
      child: TableCalendar(
          firstDay: DateTime.utc(2010, 10, 10),
          focusedDay: today,
          lastDay: DateTime.utc(2030, 12, 30),
          locale: 'en_US',
          rowHeight: AppSize.s40,
          headerStyle: const HeaderStyle(
              headerMargin: EdgeInsets.only(left: AppSize.s10),
              titleTextStyle: TextStyle(
                  color: ColorManager.darkBlack,
                  fontSize: AppSize.s18,
                  fontWeight: FontWeight.w500),
              formatButtonVisible: false,
              leftChevronVisible: false,
              rightChevronVisible: false,
              headerPadding: EdgeInsets.only(bottom: AppSize.s18)),
          availableGestures: AvailableGestures.all,
          onDaySelected: _onDaySelected,
          selectedDayPredicate: (day) => isSameDay(day, today)),
    );
  }
}

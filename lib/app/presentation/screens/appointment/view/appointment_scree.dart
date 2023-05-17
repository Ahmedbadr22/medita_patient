import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/data/models/data/appointment/appointment.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/screens/appointment/cubit/appointment_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/appointment/cubit/appointment_screen_state.dart';
import 'package:medita_patient/app/presentation/screens/appointment/widget/appointment_card.dart';
import 'package:medita_patient/app/presentation/widgets/common_app_bar/common_app_bar.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppointmentScreenCubit cubit = AppointmentScreenCubit.get(context);

    ListView appointmentListView(List<Appointment> data) {
      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (_, int index) {
          Appointment appointment = data[index];
          return AppointmentCard(appointment: appointment);
        },
      );
    }

    return BlocConsumer<AppointmentScreenCubit, AppointmentScreenState>(
      listener: (_, __) {},
      builder: (_, __) {
        return DefaultTabController(
          initialIndex: 0,
          length: 3,
          child: Scaffold(
            appBar: commonAppBar(
              title: "My Appointments",
              bottom: TabBar(
                indicatorColor: Theme.of(context).primaryColor,
                tabs: const <Widget>[
                  Tab(
                    child: Text(
                      "Upcoming",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Completed",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Canceled",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                Visibility(
                  visible: cubit.upcomingAppointments.isNotEmpty,
                  replacement: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImageAsset.upcomingSvg,
                            width: 250,
                            height: 250,
                          ),
                          const Text(
                            "You don't have any upcoming appointments yet",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: appointmentListView(cubit.upcomingAppointments),
                ),
                Visibility(
                  visible: cubit.completedAppointments.isNotEmpty,
                  replacement: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImageAsset.completedSvg,
                            width: 250,
                            height: 250,
                          ),
                          const Text(
                            "You don't have any completed appointments yet",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: appointmentListView(cubit.completedAppointments),
                ),
                Visibility(
                  visible: cubit.canceledAppointments.isNotEmpty,
                  replacement: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImageAsset.canceledSvg,
                            width: 250,
                            height: 250,
                          ),
                          const Text(
                            "You don't have any canceled appointments yet",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: appointmentListView(cubit.canceledAppointments),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

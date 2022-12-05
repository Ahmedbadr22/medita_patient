import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
          child: Text(
        'Appointment Screen',
        style: TextStyle(fontSize: 30, color: ColorManager.darkBlue),
      )),
    );
  }
}

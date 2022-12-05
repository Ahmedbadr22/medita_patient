import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
          child: Text(
        'Schedule Screen',
        style: TextStyle(fontSize: 30, color: ColorManager.darkBlue),
      )),
    );
  }
}

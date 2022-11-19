import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';

class ArticalsScreen extends StatefulWidget {
  const ArticalsScreen({super.key});

  @override
  State<ArticalsScreen> createState() => _ArticalsScreenState();
}

class _ArticalsScreenState extends State<ArticalsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
          child: Text(
        'Articals Screen',
        style: TextStyle(fontSize: 30, color: ColorManager.darkBlue),
      )),
    );
  }
}

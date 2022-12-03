import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
          child: Text(
        'Articles Screen',
        style: TextStyle(fontSize: 30, color: ColorManager.darkBlue),
      )),
    );
  }
}

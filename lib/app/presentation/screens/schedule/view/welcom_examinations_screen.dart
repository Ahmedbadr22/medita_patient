import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';

class WelcomeExaminationWidget extends StatelessWidget {
  final String assetName;
  final String title;
  final String? subTitle;
  final VoidCallback onPressed;

  const WelcomeExaminationWidget(
      {super.key,
      required this.assetName,
      required this.title,
      required this.onPressed,
      this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(AppSize.s20),
        child: Column(children: [
          SvgPicture.asset(assetName, height: AppSize.s300),
          const SizedBox(height: 20),
          Text(title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium
              // getBoldStyle(
              //     color: ColorManager.lightBlue, fontSize: AppSize.s20),
              ),
          const SizedBox(height: AppSize.s18),
          Text(subTitle!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSize.s40),
          SizedBox(
              width: double.infinity,
              height: AppSize.s50,
              child: ElevatedButton(
                  onPressed: onPressed, child: const Text(StringManager.next)))
        ]),
      ),
    );
  }
}

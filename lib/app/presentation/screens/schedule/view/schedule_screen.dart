// List<TestSectionModel> testsSectionData = [
//   TestSectionModel(
//       imageUrl: ImageAsset.eyeImage,
//       testName: StringManager.visualAcuityTest),
//   TestSectionModel(
//       imageUrl: ImageAsset.fitnessImage,
//       testName: StringManager.fitnessSection),
// ];

import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/styles_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/screens/schedule/eye_test_app/eye_test_screen.dart';
import 'package:medita_patient/app/presentation/screens/schedule/first_aid_app/screens/first_screen.dart';
import 'package:medita_patient/app/presentation/screens/schedule/fitness_app/screens/fitness_section_screen.dart';
import 'package:medita_patient/app/presentation/screens/schedule/model/test_section_model.dart';
import 'package:medita_patient/app/presentation/screens/schedule/model/welcome_examination_model.dart';
import 'package:medita_patient/app/presentation/screens/schedule/view/welcom_examinations_screen.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<TestSectionModel> testsSectionData = [
    TestSectionModel(
        imageUrl: ImageAsset.eyeImage,
        testName: StringManager.visualAcuityTest),
    TestSectionModel(
        imageUrl: ImageAsset.firstAidImage,
        testName: StringManager.firstAidTips),
    TestSectionModel(
        imageUrl: ImageAsset.fitnessImage,
        testName: StringManager.visualAcuityTest),
  ];

  List<WelcomeExaminationModel> welcomeExaminationData = [
    WelcomeExaminationModel(
      assetName: ImageAsset.ophthalmologistSvg,
      title: 'Welcome in Eye Examination Test',
      subTitle:
          'This test is a mathematical demo. It has not been FDA approved. Do not use it as a substitute for medical opinion.',
    ),
    WelcomeExaminationModel(
      assetName: ImageAsset.ambulanceSvg,
      title: 'Welcome in First-Aid Tips',
      subTitle:
          'First-Aid helps make the recovery process faster, saves huge healthcare costs, and prevents the likelihood of injury from getting worse',
    ),
    WelcomeExaminationModel(
      assetName: ImageAsset.fitnessTrackerSvg,
      title: 'Welcome in Fitness Tracker',
      subTitle:
          'We help you to control your own health. This section allows you to track your health nutrition and workout metrics. ',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        testsSection(
          asset: testsSectionData[0].imageUrl,
          data: testsSectionData[0].testName,
          color: Colors.purple.shade100.withOpacity(0.4),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => WelcomeExaminationWidget(
                assetName: welcomeExaminationData[0].assetName,
                title: welcomeExaminationData[0].title,
                subTitle: welcomeExaminationData[0].subTitle,
                onPressed: navigateToEyeTestScreen,
              ),
            ));
          },
        ),
        testsSection(
          asset: testsSectionData[1].imageUrl,
          data: testsSectionData[1].testName,
          color: Colors.orange.shade100.withOpacity(0.4),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => WelcomeExaminationWidget(
                assetName: welcomeExaminationData[1].assetName,
                title: welcomeExaminationData[1].title,
                subTitle: welcomeExaminationData[1].subTitle,
                onPressed: navigateToFirstAidSectionScreen,
              ),
            ));
          },
        ),
        testsSection(
          color: Colors.blue.shade100.withOpacity(0.4),
          asset: testsSectionData[2].imageUrl,
          data: testsSectionData[2].testName,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => WelcomeExaminationWidget(
                assetName: welcomeExaminationData[2].assetName,
                title: welcomeExaminationData[2].title,
                subTitle: welcomeExaminationData[2].subTitle,
                onPressed: navigateToFitnessSectionScreen,
              ),
            ));
          },
        )
      ]),
    );
  }

  navigateToFitnessSectionScreen() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const FitnessSectionScreen()));
  }

  navigateToEyeTestScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const EyeTestScreen()));
  }

  navigateToFirstAidSectionScreen() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const FirstAidSectionScreen()));
  }
}

Widget testsSection({
  required String asset,
  required String data,
  required VoidCallback onTap,
  required Color color,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: AppSize.s120,
      margin: const EdgeInsets.all(AppSize.s16),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(AppSize.s20)),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Image.asset(asset, height: AppSize.s80),
        ),
        const SizedBox(height: AppSize.s10),
        Center(
          child: Text(
            data,
            textAlign: TextAlign.center,
            style: getBoldStyle(
                color: ColorManager.darkBlue, fontSize: AppSize.s18),
          ),
        )
      ]),
    ),
  );
}

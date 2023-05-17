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
import 'package:medita_patient/app/presentation/screens/schedule/plants_app/screens/plant_screen.dart';
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
      testName: StringManager.visualAcuityTest,
    ),
    TestSectionModel(
      imageUrl: ImageAsset.firstAidImage,
      testName: StringManager.firstAidTips,
    ),
    TestSectionModel(
      imageUrl: ImageAsset.fitnessImage,
      testName: StringManager.fitnessSection,
    ),
    TestSectionModel(
      imageUrl: ImageAsset.plantImage,
      testName: StringManager.plantSection,
    ),
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
    WelcomeExaminationModel(
      assetName: ImageAsset.plantCollectionSvg,
      title: 'Medicinal Herbs and Plants',
      subTitle:
          'Plants provide the essential foundation for life on Earth and are the single most important to life on Earth. ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Widget itemBuilder(_, int index) {
      return testsSection(
        color: const Color(0XFFC8E9B0).withOpacity(0.6),
        asset: testsSectionData[index].imageUrl,
        data: testsSectionData[index].testName,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => WelcomeExaminationWidget(
                assetName: welcomeExaminationData[index].assetName,
                title: welcomeExaminationData[index].title,
                subTitle: welcomeExaminationData[index].subTitle,
                onPressed: navigatePlantScreen,
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: itemBuilder,
        itemCount: testsSectionData.length,
      ),
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

  navigatePlantScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PlantScreen()));
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
      margin: const EdgeInsets.symmetric(
          horizontal: AppSize.s16, vertical: AppSize.s8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSize.s18),
            child: Image.asset(asset, height: AppSize.s80),
          ),
          const SizedBox(height: AppSize.s10),
          Center(
            child: Text(
              data,
              textAlign: TextAlign.center,
              style: getBoldStyle(
                color: ColorManager.darkBlue,
                fontSize: AppSize.s18,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

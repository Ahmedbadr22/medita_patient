import 'package:flutter/material.dart';

import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/routes_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/screens/schedule/model/test_section_model.dart';
import 'package:medita_patient/app/presentation/screens/schedule/widgets/card/test_card.dart';

import '../screens/eye_test_app/eye_test_screen.dart';
import '../screens/first_aid_app/screens/first_screen.dart';
import '../screens/fitness_app/screens/fitness_section_screen.dart';
import '../screens/plants_app/screens/plant_screen.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({super.key});

  final List<TestSectionModel> testsSectionData = [
    TestSectionModel(
      imageUrl: ImageAsset.eyeImage,
      testName: StringManager.diseaseTest,
    ),
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

  @override
  Widget build(BuildContext context) {

    void navigateToDiseaseTestScreen() {
      Navigator.pushNamed(context, Routes.diseaseTestScreen);
    }

    navigateToFitnessSectionScreen() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const FitnessSectionScreen()));
    }

    navigateToEyeTestScreen() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const EyeTestScreen()));
    }

    navigateToFirstAidSectionScreen() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const FirstAidSectionScreen()));
    }

    navigatePlantScreen() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const PlantScreen()));
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <TestCard>[
            TestCard(
              testSectionModel: testsSectionData[0],
              onTap: navigateToDiseaseTestScreen,
            ),
            TestCard(
              testSectionModel: testsSectionData[1],
              onTap: navigateToEyeTestScreen,
            ),
            TestCard(
              testSectionModel: testsSectionData[2],
              onTap: navigateToFirstAidSectionScreen,
            ),
            TestCard(
              testSectionModel: testsSectionData[3],
              onTap: navigateToFitnessSectionScreen,
            ),
            TestCard(
              testSectionModel: testsSectionData[4],
              onTap: navigatePlantScreen,
            ),
          ],
        ),
      ),
    );
  }
}

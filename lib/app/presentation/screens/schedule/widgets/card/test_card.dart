import 'package:flutter/material.dart';

import '../../../../manager/color_manager.dart';
import '../../../../manager/styles_manager.dart';
import '../../../../manager/values_manager.dart';
import '../../model/test_section_model.dart';

class TestCard extends StatelessWidget {
  const TestCard(
      {super.key,
      required this.testSectionModel,
      this.onTap,
      required this.color});

  final TestSectionModel testSectionModel;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppSize.s100,
        margin: const EdgeInsets.symmetric(
            vertical: AppSize.s14, horizontal: AppSize.s16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSize.s16),
              child:
                  Image.asset(testSectionModel.imageUrl, height: AppSize.s80),
            ),
            const SizedBox(height: AppSize.s10),
            Center(
              child: Text(
                testSectionModel.testName,
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
}

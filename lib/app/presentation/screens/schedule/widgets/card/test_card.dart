import 'package:flutter/material.dart';

import '../../../../manager/color_manager.dart';
import '../../../../manager/styles_manager.dart';
import '../../../../manager/values_manager.dart';
import '../../model/test_section_model.dart';

class TestCard extends StatelessWidget {
  const TestCard({super.key, required this.testSectionModel, this.onTap});

  final TestSectionModel testSectionModel;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppSize.s120,
        margin: const EdgeInsets.symmetric(
          horizontal: AppSize.s16,
          vertical: AppSize.s8,
        ),
        decoration: BoxDecoration(
          color: const Color(0XFFC8E9B0).withOpacity(0.6),
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSize.s18),
              child: Image.asset(testSectionModel.imageUrl, height: AppSize.s80),
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
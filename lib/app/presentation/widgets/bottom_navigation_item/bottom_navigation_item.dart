import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';

BottomNavigationBarItem bottomNavigationItem(
  String title,
  String assetName,
  int itemIndex,
  int selectedScreenIndex,
) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.only(bottom: AppSize.s4),
      child: SvgPicture.asset(
        assetName,
        height: AppSize.s24,
        color: selectedScreenIndex == itemIndex
            ? ColorManager.lightBlue
            : ColorManager.gray,
      ),
    ),
    label: title,
  );
}

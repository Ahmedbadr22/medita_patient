import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';

BottomNavigationBarItem navigatItem(
    String title, String assetName, int itemIndex, int selectedScreenIdex) {
  return BottomNavigationBarItem(
      icon: Padding(
          padding: const EdgeInsets.only(bottom: AppSize.s4),
          child: SvgPicture.asset(assetName,
              height: AppSize.s24,
              color: selectedScreenIdex == itemIndex
                  ? ColorManager.lightBlue
                  : ColorManager.gray)),
      label: title);
}

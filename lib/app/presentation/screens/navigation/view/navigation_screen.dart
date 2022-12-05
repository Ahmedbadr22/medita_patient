import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/screens/appointment/view/appointment_scree.dart';
import 'package:medita_patient/app/presentation/screens/main/view/main_screen.dart';
import 'package:medita_patient/app/presentation/screens/profile/view/profile_screen.dart';
import 'package:medita_patient/app/presentation/screens/schedule/view/schedule_screen.dart';
import 'package:medita_patient/app/presentation/widgets/bottom_navigation_item/bottom_navigation_item.dart';

import '../../articles/view/articles_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedScreen = 0;
  bool isSelected = false;
  Color selectedColor = ColorManager.lightBlue;

  List screens = const [
    MainScreen(),
    AppointmentScreen(),
    ScheduleScreen(),
    ArticlesScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: screens[selectedScreen],
      bottomNavigationBar: Container(
        height: AppSize.s70,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.s40),
                topRight: Radius.circular(AppSize.s40)
            ),
            color: ColorManager.white
        ),
        child: BottomNavigationBar(
            currentIndex: selectedScreen,
            onTap: onBottomNavItemSelected,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            items: [
              bottomNavigationItem(StringManager.home, ImageAsset.outlinedHomeSvg, 0, selectedScreen),
              bottomNavigationItem(StringManager.appointments, ImageAsset.outlinedStethoscopeSvg, 1, selectedScreen),
              bottomNavigationItem(StringManager.history, ImageAsset.outlinedClockCircleSvg, 2, selectedScreen),
              bottomNavigationItem(StringManager.articles, ImageAsset.outlinedFileTextSvg, 3, selectedScreen),
              bottomNavigationItem(StringManager.profile, ImageAsset.outlinedUserRoundedSvg, 4, selectedScreen)
            ]),
      ),
    );
  }

  void onBottomNavItemSelected(int index) {
    setState(() {
      selectedScreen = index;
    });
  }
}

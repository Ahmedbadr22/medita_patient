import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/screens/appointment/appointment_scree.dart';
import 'package:medita_patient/app/presentation/screens/articals/articals_screen.dart';
import 'package:medita_patient/app/presentation/screens/main/view/main_screen.dart';
import 'package:medita_patient/app/presentation/screens/profile/profile_screen.dart';
import 'package:medita_patient/app/presentation/screens/schedule/schedule_screen.dart';
import 'package:medita_patient/app/presentation/widgets/bottom_navigation_item/bottom_navigation_item.dart';

class NavigationSceen extends StatefulWidget {
  const NavigationSceen({super.key});

  @override
  State<NavigationSceen> createState() => _NavigationSceenState();
}

class _NavigationSceenState extends State<NavigationSceen> {
  int selectedScreen = 0;
  bool isSelected = false;
  Color selectedColor = ColorManager.lightBlue;
  List screens = const [
    MainScreen(),
    AppointmentScreen(),
    ScheduleScreen(),
    ArticalsScreen(),
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
                    topLeft:
                        Radius.circular(AppSize.s40), // adjust to your liking
                    topRight:
                        Radius.circular(AppSize.s40) // adjust to your liking
                    ),
                color: ColorManager.white // put the color here
                ),
            child: BottomNavigationBar(
                currentIndex: selectedScreen,
                onTap: (int index) {
                  setState(() {
                    selectedScreen = index;
                  });
                },
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                items: [
                  navigatItem(StringManager.home, ImageAsset.homeIcon, 0,
                      selectedScreen),
                  navigatItem(StringManager.appointments,
                      ImageAsset.calendarIcon, 1, selectedScreen),
                  navigatItem(StringManager.schedule, ImageAsset.historyIcon, 2,
                      selectedScreen),
                  navigatItem(StringManager.articles, ImageAsset.articalsIcon,
                      3, selectedScreen),
                  navigatItem(StringManager.profile, ImageAsset.personIcon, 4,
                      selectedScreen)
                ])));
  }
}

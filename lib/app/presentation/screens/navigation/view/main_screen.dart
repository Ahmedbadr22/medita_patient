import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/screens/appointment/view/appointment_scree.dart';
import 'package:medita_patient/app/presentation/screens/home/view/home_screen.dart';
import 'package:medita_patient/app/presentation/screens/navigation/viewModel/main_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/navigation/viewModel/main_screen_states.dart';
import 'package:medita_patient/app/presentation/screens/profile/view/profile_screen.dart';
import 'package:medita_patient/app/presentation/screens/schedule/view/schedule_screen.dart';
import 'package:medita_patient/app/presentation/widgets/bottom_navigation_item/bottom_navigation_item.dart';

import '../../articles/view/articles_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainScreenCubit mainScreenCubit = MainScreenCubit.get(context);

    List screens = [
      const HomeScreen(),
      const AppointmentScreen(),
      ScheduleScreen(),
      const ArticlesScreen(),
      const ProfileScreen()
    ];

    return BlocConsumer<MainScreenCubit, MainScreenState>(
        listener: (_, __) {},
        builder: (_, __) {
          return Scaffold(
            backgroundColor: ColorManager.white,
            body: screens[mainScreenCubit.currentScreen],
            bottomNavigationBar: Container(
              height: AppSize.s70,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.s40),
                  topRight: Radius.circular(AppSize.s40),
                ),
                color: ColorManager.white,
              ),
              child: BottomNavigationBar(
                  currentIndex: mainScreenCubit.currentScreen,
                  onTap: mainScreenCubit.onBottomNavItemSelected,
                  backgroundColor: Colors.transparent,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    bottomNavigationItem(
                      StringManager.home,
                      ImageAsset.outlinedHomeSvg,
                      0,
                      mainScreenCubit.currentScreen,
                    ),
                    bottomNavigationItem(
                      StringManager.appointments,
                      ImageAsset.outlinedStethoscopeSvg,
                      1,
                      mainScreenCubit.currentScreen,
                    ),
                    bottomNavigationItem(
                      StringManager.history,
                      ImageAsset.outlinedClockCircleSvg,
                      2,
                      mainScreenCubit.currentScreen,
                    ),
                    bottomNavigationItem(
                      StringManager.articles,
                      ImageAsset.outlinedFileTextSvg,
                      3,
                      mainScreenCubit.currentScreen,
                    ),
                    bottomNavigationItem(
                      StringManager.profile,
                      ImageAsset.outlinedUserRoundedSvg,
                      4,
                      mainScreenCubit.currentScreen,
                    )
                  ]),
            ),
          );
        });
  }
}

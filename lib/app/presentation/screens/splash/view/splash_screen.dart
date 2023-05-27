import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/routes_manager.dart';
import 'package:medita_patient/app/presentation/screens/splash/cubit/splash_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/splash/cubit/splash_screen_state.dart';
import '../../../manager/values_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashScreenCubit cubit = SplashScreenCubit.get(context);

    /// navigate to the onBoardingScreen
    void navigateToOnBoarding() {
      Navigator.popAndPushNamed(context, Routes.onBoardingRoute);
    }

    void navigateToMain() {
      Navigator.popAndPushNamed(context, Routes.navigationRoute);
    }

    Brightness brightness = MediaQuery.of(context).platformBrightness;

    return BlocConsumer<SplashScreenCubit, SplashScreenState>(
      listener: (_, SplashScreenState state) {
        if (state is SplashScreenIsAuthenticatedState) {
          navigateToMain();
        } else if (state is SplashScreenNotAuthenticatedState) {
          navigateToOnBoarding();
        }
      },
      builder: (_, __) {
        return Scaffold(
          appBar: AppBar(),
          backgroundColor: Theme.of(context).backgroundColor,
          body: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Expanded>[
                Expanded(
                  flex: 3,
                  child: Center(
                    child: SvgPicture.asset(
                      brightness == Brightness.dark
                          ? ImageAsset.whiteLogoImagePath
                          : ImageAsset.blackLogoImagePath,
                      width: AppSize.splashLogoWidth,
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Center(
                    child: SizedBox(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

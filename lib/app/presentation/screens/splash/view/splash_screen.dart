import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/routes_manager.dart';
import '../../../manager/values_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  /// start splash timer and after finish navigate to the OnBoardingScreen
  void _startDelay() {
    _timer = Timer(const Duration(seconds: TimeValue.splashScreenDelayTime), _navigateToOnBoarding);
  }

  /// navigate to the onBoardingScreen
  void _navigateToOnBoarding() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Expanded> [
            Expanded(
              flex: 3,
              child: Center(
                child: SvgPicture.asset(
                  brightness == Brightness.dark ? ImageAsset.whiteLogoImagePath : ImageAsset.blackLogoImagePath,
                  width: AppSize.splashLogoWidth,
                ),
              )
            ),
            const Expanded(
              flex: 1,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

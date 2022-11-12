import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/screens/on_boarding/view/on_boarding_screen.dart';
import 'package:medita_patient/app/presentation/screens/splash/view/splash_screen.dart';

class Routes {
  static const splashRoute = "/";
  static const onBoardingRoute = "/onBoarding";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute :
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingRoute :
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      default :
        return MaterialPageRoute(builder: (_) => unDefinedRoute());
    }
  }

  static Scaffold unDefinedRoute() => Scaffold(
    appBar: AppBar(),
    body: const Center(
      child: Text(StringManager.unDefinedText),
    ),
  );
}
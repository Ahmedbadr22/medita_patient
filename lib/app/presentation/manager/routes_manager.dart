import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/screens/main/view/main_screen.dart';
import 'package:medita_patient/app/presentation/screens/on_boarding/view/on_boarding_screen.dart';
import 'package:medita_patient/app/presentation/screens/sign_in/view/sign_in_screen.dart';
import 'package:medita_patient/app/presentation/screens/sign_up/view/sign_up_screen.dart';
import 'package:medita_patient/app/presentation/screens/splash/view/splash_screen.dart';

import '../screens/authentication/view/authentication_screen.dart';

class Routes {
  static const splashRoute = "/";
  static const onBoardingRoute = "/onBoarding";
  static const authenticationRoute = "/authentication";
  static const signInRoute = "/sign-in";
  static const signUpRoute = "/sign-up";
  static const mainRoute = "/main";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute :
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingRoute :
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.authenticationRoute :
        return MaterialPageRoute(builder: (_) => const AuthenticationScreen());
      case Routes.signInRoute :
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.signUpRoute :
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.mainRoute :
        return MaterialPageRoute(builder: (_) => const MainScreen());
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
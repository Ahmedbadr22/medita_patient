import 'package:flutter/material.dart';
import 'package:medita_patient/app/app/di.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';

import '../screens/appointment/view/appointment_scree.dart';
import '../screens/articles/view/articles_screen.dart';
import '../screens/authentication/view/authentication_screen.dart';
import '../screens/main/view/main_screen.dart';
import '../screens/navigation/view/navigation_screen.dart';
import '../screens/near_hospitals_screen/view/near_hospitals_screen.dart';
import '../screens/on_boarding/view/on_boarding_screen.dart';
import '../screens/profile/view/profile_screen.dart';
import '../screens/schedule/view/schedule_screen.dart';
import '../screens/sign_in/view/sign_in_screen.dart';
import '../screens/sign_up/view/sign_up_screen.dart';
import '../screens/splash/view/splash_screen.dart';

class Routes {
  static const splashRoute = "/";
  static const onBoardingRoute = "/onBoarding";
  static const authenticationRoute = "/authentication";
  static const signInRoute = "/sign-in";
  static const signUpRoute = "/sign-up";
  static const mainRoute = "/main";
  static const eyeSectionRoute = "/eyeSectionRoute";
  static const navigationRoute = "/navigationRoute";
  static const appointmentRoute = "/appointmentRoute";
  static const scheduleRoute = "/scheduleRoute";
  static const articlesRoute = "/articlesRoute";
  static const profileRoute = "/profileRoute";
  static const nearHospitals = "/nearHospitals";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) =>  OnBoardingScreen());
      case Routes.authenticationRoute:
        return MaterialPageRoute(builder: (_) => const AuthenticationScreen());
      case Routes.signInRoute:
        return MaterialPageRoute(
          builder: (_) {
            initLoginModule();
            return SignInScreen();
          },
        );
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.navigationRoute:
        return MaterialPageRoute(builder: (_) => const NavigationScreen());
      case Routes.appointmentRoute:
        return MaterialPageRoute(builder: (_) => const AppointmentScreen());
      case Routes.scheduleRoute:
        return MaterialPageRoute(builder: (_) => const ScheduleScreen());
      case Routes.articlesRoute:
        return MaterialPageRoute(builder: (_) => const ArticlesScreen());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.nearHospitals:
        return MaterialPageRoute(builder: (_) => const NearHospitalsScreen());
      default:
        return MaterialPageRoute(builder: (_) => unDefinedRoute());
    }
  }

  static Scaffold unDefinedRoute() =>
      Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text(StringManager.unDefinedText),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:medita_patient/app/app/di.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/screens/appointment/view/appointment_detail_screen.dart';
import 'package:medita_patient/app/presentation/screens/article_detail/view/article_detail.dart';
import 'package:medita_patient/app/presentation/screens/book_appointment/screen/book_appointment_screen.dart';
import 'package:medita_patient/app/presentation/screens/bookmarks/view/article_bookmarks_screen.dart';
import 'package:medita_patient/app/presentation/screens/doctor_detail/view/doctor_detail_screen.dart';
import 'package:medita_patient/app/presentation/screens/favorite_doctors/view/favorite_doctors_screen.dart';
import 'package:medita_patient/app/presentation/screens/specialities/view/specialities_screen.dart';
import 'package:medita_patient/app/presentation/screens/speciality/view/speciality_screen.dart';

import '../screens/appointment/view/appointment_scree.dart';
import '../screens/articles/view/articles_screen.dart';
import '../screens/authentication/view/authentication_screen.dart';
import '../screens/navigation/view/main_screen.dart';
import '../screens/near_hospitals_screen/view/near_hospitals_screen.dart';
import '../screens/on_boarding/view/on_boarding_screen.dart';
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
  static const articleDetailRoute = "/articleDetailRoute";
  static const articlesBookmarkRoute = "/articlesBookmarkRoute";
  static const profileRoute = "/profileRoute";
  static const nearHospitals = "/nearHospitals";
  static const specialitiesRoute = "/specialitiesRoute";
  static const specialityRoute = "/specialityRoute";
  static const doctorDetailRoute = "/doctorDetailRoute";
  static const favoriteDoctors = "/favoriteDoctors";
  static const bookAppointmentScreenRoute = "/bookAppointmentScreenRoute";
  static const appointmentDetailScreenRoute = "/appointmentDetailScreenRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        {
          initSplashScreen();
          return MaterialPageRoute(builder: (_) => const SplashScreen());
        }
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
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
        return MaterialPageRoute(builder: (_) {
          initRegistrationModule();
          return SignUpScreen();
        });
      case Routes.navigationRoute:
        {
          initMainScreenModule();
          return MaterialPageRoute(builder: (_) => const MainScreen());
        }
      case Routes.specialitiesRoute:
        {
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const SpecialitiesScreen(),
          );
        }
      case Routes.specialityRoute:
        {
          initSpecialityModule();
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const SpecialityScreen(),
          );
        }
      case Routes.doctorDetailRoute:
        {
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const DoctorDetailScreen(),
          );
        }
      case Routes.favoriteDoctors:
        {
          initFavoriteDoctorsModule();
          return MaterialPageRoute(
              builder: (_) => const FavoriteDoctorsScreen());
        }
      case Routes.appointmentRoute:
        return MaterialPageRoute(builder: (_) => const AppointmentScreen());
      case Routes.scheduleRoute:
        return MaterialPageRoute(builder: (_) => const ScheduleScreen());
      case Routes.articlesRoute:
        {
          initArticlesScreenModule();
          return MaterialPageRoute(builder: (_) => const ArticlesScreen());
        }
      case Routes.articleDetailRoute:
        {
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const ArticleDetailScreen(),
          );
        }
      case Routes.articlesBookmarkRoute:
        {
          initArticlesBookmarksScreenModule();
          return MaterialPageRoute(
            builder: (_) => const ArticlesBookmarksScreen(),
          );
        }
      case Routes.nearHospitals:
        return MaterialPageRoute(builder: (_) {
          initListNearHospitalsModule();
          return const NearHospitalsScreen();
        });
      case Routes.bookAppointmentScreenRoute:
        initBookAppointmentModule();
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const BookAppointmentScreen(),
        );
      case Routes.appointmentDetailScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AppointmentDetailScreen(),
        );
      default:
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

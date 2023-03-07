import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/app/di.dart';
import 'package:medita_patient/app/domain/use_cases/appointment/list_user_appointments_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/article/list_most_liked_articles_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/banner/get_all_banners_usecase.dart';
import 'package:medita_patient/app/domain/use_cases/category/list_article_categories_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/doctor/list_doctors_by_speciality_id_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/doctor/list_user_favorite_doctors_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/hospital/list_near_hospitals.dart';
import 'package:medita_patient/app/domain/use_cases/login/login_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/token/get_local_token_use_case.dart';
import 'package:medita_patient/app/presentation/manager/routes_manager.dart';
import 'package:medita_patient/app/presentation/manager/theme_manager.dart';
import 'package:medita_patient/app/presentation/screens/appointment/cubit/appointment_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/articles/cubit/articles_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/bookmarks/cubit/article_bookmarls_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/favorite_doctors/cubit/favorite_doctors_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/home/view_model/home_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/navigation/viewModel/main_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/near_hospitals_screen/cubit/near_hospitals_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/on_boarding/cubit/on_boarding_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/sign_in/cubit/sign_in_cubit.dart';
import 'package:medita_patient/app/presentation/screens/sign_up/cubit/sign_up_cubit.dart';
import 'package:medita_patient/app/presentation/screens/speciality/cubit/SpecialityScreenCubit.dart';
import 'package:medita_patient/app/presentation/screens/splash/cubit/splash_screen_cubit.dart';

import '../domain/use_cases/article/list_user_bookmarks_articles.dart';
import '../domain/use_cases/registration/registration_use_case.dart';
import '../domain/use_cases/specialty/list_specialties_use_case.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashScreenCubit(diInstance<GetLocalTokenUseCase>())..init()),
        BlocProvider(create: (_) => OnBoardingScreenCubit()..init()),
        BlocProvider(create: (_) => SignInCubit(diInstance<LoginUseCase>())),
        BlocProvider(create: (_) => SignUpCubit(diInstance<RegisterUseCase>())),
        BlocProvider(create: (_) => MainScreenCubit()),
        BlocProvider(
          create: (_) {
            return ArticleScreenCubit(diInstance<ListMostLikedArticlesUseCase>(), diInstance<ListArticleCategoriesUseCase>())..init();
          },
        ),
        BlocProvider(
          create: (_) {
            return ArticlesBookMarksScreenCubit(diInstance<ListUserBookmarksArticlesUseCase>())..init();
          },
        ),
        BlocProvider(
          create: (_) {
            return HomeScreenCubit(
              diInstance<GetAllBannersUseCase>(),
              diInstance<ListSpecialtiesUseCase>(),
              diInstance<ListNearHospitalsUseCase>(),
            )..init();
          },
        ),
        BlocProvider(
          create: (_) {
            return NearHospitalsScreenCubit(
                diInstance<ListNearHospitalsUseCase>())
              ..init();
          },
        ),
        BlocProvider(create: (_) => SpecialityScreenCubit(diInstance<ListDoctorsBySpecialityIdUseCase>())),
        BlocProvider(create: (_) => AppointmentScreenCubit(diInstance<ListUserAppointmentsUseCase>())..init()),
        BlocProvider(create: (_) => FavoriteDoctorsScreenCubit(diInstance<ListUserFavoriteDoctorsUseCase>())..init()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
        theme: getApplicationLightTheme(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/api/cubits/card_cubit/card_data_cubit.dart';
import 'package:medita_patient/api/cubits/hospital_cubit/hospital_cubit.dart';
import 'package:medita_patient/api/cubits/specialty_cubit/specialty_cubit.dart';
import 'package:medita_patient/app/app/di.dart';
import 'package:medita_patient/app/domain/use_cases/hospital/list_near_hospitals.dart';
import 'package:medita_patient/app/domain/use_cases/login/login_use_case.dart';
import 'package:medita_patient/app/presentation/manager/routes_manager.dart';
import 'package:medita_patient/app/presentation/manager/theme_manager.dart';
import 'package:medita_patient/app/presentation/screens/near_hospitals_screen/cubit/near_hospitals_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/on_boarding/cubit/on_boarding_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/sign_in/cubit/sign_in_cubit.dart';
import 'package:medita_patient/app/presentation/screens/sign_up/cubit/sign_up_cubit.dart';

import '../domain/use_cases/registration/registration_use_case.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CardDataCubit()),
        BlocProvider(create: (_) => SpecialtyCubit()),
        BlocProvider(create: (_) => HospitalDataCubit()),
        BlocProvider(create: (_) => OnBoardingScreenCubit()..init()),
        BlocProvider(create: (_) => SignInCubit(diInstance<LoginUseCase>())),
        BlocProvider(create: (_) => SignUpCubit(diInstance<RegisterUseCase>())),
        BlocProvider(
            create: (_) =>
                NearHospitalsScreenCubit(diInstance<ListNearHospitalsUseCase>())
                  ..init()),
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

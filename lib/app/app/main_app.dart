import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/app/di.dart';
import 'package:medita_patient/app/domain/use_cases/login_use_case.dart';
import 'package:medita_patient/app/presentation/manager/routes_manager.dart';
import 'package:medita_patient/app/presentation/manager/theme_manager.dart';
import 'package:medita_patient/app/presentation/screens/on_boarding/cubit/on_boarding_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/sign_in/cubit/sign_in_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => OnBoardingScreenCubit()..init()),
        BlocProvider(create: (_) => SignInCubit(instance<LoginUseCase>())),
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

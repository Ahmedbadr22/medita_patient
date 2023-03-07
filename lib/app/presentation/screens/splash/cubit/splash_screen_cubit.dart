import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/domain/use_cases/token/get_local_token_use_case.dart';
import 'package:medita_patient/app/presentation/screens/splash/cubit/splash_screen_state.dart';
import '../../../manager/values_manager.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  late final GetLocalTokenUseCase _getLocalTokenUseCase;
  late final Timer _timer;

  SplashScreenCubit(this._getLocalTokenUseCase) : super(SplashScreenInitState());
  bool isAuthenticated = false;

  init() {
    _timer = Timer(const Duration(seconds: TimeValue.splashScreenDelayTime), checkAuthentication);
  }

  static SplashScreenCubit get(BuildContext context) => BlocProvider.of(context);


  void checkAuthentication() {
    isAuthenticated = _getLocalTokenUseCase.execute() != null;
    if (isAuthenticated) {
      emit(SplashScreenIsAuthenticatedState());
    } else {
      emit(SplashScreenNotAuthenticatedState());
    }
  }


  void dispose() {
    _timer.cancel();
  }
}
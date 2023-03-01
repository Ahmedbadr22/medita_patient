
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/presentation/screens/navigation/viewModel/main_screen_states.dart';


class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenInitState());

  static MainScreenCubit get(BuildContext context) => BlocProvider.of(context);

  int currentScreen = 0;

  void onBottomNavItemSelected(int index) {
    currentScreen = index;
    emit(MainScreenBottomBarItemChangedState());
  }
}
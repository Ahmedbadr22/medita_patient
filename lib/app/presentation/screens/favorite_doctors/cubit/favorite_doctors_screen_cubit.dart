import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/data/models/data/doctor/favorite_doctor.dart';
import 'package:medita_patient/app/presentation/screens/favorite_doctors/cubit/favorite_doctors_screen_state.dart';

import '../../../../data/models/data/failure/auth/auth_failure.dart';
import '../../../../domain/use_cases/doctor/list_user_favorite_doctors_use_case.dart';

class FavoriteDoctorsScreenCubit extends Cubit<FavoriteDoctorsScreenState> {
  late final ListUserFavoriteDoctorsUseCase _listUserFavoriteDoctorsUseCase;

  FavoriteDoctorsScreenCubit(this._listUserFavoriteDoctorsUseCase) : super(FavoriteDoctorsScreenInitState());


  static FavoriteDoctorsScreenCubit get(BuildContext context) => BlocProvider.of(context);

  List<FavoriteDoctor> favoriteDoctors = [];


  init() {
    loadFavoriteDoctors();
  }


  void loadFavoriteDoctors() async {
    Either<Failure, List<FavoriteDoctor>> result = await _listUserFavoriteDoctorsUseCase.execute();
    result.fold((failure) => {

    }, (data) => {
      favoriteDoctors = data,
      emit(FavoriteDoctorsScreenSuccessState()),
    });
  }
}
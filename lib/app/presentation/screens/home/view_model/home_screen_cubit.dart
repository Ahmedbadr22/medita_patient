import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/domain/use_cases/hospital/list_near_hospitals.dart';
import 'package:medita_patient/app/domain/use_cases/specialty/list_specialties_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/token/get_local_token_use_case.dart';
import 'package:medita_patient/app/presentation/screens/home/view_model/home_screen_states.dart';

import '../../../../data/models/data/banner/banner.dart';
import '../../../../data/models/data/failure/auth/auth_failure.dart';
import '../../../../data/models/data/hospital/hospital.dart';
import '../../../../data/models/data/speciality/speciality.dart';
import '../../../../data/models/data/token.dart';
import '../../../../domain/use_cases/banner/get_all_banners_usecase.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  static HomeScreenCubit get(BuildContext context) => BlocProvider.of(context);

  final GetAllBannersUseCase _getAllBannersUseCase;
  final ListSpecialtiesUseCase _listSpecialtiesUseCase;
  final ListNearHospitalsUseCase _listNearHospitalsUseCase;

  bool isSpecialitiesLoaded = false;

  HomeScreenCubit(
    this._getAllBannersUseCase,
    this._listSpecialtiesUseCase,
    this._listNearHospitalsUseCase,
  ) : super(HomeScreenInitState());

  List<MedicalBanner> banners = [];
  List<Speciality> specialities = [];
  List<Hospital> hospitals = [];

  init() {
    listBanners();
    listSpecialties();
    listNearHospitals();
  }

  double getSpecialitiesGridHeight() {
    double itemHeight = 90.0;
    double rowCountRatio = specialities.length / 4;

    int rowCount = rowCountRatio.toInt();
    if (rowCountRatio > rowCount) {
      rowCount++;
    }
    return rowCount * itemHeight;
  }

  void listBanners() async {
    Either<Failure, List<MedicalBanner>> result =
        await _getAllBannersUseCase.execute();
    result.fold((failure) {
      if (kDebugMode) {
        print("===> Fail ${failure.message}");
      }
    }, (data) => {banners = data, emit(HomeScreenSuccessGetAllBannersState())});
  }

  void listSpecialties() async {
    Either<Failure, List<Speciality>> result =
        await _listSpecialtiesUseCase.execute();
    result.fold((failure) {
      if (kDebugMode) {
        print("===> Fail ${failure.message}");
      }
      isSpecialitiesLoaded = true;
    }, (data) {
      specialities = data;
      isSpecialitiesLoaded = true;
      emit(HomeScreenSuccessGetSpecialitiesState());
    });
  }

  /// Execute the api call and get the hospitals list
  void listNearHospitals() async {
    Either<Failure, List<Hospital>> response =
        await _listNearHospitalsUseCase.execute();
    response.fold((failure) {
      if (kDebugMode) {
        print("===> Fail ${failure.message}");
      }
    }, (hospitalsList) {
      hospitals = hospitalsList;
    });
    emit(HomeScreenSuccessGetHospitalsState());
  }
}

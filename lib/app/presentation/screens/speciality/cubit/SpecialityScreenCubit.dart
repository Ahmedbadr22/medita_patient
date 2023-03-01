
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/data/doctor/doctor.dart';
import '../../../../data/models/data/failure/auth/auth_failure.dart';
import '../../../../domain/use_cases/doctor/list_doctors_by_speciality_id_use_case.dart';
import 'SpecialityScreenState.dart';

class SpecialityScreenCubit extends Cubit<SpecialityScreenState> {
  final ListDoctorsBySpecialityIdUseCase _listDoctorsBySpecialityIdUseCase;

  SpecialityScreenCubit(this._listDoctorsBySpecialityIdUseCase) : super(SpecialityScreenInitState());

  static SpecialityScreenCubit get(BuildContext context) => BlocProvider.of(context);

  bool isLoading = false;

  List<Doctor> doctors = [];

  listDoctorsBySpecialityId(int id) async {
    isLoading = true;
    emit(SpecialityScreenDoctorLoadingChangeState());
    Either<Failure, List<Doctor>> result = await _listDoctorsBySpecialityIdUseCase.execute(id);

    result.fold((failure) {
      if (kDebugMode) {
        print("===> Fail ${failure.message}");
      }
      isLoading = false;
    }, (data) => {
      doctors = data,
      isLoading = false,
      emit(SpecialityScreenDoctorLoadingChangeState())
    });
  }
}
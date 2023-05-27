import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/presentation/screens/schedule/screens/disease_test_screen/cubit/disease_test_state.dart';

import '../../../../../../data/data_sources/remote/classification/classification_remote_data_source.dart';
import '../../../../../../data/models/data/failure/auth/auth_failure.dart';
import '../../../../../../domain/use_cases/classification/classify_brain_disease_usecase.dart';
import '../../../../../../domain/use_cases/classification/classify_stomach_disease_usecase.dart';
import '../model/disease_category.dart';

class DiseaseTestCubit extends Cubit<DiseaseTestState> {
  final ClassifyStomachDiseaseUseCase _classifyStomachDiseaseUseCase;
  final ClassifyBrainDiseaseUseCase _classifyBrainDiseaseUseCase;

  DiseaseTestCubit(this._classifyStomachDiseaseUseCase, this._classifyBrainDiseaseUseCase) : super(MainState());

  static DiseaseTestCubit get(BuildContext context) => BlocProvider.of(context);

  List<DiseaseCategory> diseaseCategories = [
    DiseaseCategory("Stomach", DiseaseType.stomach),
    DiseaseCategory("Brain", DiseaseType.brain),
  ];

  DiseaseType selectedDiseaseType = DiseaseType.stomach;
  File? selectedDiseaseImage;

  void onChangeSelectedDiseaseType(dynamic type) async {
    if (type is DiseaseType) {
      selectedDiseaseType = type;
      emit(SelectedDiseaseChange());
    }
  }

  void onChangeSelectedDiseaseImage(File image) {
    selectedDiseaseImage = image;
    emit(SelectedDiseaseImageChange());
  }

  void onSubmitTest() async {
    if (selectedDiseaseImage == null) {
      return;
    }

    emit(LoadingState(loading: true));

    List<int> imageBytes = selectedDiseaseImage!.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);

    Either<Failure, ClassificationResponse> result;

    if (selectedDiseaseType == DiseaseType.stomach) {
      result = await _classifyStomachDiseaseUseCase.execute(base64Image);
    } else {
      result = await _classifyBrainDiseaseUseCase.execute(base64Image);
    }

    result.fold((fail) {
      
    }, (ClassificationResponse data) => {
      emit(DiseasePredictionState(data))
    });
  }
}

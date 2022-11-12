import 'dart:async';

import 'package:medita_patient/app/base/base_view_model.dart';
import 'package:medita_patient/app/data/models/on_boarding_data_model.dart';
import 'package:medita_patient/app/data/models/on_boarding_screen_object.dart';
import '../../../manager/asset_manager.dart';
import '../../../manager/string_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  int _currentOnBoardingIndex = 0;
  final StreamController _streamController =
      StreamController<OnBoardingScreenObject>();
  late List<OnBoardingDataModel> _onBoardingItemsList;

  List<OnBoardingDataModel> _getOnBoardingModelList() => [
        OnBoardingDataModel(
            title: StringManager.onBoarding1Title,
            text: StringManager.onBoarding1Text,
            imagePath: ImageAsset.onBoardingImage1),
        OnBoardingDataModel(
            title: StringManager.onBoarding2Title,
            text: StringManager.onBoarding2Text,
            imagePath: ImageAsset.onBoardingImagePath3),
        OnBoardingDataModel(
            title: StringManager.onBoarding3Title,
            text: StringManager.onBoarding3Text,
            imagePath: ImageAsset.onBoardingImage4),
      ];

  /// this function send the OnBoarding Screen Data to the view
  void _postDataToScreen() {
    OnBoardingScreenObject onBoardingScreenObject = OnBoardingScreenObject(
      _onBoardingItemsList,
      _onBoardingItemsList.length,
      _currentOnBoardingIndex,
    );
    inputOnBoardingScreenObject.add(onBoardingScreenObject);
  }

  @override
  void start() {
    _onBoardingItemsList = _getOnBoardingModelList();
    _postDataToScreen();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void onNext() {
    // TODO: implement onNext
  }

  @override
  void onPageChanged(int? index) {
    _currentOnBoardingIndex = index!;
    _postDataToScreen();
  }

  @override
  Sink get inputOnBoardingScreenObject => _streamController.sink;

  @override
  Stream<OnBoardingScreenObject> get outputOnBoardingScreenObject =>
      _streamController.stream
          .map((onBoardingScreenObject) => onBoardingScreenObject);
}

abstract class OnBoardingViewModelInputs {
  /// on Next Action Called
  void onNext();

  /// Update current OnBoardingItem index at given [index]
  void onPageChanged(int? index);

  /// input sink
  Sink get inputOnBoardingScreenObject;
}

abstract class OnBoardingViewModelOutputs {
  /// Output sink
  Stream<OnBoardingScreenObject> get outputOnBoardingScreenObject;
}

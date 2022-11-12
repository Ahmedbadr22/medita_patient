import 'package:medita_patient/app/data/models/on_boarding_data_model.dart';

class OnBoardingScreenObject {
  // OnBoardingDataModel onBoardingDataModel;
  List<OnBoardingDataModel> onBoardingDataObjectList;
  int numberOfOnBoardingItems;
  int currentOnBoardingItemIndex;

  OnBoardingScreenObject(
    // this.onBoardingDataModel,
      this.onBoardingDataObjectList,
    this.numberOfOnBoardingItems,
    this.currentOnBoardingItemIndex,
  );
}

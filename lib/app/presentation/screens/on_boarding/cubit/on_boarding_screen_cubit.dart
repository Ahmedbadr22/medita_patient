import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/presentation/screens/on_boarding/cubit/on_boarding_screen_states.dart';

import '../../../../data/models/ui/on_boarding_data_model.dart';
import '../../../manager/asset_manager.dart';
import '../../../manager/routes_manager.dart';
import '../../../manager/string_manager.dart';

class OnBoardingScreenCubit extends Cubit<OnBoardingScreenState> {
  OnBoardingScreenCubit() : super(OnBoardingScreenInitState());

  static OnBoardingScreenCubit get(BuildContext context) => BlocProvider.of(context);

  /// the current on Boarding Page Index
  int currentOnBoardingPageIndex = 0;

  /// onBoardingItemList
  late List<OnBoardingPageItemData> onBoardingPageItemDataList;

  /// this method called in the init of the caller
  /// to initialize [onBoardingPageItemDataList]
  void init() {
    onBoardingPageItemDataList = [
      OnBoardingPageItemData(
        title: StringManager.onBoarding1Title,
        text: StringManager.onBoarding1Text,
        imagePath: ImageAsset.onBoardingImage1,
      ),
      OnBoardingPageItemData(
        title: StringManager.onBoarding2Title,
        text: StringManager.onBoarding2Text,
        imagePath: ImageAsset.onBoardingImagePath3,
      ),
      OnBoardingPageItemData(
        title: StringManager.onBoarding3Title,
        text: StringManager.onBoarding3Text,
        imagePath: ImageAsset.onBoardingImage4,
      ),
    ];
    emit(PostOnBoardingModelItemListState(onBoardingPageItemDataList));
  }

  /// this function executed when the OnBoardingItemPage Scrolled or Changed
  /// to change the [currentOnBoardingPageIndex] variable
  /// then emit the state
  void onOnBoardingPageItemChanged(int? index) {
    currentOnBoardingPageIndex = index!;
    emit(OnBoardingPageItemChangeState());
  }

  /// this function return the length of the [onBoardingPageItemDataList]
  int onBoardingModelItemListCount() => onBoardingPageItemDataList.length;

  /// navigate to the Authentication Screen
  /// by passing [context] the BuildContext of the Screen
  void navigateToAuthenticationScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.authenticationRoute);
  }
}
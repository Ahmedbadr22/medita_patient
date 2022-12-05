import 'package:flutter/material.dart';

import '../../../../data/models/on_boarding_data_model.dart';

@immutable
abstract class OnBoardingScreenState {}

class OnBoardingScreenInitState extends OnBoardingScreenState {}
class PostOnBoardingModelItemListState extends OnBoardingScreenState {
  final List<OnBoardingPageItemData> onBoardingModelItemList;

  PostOnBoardingModelItemListState(this.onBoardingModelItemList);
}

class OnBoardingPageItemChangeState extends OnBoardingScreenState {}
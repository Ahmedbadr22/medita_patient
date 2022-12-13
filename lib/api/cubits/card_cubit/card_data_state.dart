import 'package:medita_patient/api/models/card_data_model.dart';

abstract class CardDataState {}

class CardDataSuccess extends CardDataState {
  final List<CardDataModel>? listOfCards;
  CardDataSuccess(this.listOfCards);
}

class CardDataInitial extends CardDataState {}

class CardDataLoading extends CardDataState {}

class CardDataFailure extends CardDataState {
  final Exception? error;
  CardDataFailure(this.error);
}

class CardDataNotFound extends CardDataState {}

class CardDataNotInternetConnection extends CardDataState {}

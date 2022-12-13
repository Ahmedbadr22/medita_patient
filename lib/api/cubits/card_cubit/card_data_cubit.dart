import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/api/cubits/card_cubit/card_data_state.dart';
import 'package:medita_patient/api/models/card_data_model.dart';
import 'package:medita_patient/api/repository/card_data_repository.dart';

class CardDataCubit extends Cubit<CardDataState> {
  CardDataCubit() : super(CardDataInitial());

  void getCardData() async {
    try {
      emit(CardDataLoading());
      final List<CardDataModel> listOfCards =
          await CardRepository().getCardData();
      emit(CardDataSuccess(listOfCards));
    } on Exception catch (error) {
      emit(CardDataFailure(error));
    }
  }
}

import 'package:dio/dio.dart';
import 'package:medita_patient/api/models/card_data_model.dart';

class CardRepository {
  Future<List<CardDataModel>> getCardData() async {
    final response = await Dio()
        .get('https://6081-154-239-215-52.eu.ngrok.io/clinic/list-banners');

    final List<CardDataModel> listOfCards =
        List<CardDataModel>.from(response.data.map((element) {
      return CardDataModel(
          id: element['id'],
          body: element['body'],
          image: element['image'],
          title: element['title']);
    }));
    return listOfCards;
  }
}

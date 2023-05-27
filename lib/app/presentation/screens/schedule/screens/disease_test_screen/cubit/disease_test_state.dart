import 'package:medita_patient/app/data/data_sources/remote/classification/classification_remote_data_source.dart';

abstract class DiseaseTestState {
  ClassificationResponse? prediction ;
  DiseaseTestState({this.prediction});
}
class MainState extends DiseaseTestState {}
class SelectedDiseaseChange extends DiseaseTestState {}
class SelectedDiseaseImageChange extends DiseaseTestState {}
class LoadingState extends DiseaseTestState {
  bool loading;

  LoadingState({this.loading = false});
}
class DiseasePredictionState extends DiseaseTestState {
  DiseasePredictionState(ClassificationResponse prediction) : super(prediction: prediction);
}


import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/repositories/classification/classification_repository.dart';

import '../../../data/data_sources/remote/classification/classification_remote_data_source.dart';
import '../../../data/models/data/failure/auth/auth_failure.dart';

class ClassifyStomachDiseaseUseCase {

  final ClassificationRepository _classificationRepository;

  ClassifyStomachDiseaseUseCase(this._classificationRepository);

  Future<Either<Failure, ClassificationResponse>> execute(String encodedImage) async {
    return _classificationRepository.classifyStomachImage(encodedImage);
  }

}
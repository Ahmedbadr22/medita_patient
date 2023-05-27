

import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/repositories/classification/classification_repository.dart';

import '../../../data/data_sources/remote/classification/classification_remote_data_source.dart';
import '../../../data/models/data/failure/auth/auth_failure.dart';

class ClassifyBrainDiseaseUseCase {

  final ClassificationRepository _classificationRepository;

  ClassifyBrainDiseaseUseCase(this._classificationRepository);

  Future<Either<Failure, ClassificationResponse>> execute(String encodedImage) async {
    return _classificationRepository.classifyBrainImage(encodedImage);
  }

}
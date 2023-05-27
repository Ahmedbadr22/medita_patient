
import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/data_sources/remote/classification/classification_remote_data_source.dart';

import '../../models/data/failure/auth/auth_failure.dart';

class ClassificationRepository {

  final ClassificationRemoteDataSource _remoteDataSource;

  ClassificationRepository(this._remoteDataSource);

  Future<Either<Failure, ClassificationResponse>> classifyStomachImage(String encodedImage) async {
    return _remoteDataSource.classifyStomachImage(encodedImage);
  }

  Future<Either<Failure, ClassificationResponse>> classifyBrainImage(String encodedImage) async {
    return _remoteDataSource.classifyBrainImage(encodedImage);
  }
}
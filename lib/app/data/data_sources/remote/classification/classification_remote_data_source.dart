import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medita_patient/app/app/constants.dart';
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';

class ClassificationResponse {
  String label;
  double accuracy;

  ClassificationResponse(this.label, this.accuracy);

  factory ClassificationResponse.fromList(List<dynamic> response) {
    double accuracy = double.parse(response[1].toString());
    accuracy = accuracy * 100.0;
    String label = response[0].toString();
    return ClassificationResponse(label, accuracy);
  }
}

class ClassificationRemoteDataSource {
  final Dio _dio;

  ClassificationRemoteDataSource(this._dio);

  Future<Either<Failure, ClassificationResponse>> classifyStomachImage(String encodedImage) async {
    _dio.options.baseUrl = ApiConstants.stomachDiseasePredictUrl;

    try {
      Response response = await _dio.post(
        "",
        data: {
          "data": [
            "data:image/jpeg;base64,$encodedImage",
          ]
        },
      );

      List<dynamic> data =  response.data["data"];
      return Right(ClassificationResponse.fromList(data));

    } on DioError catch (e) {
      return Left(Failure(0, e.message));
    } on Exception catch (e) {
      return Left(Failure(0, e.toString()));
    }
  }

  Future<Either<Failure, ClassificationResponse>> classifyBrainImage(String encodedImage) async {
    _dio.options.baseUrl = ApiConstants.brainDiseasePredictUrl;

    try {
      Response response = await _dio.post(
        "",
        data: {
          "data": [
            "data:image/jpeg;base64,$encodedImage",
          ]
        },
      );

      List<dynamic> data =  response.data["data"];
      return Right(ClassificationResponse.fromList(data));

    } on DioError catch (e) {
      return Left(Failure(0, e.message));
    } on Exception catch (e) {
      return Left(Failure(0, e.toString()));
    }
  }
}

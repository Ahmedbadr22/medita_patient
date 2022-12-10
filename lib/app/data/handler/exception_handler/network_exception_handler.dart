
import 'package:dio/dio.dart';
import 'package:medita_patient/app/data/models/failure.dart';
import 'package:medita_patient/app/data/network/status_code/status_code.dart';

class ExceptionHandler implements Exception {
  late Failure failure;

  ExceptionHandler.handler(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = StatusCode.defaultCode.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch(error.type) {
    case DioErrorType.connectTimeout:
      return StatusCode.connectTimeout.getFailure();
    case DioErrorType.sendTimeout:
      return StatusCode.sendTimeout.getFailure();
    case DioErrorType.receiveTimeout:
      return StatusCode.receiveTimeout.getFailure();
    case DioErrorType.response:
    {
      if(error.response != null && error.response?.statusCode != null && error.response?.statusMessage != null){
        return Failure(error.response?.statusCode ?? 0, error.response?.data['detail'] ?? "unknown");
      } else {
        return StatusCode.defaultCode.getFailure();
      }
    }
    case DioErrorType.cancel:
      return StatusCode.cancel.getFailure();
    case DioErrorType.other:
      return StatusCode.defaultCode.getFailure();
  }
}
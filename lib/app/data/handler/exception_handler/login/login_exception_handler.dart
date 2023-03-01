
import 'package:dio/dio.dart';
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';
import 'package:medita_patient/app/data/network/status_code/status_code.dart';

class LoginExceptionHandler implements Exception {
  late Failure failure;

  LoginExceptionHandler.handler(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = StatusCode.defaultCode.getAuthenticationFailure();
    }
  }
}

class BaseExceptionHandler implements Exception {
  late Failure failure;

  handler(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = StatusCode.defaultCode.getAuthenticationFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch(error.type) {
    case DioErrorType.connectTimeout:
      return StatusCode.connectTimeout.getAuthenticationFailure();
    case DioErrorType.sendTimeout:
      return StatusCode.sendTimeout.getAuthenticationFailure();
    case DioErrorType.receiveTimeout:
      return StatusCode.receiveTimeout.getAuthenticationFailure();
    case DioErrorType.response:
    {
      if(error.response != null && error.response?.statusCode != null && error.response?.statusMessage != null) {
        Response<dynamic>? response = error.response;
        if (response == null) {
          return Failure(0, "Null Response");
        }
        String errorMessage = "";
        if (response.data["detail"] != null) {
          errorMessage = response.data["detail"];
        } else {
          errorMessage = "${response.data["email"]?[0] ?? ""}";
        }
        return Failure(response.statusCode ?? 0, errorMessage);
      } else {
        return StatusCode.defaultCode.getAuthenticationFailure();
      }
    }
    case DioErrorType.cancel:
      return StatusCode.cancel.getAuthenticationFailure();
    case DioErrorType.other:
      return StatusCode.defaultCode.getAuthenticationFailure();
  }
}
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';
import 'package:medita_patient/app/data/models/data/failure/registration/registration_failure.dart';

enum StatusCode {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultCode
}

extension StatusCodeExtension on StatusCode {
  AuthenticationFailure getAuthenticationFailure() {
    switch(this){
      case StatusCode.success:
        return AuthenticationFailure(ResponseCode.success, ResponseCodeMessage.success);
      case StatusCode.noContent:
        return AuthenticationFailure(ResponseCode.noContent, ResponseCodeMessage.noContent);
      case StatusCode.badRequest:
        return AuthenticationFailure(ResponseCode.badRequest, ResponseCodeMessage.badRequest);
      case StatusCode.forbidden:
        return AuthenticationFailure(ResponseCode.forbidden, ResponseCodeMessage.forbidden);
      case StatusCode.unauthorised:
        return AuthenticationFailure(ResponseCode.unauthorised, ResponseCodeMessage.unauthorised);
      case StatusCode.notFound:
        return AuthenticationFailure(ResponseCode.notFound, ResponseCodeMessage.notFound);
      case StatusCode.internalServerError:
        return AuthenticationFailure(ResponseCode.internalServerError, ResponseCodeMessage.internalServerError);
      case StatusCode.connectTimeout:
        return AuthenticationFailure(ResponseCode.connectTimeout, ResponseCodeMessage.connectTimeout);
      case StatusCode.cancel:
        return AuthenticationFailure(ResponseCode.cancel, ResponseCodeMessage.cancel);
      case StatusCode.receiveTimeout:
        return AuthenticationFailure(ResponseCode.receiveTimeout, ResponseCodeMessage.receiveTimeout);
      case StatusCode.sendTimeout:
        return AuthenticationFailure(ResponseCode.sendTimeout, ResponseCodeMessage.sendTimeout);
      case StatusCode.cacheError:
        return AuthenticationFailure(ResponseCode.cacheError, ResponseCodeMessage.cacheError);
      case StatusCode.noInternetConnection:
        return AuthenticationFailure(ResponseCode.noInternetConnection, ResponseCodeMessage.noInternetConnection);
      case StatusCode.defaultCode:
        return AuthenticationFailure(ResponseCode.defaultCode, ResponseCodeMessage.defaultCode);
    }
  }
}

class ResponseCode {
  /// success with data
  static const int success = 200;
  /// success with no data
  static const int noContent = 201;
  /// fail api request (rejected)
  static const int badRequest = 400;
  /// fail request, user not authorized
  static const int unauthorised = 401;
  /// fail api rejected request
  static const int forbidden = 403;
  /// fail api not found
  static const int notFound = 404;
  /// fail crash in server side
  static const int internalServerError = 200;

  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int unKnown = -7;
  static const int defaultCode = 0;
}

class ResponseCodeMessage {
  /// success with data
  static const String success = "Success";
  /// success with no data
  static const String noContent = "No Content";
  /// fail api request (rejected)
  static const String badRequest = "Bad Request";
  /// fail request, user not authorized
  static const String unauthorised = "unAuthorized";
  /// fail api rejected request
  static const String forbidden = "Forbidden";
  /// fail api not found
  static const String notFound = "Not Found";
  /// fail crash in server side
  static const String internalServerError = "Internal Server Error";

  // local status code
  static const String connectTimeout = "Connect Timeout";
  static const String cancel = "Cancel";
  static const String receiveTimeout = "Receive Timeout";
  static const String sendTimeout = "Send Timeout";
  static const String cacheError = "Cache Error";
  static const String noInternetConnection = "No Internet Connection";
  static const String unKnown = "UnKnown";
  static const String defaultCode = "defaultCode";
}
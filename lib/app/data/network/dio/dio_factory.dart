
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:medita_patient/app/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


const String _applicationJson = "application/json";
const String _contentType = "Content-Type";
const String _accept = "accept";
const String _authorization = "authorization";
const int _timeOut = 60 * 1000;

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();

    Map<String, String> headers = {
      _contentType : _applicationJson,
      _accept : _applicationJson,
      _authorization : "Token here",
    };

    dio.options = BaseOptions(baseUrl: ApiConstants.baseUrl, headers: headers, receiveTimeout: _timeOut, sendTimeout: _timeOut);

    // if (!kReleaseMode) {
    //   dio.interceptors.add(PrettyDioLogger(
    //       requestHeader: true,
    //       requestBody: true,
    //       responseHeader: true,
    //       responseBody: true
    //   ));
    // }

    return dio;
  }
}
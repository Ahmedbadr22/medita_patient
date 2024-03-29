// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_client_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AppointmentClientApi implements AppointmentClientApi {
  _AppointmentClientApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.meditahealthcare.me/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<AppointmentResponse>> listUserAppointments(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<AppointmentResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'clinic/list-appointments-by-user/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            AppointmentResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<AppointmentResponse> addUserAppointments(
    doctorId,
    patientId,
    problemDetail,
    dateTime,
    meetingLink,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'doctor': doctorId,
      'patient': patientId,
      'problem_detail': problemDetail,
      'date_time': dateTime,
      'meeting_link': meetingLink,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AppointmentResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'clinic/add-appointment',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AppointmentResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

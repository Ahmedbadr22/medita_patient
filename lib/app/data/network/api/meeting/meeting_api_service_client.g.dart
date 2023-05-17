// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_api_service_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _MeetingApiServiceClient implements MeetingApiServiceClient {
  _MeetingApiServiceClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://google-meeting.meditahealthcare.me/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<MeetingResponse> createMeeting(
    title,
    description,
    doctorEmail,
    patientEmail,
    startTime,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'meeting_title': title,
      'meeting_description': description,
      'doctor_email': doctorEmail,
      'patient_email': patientEmail,
      'start_time': startTime,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MeetingResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/create-meeting',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MeetingResponse.fromJson(_result.data!);
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

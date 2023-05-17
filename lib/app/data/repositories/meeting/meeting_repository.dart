
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:medita_patient/app/data/data_sources/remote/meetting/meeting_data_source.dart';
import 'package:medita_patient/app/data/mapper/meeting/meeting_mappers.dart';
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';
import 'package:medita_patient/app/data/responses/appointment/meeting_response.dart';
import 'package:medita_patient/app/domain/models/meeting.dart';

import '../../handler/exception_handler/login/login_exception_handler.dart';
import '../../network/network_info.dart';
import '../../network/status_code/status_code.dart';

class MeetingRepository {

  final MeetingRemoteDatasource _datasource;
  final NetworkInfo _networkInfo;

  MeetingRepository(this._datasource, this._networkInfo);

  Future<Either<Failure, Meeting>> createMeeting(String title, String description, String doctorEmail, String patientEmail,String startTime) async {

    if(!await _networkInfo.isConnected()) {
      Failure noInternetConnectionFailure = StatusCode.noInternetConnection.getAuthenticationFailure();
      return Left(noInternetConnectionFailure);
    }

    try {
      MeetingResponse response = await _datasource.createMeeting(title, description, doctorEmail, patientEmail, startTime);
      Meeting meeting = response.toDomain();
      return Right(meeting);
    } catch(error) {
      if (kDebugMode) {
        print("Repo Error ${error.toString()}");
      }
      BaseExceptionHandler baseExceptionHandler = BaseExceptionHandler();
      baseExceptionHandler.handler(error);
      return Left(baseExceptionHandler.failure);
    }


  }
}
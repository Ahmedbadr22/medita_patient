import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/data_sources/remote/appointment/appointment_data_source.dart';
import 'package:medita_patient/app/data/mapper/appointment/appointment_mapper.dart';
import 'package:medita_patient/app/data/models/data/appointment/appointment.dart';
import 'package:medita_patient/app/data/network/network_info.dart';
import 'package:medita_patient/app/data/responses/appointment/appointment_response.dart';

import '../../handler/exception_handler/login/login_exception_handler.dart';
import '../../models/data/failure/auth/auth_failure.dart';
import '../../network/status_code/status_code.dart';

class AppointmentRepository {
  late final AppointmentDataSource _dataSource;
  late final NetworkInfo _networkInfo;

  AppointmentRepository(this._dataSource, this._networkInfo);

  Future<Either<Failure, List<Appointment>>> listUserAppointments(
      int id) async {
    if (!await _networkInfo.isConnected()) {
      Failure noInternetConnectionFailure =
          StatusCode.noInternetConnection.getAuthenticationFailure();
      return Left(noInternetConnectionFailure);
    }

    try {
      List<AppointmentResponse> appointmentsResponse =
          await _dataSource.listUserAppointments(id);
      List<Appointment> appointments = appointmentsResponse
          .map((appointment) => appointment.toDomain())
          .toList();
      return Right(appointments);
    } catch (error) {
      BaseExceptionHandler baseExceptionHandler = BaseExceptionHandler();
      baseExceptionHandler.handler(error);
      return Left(baseExceptionHandler.failure);
    }
  }

  Future<Either<Failure, Appointment>> addUserAppointments(
    int doctorId,
    int patientId,
    String problemDetail,
    String dateTime,
    String meetingLink,
  ) async {
    if (!await _networkInfo.isConnected()) {
      Failure noInternetConnectionFailure =
          StatusCode.noInternetConnection.getAuthenticationFailure();
      return Left(noInternetConnectionFailure);
    }

    try {
      AppointmentResponse appointmentResponse = await _dataSource.addUserAppointments(doctorId, patientId, problemDetail, dateTime, meetingLink);
      return Right(appointmentResponse.toDomain());
    } catch (error) {
      BaseExceptionHandler baseExceptionHandler = BaseExceptionHandler();
      baseExceptionHandler.handler(error);
      return Left(baseExceptionHandler.failure);
    }
  }
}

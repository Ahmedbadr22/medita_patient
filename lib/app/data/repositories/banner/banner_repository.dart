import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:medita_patient/app/data/data_sources/remote/banner/banner_data_source.dart';
import 'package:medita_patient/app/data/handler/exception_handler/login/login_exception_handler.dart';
import 'package:medita_patient/app/data/mapper/banner/banner_mapper.dart';
import 'package:medita_patient/app/data/models/data/banner/banner.dart';
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';
import 'package:medita_patient/app/data/network/network_info.dart';
import 'package:medita_patient/app/data/responses/banners/banner_response.dart';

import '../../network/status_code/status_code.dart';

class BannerRepository {
  late final BannerDataSource _bannerDataSource;
  late final NetworkInfo _networkInfo;

  BannerRepository(this._bannerDataSource, this._networkInfo);

  Future<Either<Failure, List<MedicalBanner>>> listBanners() async {
    if(!await _networkInfo.isConnected()) {
      Failure noInternetConnectionFailure = StatusCode.noInternetConnection.getAuthenticationFailure();
      return Left(noInternetConnectionFailure);
    }

    try {
      List<BannerResponse> bannersResponse = await _bannerDataSource.listBanners();
      List<MedicalBanner> banners = bannersResponse.map((banner) => banner.toDomain()).toList();
      return Right(banners);
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
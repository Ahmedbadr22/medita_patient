
import 'package:dio/dio.dart';
import 'package:medita_patient/app/app/constants.dart';
import 'package:medita_patient/app/data/responses/banners/banner_response.dart';
import 'package:retrofit/http.dart';

part 'banner_client_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class BannerClientApi {
  factory BannerClientApi(Dio dio, {String baseUrl}) = _BannerClientApi;

  @GET(ApiConstants.listBanners)
  Future<List<BannerResponse>> listBanners();
}



import 'package:medita_patient/app/data/network/api/banner/banner_client_api.dart';
import 'package:medita_patient/app/data/responses/banners/banner_response.dart';

class BannerDataSource {
  late final BannerClientApi _bannerClientApi;

  BannerDataSource(this._bannerClientApi);

  Future<List<BannerResponse>> listBanners() {
    return _bannerClientApi.listBanners();
  }
}


import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/responses/banners/banner_response.dart';

import '../../models/data/banner/banner.dart';

extension BannerResponseMapper on BannerResponse {
  MedicalBanner toDomain() {
    return MedicalBanner(id.orZero(), title.orEmpty(), body.orEmpty(), imageUrl.orEmpty());
  }
}
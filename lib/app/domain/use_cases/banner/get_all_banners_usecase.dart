import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/models/data/banner/banner.dart';
import 'package:medita_patient/app/data/models/data/failure/auth/auth_failure.dart';
import 'package:medita_patient/app/data/repositories/banner/banner_repository.dart';

class GetAllBannersUseCase {
  final BannerRepository bannerRepository;

  GetAllBannersUseCase(this.bannerRepository);

  Future<Either<Failure, List<MedicalBanner>>> execute() async {
    return await bannerRepository.listBanners();
  }

}
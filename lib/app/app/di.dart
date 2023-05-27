import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:medita_patient/app/app/constants.dart';
import 'package:medita_patient/app/data/data_sources/local/sharedPref/token_local_data_source.dart';
import 'package:medita_patient/app/data/data_sources/remote/appointment/appointment_data_source.dart';
import 'package:medita_patient/app/data/data_sources/remote/article/article_data_source.dart';
import 'package:medita_patient/app/data/data_sources/remote/banner/banner_data_source.dart';
import 'package:medita_patient/app/data/data_sources/remote/classification/classification_remote_data_source.dart';
import 'package:medita_patient/app/data/data_sources/remote/doctor/doctor_data_source.dart';
import 'package:medita_patient/app/data/data_sources/remote/hospital/hospital_data_source.dart';
import 'package:medita_patient/app/data/data_sources/remote/login/login_date_source.dart';
import 'package:medita_patient/app/data/data_sources/remote/registration/registration_data_source.dart';
import 'package:medita_patient/app/data/network/api/appointment/appointment_client_api.dart';
import 'package:medita_patient/app/data/network/api/article/article_client_api.dart';
import 'package:medita_patient/app/data/network/api/banner/banner_client_api.dart';
import 'package:medita_patient/app/data/network/api/doctor/doctor_client_api.dart';
import 'package:medita_patient/app/data/network/api/login/login_api_service_client.dart';
import 'package:medita_patient/app/data/network/api/meeting/meeting_api_service_client.dart';
import 'package:medita_patient/app/data/network/api/near_hospitals/list_near_hospitals/list_near_hospitals_api_service_client.dart';
import 'package:medita_patient/app/data/network/api/registration/registration_api_service_client.dart';
import 'package:medita_patient/app/data/network/api/specialty/specialty_client_api.dart';
import 'package:medita_patient/app/data/network/dio/dio_factory.dart';
import 'package:medita_patient/app/data/network/network_info.dart';
import 'package:medita_patient/app/data/repositories/appointment/appointment_repository.dart';
import 'package:medita_patient/app/data/repositories/article/article_repository.dart';
import 'package:medita_patient/app/data/repositories/banner/banner_repository.dart';
import 'package:medita_patient/app/data/repositories/classification/classification_repository.dart';
import 'package:medita_patient/app/data/repositories/doctor/doctor_repository.dart';
import 'package:medita_patient/app/data/repositories/hospital/hospital_repository.dart';
import 'package:medita_patient/app/data/repositories/login/login_repository.dart';
import 'package:medita_patient/app/data/repositories/meeting/meeting_repository.dart';
import 'package:medita_patient/app/data/repositories/registration/registration_repository.dart';
import 'package:medita_patient/app/data/repositories/specialty/specialty_repository.dart';
import 'package:medita_patient/app/data/repositories/token/token_repository.dart';
import 'package:medita_patient/app/domain/use_cases/appointment/add_user_appointments_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/appointment/list_user_appointments_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/article/list_most_liked_articles_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/article/list_user_bookmarks_articles.dart';
import 'package:medita_patient/app/domain/use_cases/banner/get_all_banners_usecase.dart';
import 'package:medita_patient/app/domain/use_cases/classification/classify_stomach_disease_usecase.dart';
import 'package:medita_patient/app/domain/use_cases/doctor/list_doctors_by_speciality_id_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/doctor/list_user_favorite_doctors_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/hospital/list_near_hospitals.dart';
import 'package:medita_patient/app/domain/use_cases/login/login_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/metting/create_meeting_usecase.dart';
import 'package:medita_patient/app/domain/use_cases/registration/registration_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/specialty/list_specialties_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/token/get_local_token_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/token/save_token_use_case.dart';
import 'package:medita_patient/app/presentation/screens/appointment/cubit/appointment_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/articles/cubit/articles_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/bookmarks/cubit/article_bookmarls_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/favorite_doctors/cubit/favorite_doctors_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/home/view_model/home_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/navigation/viewModel/main_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/near_hospitals_screen/cubit/near_hospitals_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/schedule/screens/disease_test_screen/cubit/disease_test_cubit.dart';
import 'package:medita_patient/app/presentation/screens/sign_in/cubit/sign_in_cubit.dart';
import 'package:medita_patient/app/presentation/screens/sign_up/cubit/sign_up_cubit.dart';
import 'package:medita_patient/app/presentation/screens/speciality/cubit/SpecialityScreenCubit.dart';
import 'package:medita_patient/app/presentation/screens/splash/cubit/splash_screen_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_sources/remote/meetting/meeting_data_source.dart';
import '../data/data_sources/remote/specialty/speciality_data_source.dart';
import '../domain/use_cases/category/list_article_categories_use_case.dart';
import '../domain/use_cases/classification/classify_brain_disease_usecase.dart';
import '../domain/use_cases/user/get_user_email_use_case.dart';
import '../domain/use_cases/user/set_user_email_use_case.dart';
import '../presentation/screens/book_appointment/cubit/book_appointment_cubit.dart';

final diInstance = GetIt.instance;

Future<void> initAppModule() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  // shared preferences instance
  diInstance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // network info instance
  diInstance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(InternetConnectionChecker()));

  // dio instance
  diInstance.registerLazySingleton<DioFactory>(() => DioFactory());

  Dio dio = await diInstance<DioFactory>().getDio();

  // Login
  // app service client instance
  diInstance.registerLazySingleton<LoginApiServiceClient>(
      () => LoginApiServiceClient(dio));

  // remote datasource instance
  diInstance.registerLazySingleton<LoginDataSource>(
      () => LoginDataSource(diInstance<LoginApiServiceClient>()));

  diInstance.registerLazySingleton<TokenLocalDataSource>(
      () => TokenLocalDataSource(diInstance<SharedPreferences>()));

  diInstance.registerLazySingleton<TokenRepository>(
      () => TokenRepository(diInstance<TokenLocalDataSource>()));

  // repository instance
  diInstance.registerLazySingleton<LoginRepository>(() => LoginRepository(
      diInstance<LoginDataSource>(), diInstance<NetworkInfo>()));

  // Registration
  // app service client instance
  diInstance.registerLazySingleton<RegistrationApiServiceClient>(
      () => RegistrationApiServiceClient(dio));

  // remote datasource instance
  diInstance.registerLazySingleton<RegistrationDataSource>(
      () => RegistrationDataSource(diInstance<RegistrationApiServiceClient>()));

  // repository instance
  diInstance.registerLazySingleton<RegistrationRepository>(() =>
      RegistrationRepository(
          diInstance<RegistrationDataSource>(), diInstance<NetworkInfo>()));

  /// Hospital
  // app service client instance
  diInstance.registerLazySingleton<HospitalApiServiceClient>(
      () => HospitalApiServiceClient(dio));

  // remote datasource instance
  diInstance.registerLazySingleton<HospitalDataSource>(
      () => HospitalDataSource(diInstance<HospitalApiServiceClient>()));

  // repository instance
  diInstance.registerLazySingleton<HospitalRepository>(() => HospitalRepository(
      diInstance<HospitalDataSource>(), diInstance<NetworkInfo>()));

  diInstance.registerFactory<ListNearHospitalsUseCase>(
      () => ListNearHospitalsUseCase(diInstance<HospitalRepository>()));

  /// Banner
  // app service client instance
  diInstance.registerLazySingleton<BannerClientApi>(() => BannerClientApi(dio));

  // remote datasource instance
  diInstance.registerLazySingleton<BannerDataSource>(
      () => BannerDataSource(diInstance<BannerClientApi>()));

  // repository instance
  diInstance.registerLazySingleton<BannerRepository>(() => BannerRepository(
      diInstance<BannerDataSource>(), diInstance<NetworkInfo>()));

  /// Specialty
  // app service client instance
  diInstance
      .registerLazySingleton<SpecialtyClientApi>(() => SpecialtyClientApi(dio));

  // remote datasource instance
  diInstance.registerLazySingleton<SpecialtyDataSource>(
      () => SpecialtyDataSource(diInstance<SpecialtyClientApi>()));

  // repository instance
  diInstance.registerLazySingleton<SpecialtyRepository>(() =>
      SpecialtyRepository(
          diInstance<SpecialtyDataSource>(), diInstance<NetworkInfo>()));

  diInstance.registerFactory<ListSpecialtiesUseCase>(
      () => ListSpecialtiesUseCase(diInstance<SpecialtyRepository>()));

  /// Doctor
  // app service client instance
  diInstance.registerLazySingleton<DoctorClientApi>(() => DoctorClientApi(dio));

  // remote datasource instance
  diInstance.registerLazySingleton<DoctorDataSource>(
      () => DoctorDataSource(diInstance<DoctorClientApi>()));

  // repository instance
  diInstance.registerLazySingleton<DoctorRepository>(() => DoctorRepository(
      diInstance<DoctorDataSource>(), diInstance<NetworkInfo>()));

  /// Article
  // app service client instance
  diInstance
      .registerLazySingleton<ArticleClientApi>(() => ArticleClientApi(dio));

  // remote datasource instance
  diInstance.registerLazySingleton<ArticleDataSource>(
      () => ArticleDataSource(diInstance<ArticleClientApi>()));

  // repository instance
  diInstance.registerLazySingleton<ArticleRepository>(() => ArticleRepository(
      diInstance<ArticleDataSource>(), diInstance<NetworkInfo>()));

  // use case
  diInstance.registerFactory<ListMostLikedArticlesUseCase>(
      () => ListMostLikedArticlesUseCase(diInstance<ArticleRepository>()));
  diInstance.registerFactory<ListArticleCategoriesUseCase>(
      () => ListArticleCategoriesUseCase(diInstance<ArticleRepository>()));
  diInstance.registerFactory<ListUserBookmarksArticlesUseCase>(
      () => ListUserBookmarksArticlesUseCase(diInstance<ArticleRepository>()));

  // Appointments
  // app service client instance
  diInstance.registerLazySingleton<AppointmentClientApi>(
      () => AppointmentClientApi(dio));

  // remote datasource instance
  diInstance.registerLazySingleton<AppointmentDataSource>(
      () => AppointmentDataSource(diInstance<AppointmentClientApi>()));

  // repository instance
  diInstance.registerLazySingleton<AppointmentRepository>(() =>
      AppointmentRepository(
          diInstance<AppointmentDataSource>(), diInstance<NetworkInfo>()));
  diInstance.registerFactory<ListUserAppointmentsUseCase>(
      () => ListUserAppointmentsUseCase(
            diInstance<AppointmentRepository>(),
            diInstance<GetLocalTokenUseCase>(),
          ));

  //  use case instance
  diInstance.registerLazySingleton<MeetingApiServiceClient>(
      () => MeetingApiServiceClient(dio, baseUrl: ApiConstants.meetingBaseUrl));
  diInstance.registerLazySingleton<MeetingRemoteDatasource>(
      () => MeetingRemoteDatasource(diInstance<MeetingApiServiceClient>()));
  diInstance.registerLazySingleton<MeetingRepository>(() => MeetingRepository(
      diInstance<MeetingRemoteDatasource>(), diInstance<NetworkInfo>()));

  // Disease Prediction
  diInstance.registerFactory<ClassificationRemoteDataSource>(
      () => ClassificationRemoteDataSource(dio));
}

void initSplashScreen() {
  if (!GetIt.I.isRegistered<GetLocalTokenUseCase>()) {
    diInstance.registerFactory<GetLocalTokenUseCase>(
        () => GetLocalTokenUseCase(diInstance<TokenRepository>()));

    diInstance.registerFactory<SplashScreenCubit>(
        () => SplashScreenCubit(diInstance<GetLocalTokenUseCase>()));
  }
}

void initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    // login use case instance
    diInstance.registerFactory<SaveTokenUseCase>(
        () => SaveTokenUseCase(diInstance<TokenRepository>()));

    diInstance.registerFactory<LoginUseCase>(() => LoginUseCase(
        diInstance<LoginRepository>(), diInstance<SaveTokenUseCase>()));

    diInstance.registerFactory<SetUserEmailUsecase>(
        () => SetUserEmailUsecase(diInstance<SharedPreferences>()));

    // login viewModel instance
    diInstance.registerFactory<SignInCubit>(() => SignInCubit(
        diInstance<LoginUseCase>(), diInstance<SetUserEmailUsecase>()));
  }
}

void initFavoriteDoctorsModule() {
  if (!GetIt.I.isRegistered<ListUserFavoriteDoctorsUseCase>()) {
    diInstance.registerFactory<ListUserFavoriteDoctorsUseCase>(() =>
        ListUserFavoriteDoctorsUseCase(diInstance<DoctorRepository>(),
            diInstance<GetLocalTokenUseCase>()));

    // login viewModel instance
    diInstance.registerFactory<FavoriteDoctorsScreenCubit>(() =>
        FavoriteDoctorsScreenCubit(
            diInstance<ListUserFavoriteDoctorsUseCase>()));
  }
}

void initRegistrationModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    // login use case instance
    diInstance.registerFactory<RegisterUseCase>(
        () => RegisterUseCase(diInstance<RegistrationRepository>()));

    // login viewModel instance
    diInstance.registerFactory<SignUpCubit>(
        () => SignUpCubit(diInstance<RegisterUseCase>()));
  }
}

void initMainScreenModule() {
  if (!GetIt.I.isRegistered<GetAllBannersUseCase>()) {
    // getAllBannersUseCase instance
    diInstance.registerFactory<GetAllBannersUseCase>(
        () => GetAllBannersUseCase(diInstance<BannerRepository>()));

    diInstance.registerFactory<HomeScreenCubit>(
      () => HomeScreenCubit(
        diInstance<GetAllBannersUseCase>(),
        diInstance<ListSpecialtiesUseCase>(),
        diInstance<ListNearHospitalsUseCase>(),
      ),
    );

    diInstance.registerFactory<AppointmentScreenCubit>(
      () => AppointmentScreenCubit(
        diInstance<ListUserAppointmentsUseCase>(),
      ),
    );

    // MainScreen viewModel instance
    diInstance.registerFactory<MainScreenCubit>(() => MainScreenCubit());
  }
}

void initListNearHospitalsModule() {
  if (!GetIt.I.isRegistered<NearHospitalsScreenCubit>()) {
    // cubit instance
    diInstance.registerFactory<NearHospitalsScreenCubit>(
        () => NearHospitalsScreenCubit(diInstance<ListNearHospitalsUseCase>()));
  }
}

void initArticlesScreenModule() {
  if (!GetIt.I.isRegistered<ArticleScreenCubit>()) {
    // cubit instance
    diInstance.registerFactory<ArticleScreenCubit>(() => ArticleScreenCubit(
          diInstance<ListMostLikedArticlesUseCase>(),
          diInstance<ListArticleCategoriesUseCase>(),
        ));
  }
}

void initArticlesBookmarksScreenModule() {
  if (!GetIt.I.isRegistered<ArticlesBookMarksScreenCubit>()) {
    // cubit instance
    diInstance.registerFactory<ArticlesBookMarksScreenCubit>(
        () => ArticlesBookMarksScreenCubit(
              diInstance<ListUserBookmarksArticlesUseCase>(),
            ));
  }
}

void initSpecialityModule() {
  if (!GetIt.I.isRegistered<ListDoctorsBySpecialityIdUseCase>()) {
    //  use case instance
    diInstance.registerFactory<ListDoctorsBySpecialityIdUseCase>(
        () => ListDoctorsBySpecialityIdUseCase(diInstance<DoctorRepository>()));

    // cubit instance
    diInstance.registerFactory<SpecialityScreenCubit>(() =>
        SpecialityScreenCubit(diInstance<ListDoctorsBySpecialityIdUseCase>()));
  }
}

void initBookAppointmentModule() {
  if (!GetIt.I.isRegistered<CreateMeetingUseCase>()) {
    diInstance.registerFactory<CreateMeetingUseCase>(
        () => CreateMeetingUseCase(diInstance<MeetingRepository>()));
    diInstance.registerFactory<GetUserEmailUsecase>(
        () => GetUserEmailUsecase(diInstance<SharedPreferences>()));

    diInstance.registerFactory<AddUserAppointmentsUseCase>(
        () => AddUserAppointmentsUseCase(diInstance<AppointmentRepository>()));

    // cubit instance
    diInstance.registerFactory<BookAppointmentCubit>(() => BookAppointmentCubit(
          diInstance<CreateMeetingUseCase>(),
          diInstance<GetUserEmailUsecase>(),
          diInstance<GetLocalTokenUseCase>(),
          diInstance<AddUserAppointmentsUseCase>(),
        ));
  }
}

void initDiseaseClassificationModule() {
  if (!GetIt.I.isRegistered<ClassifyStomachDiseaseUseCase>()) {
    diInstance.registerFactory<ClassificationRepository>(() =>
        ClassificationRepository(diInstance<ClassificationRemoteDataSource>()));

    // UseCases
    diInstance.registerFactory<ClassifyStomachDiseaseUseCase>(() =>
        ClassifyStomachDiseaseUseCase(diInstance<ClassificationRepository>()));
    diInstance.registerFactory<ClassifyBrainDiseaseUseCase>(() =>
        ClassifyBrainDiseaseUseCase(diInstance<ClassificationRepository>()));

    // Cubit
    diInstance.registerFactory<DiseaseTestCubit>(
      () => DiseaseTestCubit(
        diInstance<ClassifyStomachDiseaseUseCase>(),
        diInstance<ClassifyBrainDiseaseUseCase>(),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:medita_patient/app/data/data_sources/remote/hospital/hospital_data_source.dart';
import 'package:medita_patient/app/data/data_sources/remote/login/login_date_source.dart';
import 'package:medita_patient/app/data/data_sources/remote/registration/registration_data_source.dart';
import 'package:medita_patient/app/data/network/api/login/login_api_service_client.dart';
import 'package:medita_patient/app/data/network/api/near_hospitals/list_near_hospitals/list_near_hospitals_api_service_client.dart';
import 'package:medita_patient/app/data/network/api/registration/registration_api_service_client.dart';
import 'package:medita_patient/app/data/network/dio/dio_factory.dart';
import 'package:medita_patient/app/data/network/network_info.dart';
import 'package:medita_patient/app/data/repositories/hospital/hospital_repository.dart';
import 'package:medita_patient/app/data/repositories/login/login_repository.dart';
import 'package:medita_patient/app/data/repositories/registration/registration_repository.dart';
import 'package:medita_patient/app/domain/use_cases/hospital/list_near_hospitals.dart';
import 'package:medita_patient/app/domain/use_cases/login/login_use_case.dart';
import 'package:medita_patient/app/domain/use_cases/registration/registration_use_case.dart';
import 'package:medita_patient/app/presentation/screens/near_hospitals_screen/cubit/near_hospitals_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/sign_in/cubit/sign_in_cubit.dart';
import 'package:medita_patient/app/presentation/screens/sign_up/cubit/sign_up_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final diInstance = GetIt.instance;

Future<void> initAppModule() async {

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  // shared preferences instance
  diInstance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // network info instance
  diInstance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(InternetConnectionChecker()));
  
  // dio instance
  diInstance.registerLazySingleton<DioFactory>(() => DioFactory());

  Dio dio = await diInstance<DioFactory>().getDio();

  // app service client instance
  diInstance.registerLazySingleton<LoginApiServiceClient>(() => LoginApiServiceClient(dio));

  // remote datasource instance
  diInstance.registerLazySingleton<LoginDataSource>(() => LoginDataSource(diInstance<LoginApiServiceClient>()));

  // repository instance
  diInstance.registerLazySingleton<LoginRepository>(() => LoginRepository(diInstance<LoginDataSource>(), diInstance<NetworkInfo>()));

  // app service client instance
  diInstance.registerLazySingleton<RegistrationApiServiceClient>(() => RegistrationApiServiceClient(dio));

  // remote datasource instance
  diInstance.registerLazySingleton<RegistrationDataSource>(() => RegistrationDataSource(diInstance<RegistrationApiServiceClient>()));

  // repository instance
  diInstance.registerLazySingleton<RegistrationRepository>(() => RegistrationRepository(diInstance<RegistrationDataSource>(), diInstance<NetworkInfo>()));

  /// Hospital
  // app service client instance
  diInstance.registerLazySingleton<HospitalApiServiceClient>(() => HospitalApiServiceClient(dio));

  // remote datasource instance
  diInstance.registerLazySingleton<HospitalDataSource>(() => HospitalDataSource(diInstance<HospitalApiServiceClient>()));

  // repository instance
  diInstance.registerLazySingleton<HospitalRepository>(() => HospitalRepository(diInstance<HospitalDataSource>(), diInstance<NetworkInfo>()));
}

void initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    // login use case instance
    diInstance.registerFactory<LoginUseCase>(() => LoginUseCase(diInstance<LoginRepository>()));

    // login viewModel instance
    diInstance.registerFactory<SignInCubit>(() => SignInCubit(diInstance<LoginUseCase>()));
  }
}

void initRegistrationModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    // login use case instance
    diInstance.registerFactory<RegisterUseCase>(() => RegisterUseCase(diInstance<RegistrationRepository>()));

    // login viewModel instance
    diInstance.registerFactory<SignUpCubit>(() => SignUpCubit(diInstance<RegisterUseCase>()));
  }
}

void initListNearHospitalsModule() {
  if (!GetIt.I.isRegistered<ListNearHospitalsUseCase>()) {
    //  use case instance
    diInstance.registerFactory<ListNearHospitalsUseCase>(() => ListNearHospitalsUseCase(diInstance<HospitalRepository>()));

    // l instance
    diInstance.registerFactory<NearHospitalsScreenCubit>(() => NearHospitalsScreenCubit(diInstance<ListNearHospitalsUseCase>()));
  }
}
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:medita_patient/app/data/data_sources/remote/date_source.dart';
import 'package:medita_patient/app/data/network/api.dart';
import 'package:medita_patient/app/data/network/dio_factory.dart';
import 'package:medita_patient/app/data/network/network_info.dart';
import 'package:medita_patient/app/data/repositories/login_repository_imp.dart';
import 'package:medita_patient/app/domain/repositories/login_repository.dart';
import 'package:medita_patient/app/domain/use_cases/login_use_case.dart';
import 'package:medita_patient/app/presentation/screens/sign_in/cubit/sign_in_cubit.dart';
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
  diInstance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote datasource instance
  diInstance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp(diInstance<AppServiceClient>()));

  // repository instance
  diInstance.registerLazySingleton<LoginRepository>(() => LoginRepositoryImp(diInstance<RemoteDataSource>(), diInstance<NetworkInfo>()));
}

void initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    // login use case instance
    diInstance.registerFactory<LoginUseCase>(() => LoginUseCase(diInstance<LoginRepository>()));

    // login viewModel instance
    diInstance.registerFactory<SignInCubit>(() => SignInCubit(diInstance<LoginUseCase>()));
  }
}
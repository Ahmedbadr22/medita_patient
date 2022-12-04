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
import 'package:medita_patient/app/presentation/screens/sign_in/view_model/sign_in_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  // shared preferences instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // network info instance
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(InternetConnectionChecker()));
  
  // dio instance
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();

  // app service client instance
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote datasource instance
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp(instance<AppServiceClient>()));

  // repository instance
  instance.registerLazySingleton<LoginRepository>(() => LoginRepositoryImp(instance<RemoteDataSource>(), instance<NetworkInfo>()));
}

void initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    // login use case instance
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance<LoginRepository>()));

    // login viewModel instance
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance<LoginUseCase>()));
  }
}
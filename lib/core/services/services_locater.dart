import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/data/data_source/auth/auth_remote_data_source.dart';
import 'package:antria_mobile_pelanggan/features/data/repository/auth_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/domain/repository/auth_repository/auth_repository.dart';
import 'package:antria_mobile_pelanggan/features/domain/usecase/login/login_usecase.dart';
import 'package:antria_mobile_pelanggan/features/domain/usecase/register/register_ucecase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> setUpServiceLocator() async {
  //usecase
  serviceLocator.registerFactory<LoginUsecase>(() => LoginUsecase());
  serviceLocator.registerFactory<RegisterUsecase>(() => RegisterUsecase());

  //datasource
  serviceLocator
      .registerFactory<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl());

  //repositories
  serviceLocator.registerFactory<AuthRepository>(() => AuthRepositoryImpl());
  serviceLocator.registerSingleton<UserCacheService>(UserCacheService());

  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerFactory<SharedPreferences>(() => sharedPreferences);
  // request
  serviceLocator.registerSingleton<Request>(Request());
}

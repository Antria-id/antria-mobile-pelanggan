import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/data/data_source/auth/auth_remote_data_source.dart';
import 'package:antria_mobile_pelanggan/features/data/data_source/home/home_local_datasource.dart';
import 'package:antria_mobile_pelanggan/features/data/data_source/restaurant/restaurant_remote_data_source.dart';
import 'package:antria_mobile_pelanggan/features/data/repository/auth_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/data/repository/home_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/data/repository/restaurant_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/domain/repository/auth_repository/auth_repository.dart';
import 'package:antria_mobile_pelanggan/features/domain/repository/home_repository/home_repository.dart';
import 'package:antria_mobile_pelanggan/features/domain/repository/restaurant_repository/restaurant_repository.dart';
import 'package:antria_mobile_pelanggan/features/domain/usecase/home/get_local_user_usecase.dart';
import 'package:antria_mobile_pelanggan/features/domain/usecase/login/login_usecase.dart';
import 'package:antria_mobile_pelanggan/features/domain/usecase/register/register_ucecase.dart';
import 'package:antria_mobile_pelanggan/features/domain/usecase/restaurant/get_restaurant.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> setUpServiceLocator() async {
  //usecase
  serviceLocator.registerFactory<LoginUsecase>(() => LoginUsecase());
  serviceLocator.registerFactory<RegisterUsecase>(() => RegisterUsecase());
  serviceLocator
      .registerFactory<GetRestaurantUsecase>(() => GetRestaurantUsecase());
  serviceLocator
      .registerFactory<GetLocalUserUsecase>(() => GetLocalUserUsecase());

  //datasource
  serviceLocator
      .registerFactory<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl());

  serviceLocator.registerFactory<RestaurantRemoteDatasource>(
      () => RestaurantRemoteDatasourceImpl());

  serviceLocator.registerFactory<HomeLocalUserDatasource>(
      () => HomeLocalUserDatasourceImpl());

  //repositories
  serviceLocator.registerFactory<AuthRepository>(() => AuthRepositoryImpl());
  serviceLocator.registerSingleton<UserCacheService>(UserCacheService());
  serviceLocator
      .registerFactory<RestaurantRepository>(() => RestaurantRepositoryImpl());
  serviceLocator.registerFactory<HomeRepository>(() => HomeRepositoryImpl());

  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerFactory<SharedPreferences>(() => sharedPreferences);
  // request
  serviceLocator.registerSingleton<Request>(Request());
}

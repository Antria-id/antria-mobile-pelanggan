import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/repositories/auth_repository.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/usecases/login/login_usecase.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/usecases/register/register_ucecase.dart';
import 'package:antria_mobile_pelanggan/features/home/data/datasources/home_local_datasource.dart';
import 'package:antria_mobile_pelanggan/features/home/data/datasources/restaurant_remote_data_source.dart';
import 'package:antria_mobile_pelanggan/features/home/data/repositories/home_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/home/data/repositories/restaurant_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/repositories/home_repository/home_repository.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/repositories/restaurant_repository/restaurant_repository.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/usecases/home/get_local_user_usecase.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/usecases/restaurant/get_restaurant.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/datasources/info_restaurant/restaurant_remote_datasources.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/datasources/menu_restaurant/menu_remote_restaurant_datasource.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/repositories/info_restaurant_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/repositories/menu_restaurant_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/repositories/info_restaurant_repository.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/repositories/menu_restaurant_repository.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/usecases/info_restaurant/get_info_restaurant_usecase.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/usecases/menu_restaurant/get_menu_restaurant_usecase.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/repositories/pelanggan_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/repositories/pelanggan_repository.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/usecases/get_pelanggan_profile_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> setUpServiceLocator() async {
  //usecase
  serviceLocator.registerFactory<LoginUsecase>(() => LoginUsecase());

  serviceLocator.registerFactory<RegisterUsecase>(() => RegisterUsecase());

  serviceLocator.registerFactory<GetPelangganProfileUsecase>(
      () => GetPelangganProfileUsecase());

  serviceLocator
      .registerFactory<GetRestaurantUsecase>(() => GetRestaurantUsecase());

  serviceLocator
      .registerFactory<GetLocalUserUsecase>(() => GetLocalUserUsecase());

  serviceLocator.registerFactory<GetInfoRestaurantUsecase>(
      () => GetInfoRestaurantUsecase());

  serviceLocator.registerFactory<MenuGetRestaurantUsecase>(
      () => MenuGetRestaurantUsecase());

  //datasource
  serviceLocator
      .registerFactory<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl());

  serviceLocator.registerFactory<RestaurantRemoteDatasource>(
      () => RestaurantRemoteDatasourceImpl());

  serviceLocator.registerFactory<HomeLocalUserDatasource>(
      () => HomeLocalUserDatasourceImpl());

  serviceLocator.registerFactory<ProfileUserDatasource>(
      () => ProfileUserDatasourceImpl());

  serviceLocator.registerFactory<InfoRestaurantRemoteDatasource>(
      () => InfoRestaurantRemoteDatasourceImpl());

  serviceLocator.registerFactory<MenuRestaurantRemoteDatasource>(
      () => MenuRestaurantRemoteDatasourceImpl());

  //repositories
  serviceLocator.registerFactory<AuthRepository>(() => AuthRepositoryImpl());

  serviceLocator.registerSingleton<UserCacheService>(UserCacheService());

  serviceLocator
      .registerFactory<RestaurantRepository>(() => RestaurantRepositoryImpl());

  serviceLocator.registerFactory<HomeRepository>(() => HomeRepositoryImpl());

  serviceLocator
      .registerFactory<ProfileRepository>(() => ProfileRepositoryImpl());

  serviceLocator.registerFactory<InfoRestaurantRepository>(
      () => InfoRestaurantRepositoryImpl());

  serviceLocator.registerFactory<MenuRestaurantRepository>(
      () => MenuRestaurantRepositoryImpl());

  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerFactory<SharedPreferences>(() => sharedPreferences);
  // request
  serviceLocator.registerSingleton<Request>(Request());
}

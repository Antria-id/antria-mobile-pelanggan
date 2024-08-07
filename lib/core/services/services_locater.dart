import 'package:antria_mobile_pelanggan/core/network/network_checker.dart';
import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/repositories/auth_repository.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/usecases/login/login_usecase.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/usecases/otp_usecase.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/usecases/register/register_ucecase.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/data/datasources/ewallet_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/data/repositories/ewallet_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/domain/repositories/ewallet_repository.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/domain/usecases/ewallet_usecase.dart';
import 'package:antria_mobile_pelanggan/features/history/data/datasources/done_order/history_transaction_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/history/data/datasources/order_progress/order_transaction_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/history/data/repositories/history_transaction_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/history/data/repositories/order_transaction_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/history/domain/repositories/history_transaction_repository.dart';
import 'package:antria_mobile_pelanggan/features/history/domain/repositories/order_transaction_respository.dart';
import 'package:antria_mobile_pelanggan/features/history/domain/usecases/done_order/get_detail_transaction_usecase.dart';
import 'package:antria_mobile_pelanggan/features/history/domain/usecases/done_order/get_history_transaction_usecase.dart';
import 'package:antria_mobile_pelanggan/features/home/data/datasources/home_local_datasource.dart';
import 'package:antria_mobile_pelanggan/features/home/data/datasources/restaurant_remote_data_source.dart';
import 'package:antria_mobile_pelanggan/features/home/data/repositories/home_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/home/data/repositories/restaurant_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/repositories/home_repository/home_repository.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/repositories/restaurant_repository/restaurant_repository.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/usecases/home/check_login_status_usecase.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/usecases/home/get_local_user_usecase.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/usecases/home/get_remote_user_usecase.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/usecases/restaurant/get_restaurant.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/datasources/info_restaurant/inforestaurant_remote_datasources.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/datasources/menu_restaurant/menu_local_restaurant_datasource.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/datasources/menu_restaurant/menu_remote_restaurant_datasource.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/repositories/info_restaurant_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/repositories/menu_restaurant_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/repositories/info_restaurant_repository.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/repositories/menu_restaurant_repository.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/usecases/info_restaurant/get_info_restaurant_usecase.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/usecases/menu_restaurant/get_menu_restaurant_usecase.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/usecases/order_list/order_list_restaurant.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/repositories/pelanggan_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/repositories/pelanggan_repository.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/usecases/get_pelanggan_profile_usecase.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/usecases/logout_user_usecase.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/usecases/update_pelanggan_usecase.dart';
import 'package:antria_mobile_pelanggan/features/queue/data/datasources/queue_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/queue/data/repositories/queue_respository_impl.dart';
import 'package:antria_mobile_pelanggan/features/queue/domain/repositories/queue_repository.dart';
import 'package:antria_mobile_pelanggan/features/queue/domain/usecases/get_queue_usecase.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/datasources/reviews_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/repositories/reviews_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/rating/domain/repositories/reviews_repository.dart';
import 'package:antria_mobile_pelanggan/features/rating/domain/usecases/reviews_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/history/domain/usecases/order_progress/get_order_transaction_usecase.dart';

final serviceLocator = GetIt.instance;

Future<void> setUpServiceLocator() async {
  serviceLocator.registerFactory<CheckUserLoginStatus>(
    () => CheckUserLoginStatusImpl(),
  );
  //usecase
  serviceLocator.registerFactory<LoginUsecase>(() => LoginUsecase());

  serviceLocator.registerFactory<RegisterUsecase>(() => RegisterUsecase());

  serviceLocator.registerFactory<GetPelangganProfileUsecase>(
      () => GetPelangganProfileUsecase());

  serviceLocator
      .registerFactory<UpdatePelangganUsecase>(() => UpdatePelangganUsecase());

  serviceLocator.registerFactory<LogoutUserUsecase>(() => LogoutUserUsecase());

  serviceLocator
      .registerFactory<GetRestaurantUsecase>(() => GetRestaurantUsecase());

  serviceLocator
      .registerFactory<GetLocalUserUsecase>(() => GetLocalUserUsecase());

  serviceLocator.registerFactory<GetInfoRestaurantUsecase>(
      () => GetInfoRestaurantUsecase());

  serviceLocator.registerFactory<GetMenuUsecase>(() => GetMenuUsecase());

  serviceLocator.registerFactory<ReviewsUsecase>(() => ReviewsUsecase());

  serviceLocator.registerFactory<OrderListUsecase>(() => OrderListUsecase());

  serviceLocator.registerFactory<GetHistoryTransactionUsecase>(
      () => GetHistoryTransactionUsecase());

  serviceLocator.registerFactory<GetDetailTransactionUsecase>(
      () => GetDetailTransactionUsecase());

  serviceLocator.registerFactory<GetOrderTransactionUsecase>(
      () => GetOrderTransactionUsecase());

  serviceLocator.registerFactory<GetQueueUsecase>(() => GetQueueUsecase());

  serviceLocator.registerFactory<EwalletUsecase>(() => EwalletUsecase());

  serviceLocator
      .registerFactory<GetUserRemoteUsecase>(() => GetUserRemoteUsecase());

  serviceLocator.registerFactory<OTPUsecase>(() => OTPUsecase());

  serviceLocator
      .registerFactory<ResetPasswordUsecase>(() => ResetPasswordUsecase());

  //datasource
  serviceLocator
      .registerFactory<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl());

  serviceLocator
      .registerFactory<AuthLocalDatasource>(() => AuthLocalDatasourceImpl());

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

  serviceLocator
      .registerFactory<MenuLocalDatasource>(() => MenuLocalDatasourceImpl());

  serviceLocator.registerFactory<ReviewsRemoteDatasource>(
      () => ReviewsRemoteDatasourceImpl());

  serviceLocator.registerFactory<HistoryTransactionRemoteDatasource>(
      () => HistoryTransactionRemoteDatasourceImpl());

  serviceLocator.registerFactory<OrderTransactionRemoteDatasource>(
      () => OrderTransactionRemoteDatasourceImpl());

  serviceLocator.registerFactory<QueueRemoteDatasource>(
      () => QueueRemoteDatasourceImpl());

  serviceLocator.registerFactory<EwalletRemoteDatasource>(
      () => EwalletRemoteDatasourceImpl());

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

  serviceLocator
      .registerFactory<ReviewsRepository>(() => ReviewsRepositoryImpl());

  serviceLocator.registerFactory<HistoryTransactionRepository>(
      () => HistoryTransactionRepositoryImpl());

  serviceLocator.registerFactory<OrderTransactionRepository>(
      () => OrderTransactionRepositoryImpl());

  serviceLocator.registerFactory<QueueRepository>(() => QueueRepositoryImpl());

  serviceLocator
      .registerFactory<EwalletRepository>(() => EwalletRepositoryImpl());

  ///! Core
  /// sl.registerLazySingleton(() => InputConverter());
  serviceLocator.registerLazySingleton<NetworkChecker>(
      () => NetworkCheckerImpl(serviceLocator()));

  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerFactory<SharedPreferences>(() => sharedPreferences);

  // request
  serviceLocator.registerSingleton<Request>(Request());
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
}

import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/datasources/menu_restaurant/menu_remote_restaurant_datasource.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/get_menu_model.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/repositories/menu_restaurant_repository.dart';
import 'package:dartz/dartz.dart';

class MenuRestaurantRepositoryImpl implements MenuRestaurantRepository {
  @override
  Future<Either<Failure, List<GetMenuResponse>>> getMenuRestaurant(
      int mitraId) {
    return serviceLocator<MenuRestaurantRemoteDatasource>()
        .getMenuRestaurant(mitraId);
  }
}

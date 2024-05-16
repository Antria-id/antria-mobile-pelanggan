import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/data/data_source/restaurant/restaurant_remote_data_source.dart';
import 'package:antria_mobile_pelanggan/features/data/models/response/get_restaurant_model.dart';
import 'package:antria_mobile_pelanggan/features/domain/repository/restaurant_repository/restaurant_repository.dart';
import 'package:dartz/dartz.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  @override
  Future<Either<Failure, List<GetRestaurantResponse>>> getRestaurant() {
    return serviceLocator<RestaurantRemoteDatasource>().getRestaurant();
  }
}

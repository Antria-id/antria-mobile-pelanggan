import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/response/get_restaurant_model.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/repositories/restaurant_repository/restaurant_repository.dart';
import 'package:dartz/dartz.dart';

class GetRestaurantUsecase {
  Future<Either<Failure, List<GetRestaurantResponse>>> getRestaurant() async {
    final response =
        await serviceLocator<RestaurantRepository>().getRestaurant();
    return response;
  }
}

import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/features/data/models/response/get_restaurant_model.dart';
import 'package:dartz/dartz.dart';

abstract class RestaurantRepository {
  Future<Either<Failure, List<GetRestaurantResponse>>> getRestaurant();
}

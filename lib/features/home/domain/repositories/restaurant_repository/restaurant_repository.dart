import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/response/get_restaurant_model.dart';
import 'package:dartz/dartz.dart';

abstract class RestaurantRepository {
  Future<Either<Failure, List<GetRestaurantResponse>>> getRestaurant();
}

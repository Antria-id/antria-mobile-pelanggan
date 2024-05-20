import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/info_restaurant_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

abstract class InfoRestaurantRepository {
  Future<Either<Failure, GetInfoRestaurantResponse>> getInfoRestaurant(
      int mitraId);
}

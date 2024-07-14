import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/info_restaurant_model.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/repositories/info_restaurant_repository.dart';
import 'package:dartz/dartz.dart';

class GetInfoRestaurantUsecase {
  Future<Either<Failure, GetInfoRestaurantResponse>> getInfoRestaurant(
      int mitraId) async {
    final response = await serviceLocator<InfoRestaurantRepository>()
        .getInfoRestaurant(mitraId);
    return response;
  }
}

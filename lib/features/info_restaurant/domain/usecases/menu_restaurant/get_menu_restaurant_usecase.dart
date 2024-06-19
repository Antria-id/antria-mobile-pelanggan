import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/get_menu_model.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/repositories/menu_restaurant_repository.dart';
import 'package:dartz/dartz.dart';

class GetMenuUsecase {
  Future<Either<Failure, List<GetMenuResponse>>> getMenuRestaurant(
      int mitraId) async {
    final response = await serviceLocator<MenuRestaurantRepository>()
        .getMenuRestaurant(mitraId);
    return response;
  }
}

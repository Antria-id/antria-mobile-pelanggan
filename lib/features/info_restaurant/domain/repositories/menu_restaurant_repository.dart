import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/get_menu_model.dart';
import 'package:dartz/dartz.dart';

abstract class MenuRestaurantRepository {
  Future<Either<Failure, List<GetMenuResponse>>> getMenuRestaurant(int mitraId);
}

import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/get_menu_model.dart';
import 'package:dartz/dartz.dart';

abstract class MenuRestaurantRepository {
  Future<Either<Failure, List<GetMenuResponse>>> getMenuRestaurant(int mitraId);
  Future<Either<Failure, void>> addProductToOrderList(
      int productId, int quantity, String note);
  Future<Either<Failure, List<Map<String, dynamic>>>> getProductsInOrderList();
  Future<Either<Failure, void>> incrementOrderQuantity(
      int productId, int quantity);
  Future<Either<Failure, void>> decrementOrderQuantity(
      int productId, int quantity);
  Future<Either<Failure, void>> updateOrderList(int id, String note);
}

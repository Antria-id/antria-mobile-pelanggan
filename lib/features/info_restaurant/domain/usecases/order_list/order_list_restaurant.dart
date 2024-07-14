import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/datasources/menu_restaurant/menu_local_restaurant_datasource.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/get_menu_model.dart';
import 'package:dartz/dartz.dart';

class OrderListUsecase {
  Future<Either<Failure, List<GetMenuResponse>>> getLocalMenu() {
    return serviceLocator<MenuLocalDatasource>().getAllMenu();
  }

  Future<Either<Failure, List<Map<String, dynamic>>>> getProductsInOrderList() {
    return serviceLocator<MenuLocalDatasource>().getProductsInOrderList();
  }

  Future<Either<Failure, void>> addProduct(int productId, int quantity) {
    return serviceLocator<MenuLocalDatasource>().addProductToOrderList(
      productId,
      quantity,
    );
  }

  Future<Either<Failure, void>> incrementOrderQuantity(
      int productId, int quantity) {
    return serviceLocator<MenuLocalDatasource>().incrementOrderQuantity(
      productId,
      quantity,
    );
  }

  Future<Either<Failure, void>> decrementOrderQuantity(
      int productId, int quantity) {
    return serviceLocator<MenuLocalDatasource>().decrementOrderQuantity(
      productId,
      quantity,
    );
  }

  Future<Either<Failure, void>> insertPesanan(String invoice, String payment,
      int pelangganId, String pemesanan, bool takeaway, int mitraId) {
    return serviceLocator<MenuLocalDatasource>().insertPesanan(
      invoice,
      payment,
      pelangganId,
      pemesanan,
      takeaway,
      mitraId,
    );
  }

  Future<Either<Failure, void>> deleteAllProducts() {
    return serviceLocator<MenuLocalDatasource>().deleteAllProducts();
  }
}

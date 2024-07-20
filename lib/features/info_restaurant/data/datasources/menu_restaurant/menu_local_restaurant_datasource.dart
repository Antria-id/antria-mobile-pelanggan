import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/helper/database_helper.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/get_menu_model.dart';
import 'package:dartz/dartz.dart';

abstract class MenuLocalDatasource {
  Future<Either<Failure, List<GetMenuResponse>>> getAllMenu();
  Future<Either<Failure, void>> addProductToOrderList(
      int productId, int quantity, String note);
  Future<Either<Failure, List<Map<String, dynamic>>>> getProductsInOrderList();
  Future<Either<Failure, void>> incrementOrderQuantity(
      int productId, int quantity);
  Future<Either<Failure, void>> decrementOrderQuantity(
      int productId, int quantity);
  Future<Either<Failure, void>> deleteAllProducts();
  Future<Either<Failure, void>> insertPesanan(String invoice, String payment,
      int pelangganId, String pemesanan, bool takeaway, int mitraId);
  Future<Either<Failure, void>> updateOrderList(int id, String note);
}

class MenuLocalDatasourceImpl implements MenuLocalDatasource {
  @override
  Future<Either<Failure, List<GetMenuResponse>>> getAllMenu() async {
    try {
      final DatabaseHelper databaseHelper = DatabaseHelper.instance;
      final result = await databaseHelper.getMenuRestaurant();
      if (result.isNotEmpty) {
        final List<GetMenuResponse> products =
            result.map<GetMenuResponse>((json) {
          return GetMenuResponse.fromJson(json);
        }).toList();
        return Right(products);
      } else {
        return const Left(LocalDatabaseQueryFailure('No products found'));
      }
    } catch (e) {
      return Left(LocalDatabaseQueryFailure('Unable to retrieve products: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> addProductToOrderList(
      int productId, int quantity, String note) async {
    try {
      final DatabaseHelper databaseHelper = DatabaseHelper.instance;
      final DateTime now = DateTime.now();

      // Add product to orderList
      await databaseHelper.addOrderList(
        productId,
        quantity,
        note,
        now,
        now,
      );

      return const Right(null);
    } catch (e) {
      return Left(
        LocalDatabaseQueryFailure(
          'Unable add product to orderList: $e',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>>
      getProductsInOrderList() async {
    try {
      final DatabaseHelper databaseHelper = DatabaseHelper.instance;
      final result = await databaseHelper.getProductsInOrderList();
      if (result.isNotEmpty) {
        return Right(result);
      } else {
        return const Left(
            LocalDatabaseQueryFailure('No products in order list found'));
      }
    } catch (e) {
      return Left(LocalDatabaseQueryFailure(
          'Unable to retrieve products in order list: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> incrementOrderQuantity(
      int productId, int quantity) async {
    try {
      final DatabaseHelper databaseHelper = DatabaseHelper.instance;
      await databaseHelper.incrementOrderQuantity(productId, quantity);
      return const Right(null);
    } catch (e) {
      return Left(
          LocalDatabaseQueryFailure('Unable to increment order quantity: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> decrementOrderQuantity(
      int productId, int quantity) async {
    try {
      final DatabaseHelper databaseHelper = DatabaseHelper.instance;
      await databaseHelper.decrementOrderQuantity(productId, quantity);
      return const Right(null);
    } catch (e) {
      return Left(
          LocalDatabaseQueryFailure('Unable to decrement order quantity: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAllProducts() async {
    try {
      final DatabaseHelper databaseHelper = DatabaseHelper.instance;
      await databaseHelper.deleteAllProducts();
      return const Right(null);
    } catch (e) {
      return Left(
          LocalDatabaseQueryFailure('Unable to delete all products: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> insertPesanan(String invoice, String payment,
      int pelangganId, String pemesanan, bool takeaway, int mitraId) async {
    try {
      final DatabaseHelper databaseHelper = DatabaseHelper.instance;

      await databaseHelper.insertPesanan(
          invoice, payment, pelangganId, pemesanan, takeaway, mitraId);

      return const Right(null);
    } catch (e) {
      return Left(LocalDatabaseQueryFailure('Unable to insert pesanan: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrderList(int id, String note) async {
    try {
      final DatabaseHelper databaseHelper = DatabaseHelper.instance;

      await databaseHelper.updateOrderList(id, note);

      return const Right(null);
    } catch (e) {
      return Left(LocalDatabaseQueryFailure('Unable to insert pesanan: $e'));
    }
  }
}

import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/datasources/menu_restaurant/menu_local_restaurant_datasource.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/datasources/menu_restaurant/menu_remote_restaurant_datasource.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/get_menu_model.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/repositories/menu_restaurant_repository.dart';
import 'package:dartz/dartz.dart';

class MenuRestaurantRepositoryImpl extends MenuRestaurantRepository {
  final MenuRestaurantRemoteDatasource remoteDatasource =
      serviceLocator<MenuRestaurantRemoteDatasource>();
  final MenuLocalDatasource localDatasource =
      serviceLocator<MenuLocalDatasource>();
  @override
  Future<Either<Failure, List<GetMenuResponse>>> getMenuRestaurant(
      int mitraId) async {
    final localResult = await localDatasource.getAllMenu();
    return localResult.fold(
      (failure) async {
        final remoteResult = await remoteDatasource.getMenuRestaurant(mitraId);
        return remoteResult.fold(
          (remoteFailure) => Left(remoteFailure),
          (products) async {
            await localDatasource.getAllMenu();
            return Right(products);
          },
        );
      },
      (products) => Right(products),
    );
  }

  @override
  Future<Either<Failure, void>> addProductToOrderList(
      int productId, int quantity) async {
    try {
      await localDatasource.addProductToOrderList(productId, quantity);
      return const Right(null);
    } catch (e) {
      return Left(
          LocalDatabaseQueryFailure('Unable to add product to order list: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>>
      getProductsInOrderList() async {
    try {
      final result = await localDatasource.getProductsInOrderList();
      return result.fold(
        (failure) => Left(failure),
        (products) => Right(products),
      );
    } catch (e) {
      return Left(LocalDatabaseQueryFailure(
          'Unable to retrieve products in order list: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> decrementOrderQuantity(
      int productId, int quantity) async {
    try {
      final result =
          await localDatasource.decrementOrderQuantity(productId, quantity);
      return result.fold(
        (failure) => Left(failure),
        (_) => const Right(null),
      );
    } catch (e) {
      return Left(
          LocalDatabaseQueryFailure('Unable to decrement order quantity: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> incrementOrderQuantity(
      int productId, int quantity) async {
    try {
      final result =
          await localDatasource.incrementOrderQuantity(productId, quantity);
      return result.fold(
        (failure) => Left(failure),
        (_) => const Right(null),
      );
    } catch (e) {
      return Left(
          LocalDatabaseQueryFailure('Unable to increment order quantity: $e'));
    }
  }
}

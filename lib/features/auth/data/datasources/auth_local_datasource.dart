import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/helper/database_helper.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:dartz/dartz.dart';

abstract class AuthLocalDatasource {
  Future<Either<Failure, void>> deleteUserFromLocalStorage();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  @override
  Future<Either<Failure, void>> deleteUserFromLocalStorage() async {
    try {
      final DatabaseHelper databaseHelper = DatabaseHelper.instance;
      final deletionSuccess =
          await serviceLocator<UserCacheService>().deleteUser();
      if (deletionSuccess) {
        await databaseHelper.deleteAllProducts();
        return const Right(null);
      } else {
        return const Left(
          LocalDatabaseQueryFailure(
            'Unable to delete user from the shared prefs',
          ),
        );
      }
    } catch (e, stackTrace) {
      return Left(ParsingFailure(
          'Parsing failure occurred in HomeLocalUserDatasourceImpl: $e\nStack trace: $stackTrace'));
    }
  }
}

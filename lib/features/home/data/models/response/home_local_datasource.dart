import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/features/data/models/response/user_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeLocalUserDatasource {
  Future<Either<Failure, UserModel>> getUserFromLocalStorage();
  Future<Either<Failure, bool>> deleteUserFromLocalStorage();
}

class HomeLocalUserDatasourceImpl extends HomeLocalUserDatasource {
  @override
  Future<Either<Failure, UserModel>> getUserFromLocalStorage() async {
    try {
      final user = serviceLocator<UserCacheService>().user;
      if (user != null) {
        return Right(UserModel.fromJson((user.toJson())));
      }
      return const Left(
        LocalDatabaseQueryFailure('Unable to query form the shared prefs'),
      );
    } catch (e) {
      return const Left(
        ParsingFailure(
          'Parsing failure occured in HomepageLocalDataSourceImlp',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUserFromLocalStorage() async {
    try {
      final deletionSuccess =
          await serviceLocator<UserCacheService>().deleteUser();
      if (deletionSuccess) {
        return const Right(true);
      } else {
        return const Left(
          LocalDatabaseQueryFailure(
              'Unable to delete user from the shared prefs'),
        );
      }
    } catch (e) {
      return const Left(
        ParsingFailure(
          'Parsing failure occured in HomepageLocalDataSourceImlp',
        ),
      );
    }
  }
}

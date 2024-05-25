import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/user/user_response_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/update_pelanggan_request_mode.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileUserDatasource {
  Future<Either<Failure, PelangganModel>> getPelanggan();
  Future<Either<Failure, PelangganModel>> updatePelanggan(
      {required UpdatePelangganRequestModel requestModel});
  Future<Either<Failure, void>> deleteUserFromLocalStorage();
}

class ProfileUserDatasourceImpl extends ProfileUserDatasource {
  @override
  Future<Either<Failure, void>> deleteUserFromLocalStorage() async {
    try {
      final deletionSuccess =
          await serviceLocator<UserCacheService>().deleteUser();
      if (deletionSuccess) {
        return const Right(null);
      } else {
        return const Left(
          LocalDatabaseQueryFailure(
            'Unable to delete user from the shared prefs',
          ),
        );
      }
    } catch (e, stackTrace) {
      return Left(
        ParsingFailure(
            'Parsing failure occurred in HomeLocalUserDatasourceImpl: $e\nStack trace: $stackTrace'),
      );
    }
  }

  @override
  Future<Either<Failure, PelangganModel>> getPelanggan() async {
    try {
      final Request request = serviceLocator<Request>();
      final UserCacheService userCacheService =
          serviceLocator<UserCacheService>();
      final UserModel? user = await userCacheService.getUser();
      if (user == null) {
        return const Left(
          ParsingFailure('User not found'),
        );
      }
      final int id = user.sub!;
      final response = await request.get(APIUrl.getPelangganPath(id));
      if (response.statusCode == 200) {
        final PelangganModel pelangganResponse =
            PelangganModel.fromJson(response.data);
        return Right(
          pelangganResponse,
        );
      }
      return Left(
        ConnectionFailure(response.data['message']),
      );
    } catch (e) {
      return const Left(
        ParsingFailure('Unable to parse the response'),
      );
    }
  }

  @override
  Future<Either<Failure, PelangganModel>> updatePelanggan(
      {required UpdatePelangganRequestModel requestModel}) async {
    try {
      final Request request = serviceLocator<Request>();
      final UserCacheService userCacheService =
          serviceLocator<UserCacheService>();
      final UserModel? user = await userCacheService.getUser();
      if (user == null) {
        return const Left(
          ParsingFailure('User not found'),
        );
      }
      final int id = user.sub!;
      final response = await request.put(
        APIUrl.getPelangganPath(id),
        data: requestModel.toJson(),
      );
      if (response.statusCode == 200) {
        final PelangganModel pelangganResponse =
            PelangganModel.fromJson(response.data);
        return Right(
          pelangganResponse,
        );
      }
      return Left(
        ConnectionFailure(response.data['message']),
      );
    } catch (e) {
      return const Left(
        ParsingFailure('Unable to parse the response'),
      );
    }
  }
}

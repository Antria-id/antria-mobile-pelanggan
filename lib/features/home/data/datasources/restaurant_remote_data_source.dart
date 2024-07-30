import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/response/get_restaurant_model.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/user/user_response_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:dartz/dartz.dart';

abstract class RestaurantRemoteDatasource {
  Future<Either<Failure, PelangganModel>> getUserInfo();
  Future<Either<Failure, List<GetRestaurantResponse>>> getRestaurant();
}

class RestaurantRemoteDatasourceImpl implements RestaurantRemoteDatasource {
  @override
  Future<Either<Failure, PelangganModel>> getUserInfo() async {
    try {
      final Request request = serviceLocator<Request>();
      final UserCacheService userCacheService =
          serviceLocator<UserCacheService>();
      final UserModel? user = await userCacheService.getUser();
      if (user == null) {
        return const Left(ParsingFailure('User not found'));
      }
      final int id = user.sub!;
      final response = await request.get(APIUrl.getPelangganPath(id));

      if (response.statusCode == 200) {
        final PelangganModel pelangganModel =
            PelangganModel.fromJson(response.data);
        return Right(pelangganModel);
      } else {
        return Left(ConnectionFailure(response.data['message']));
      }
    } catch (e) {
      return Left(ParsingFailure('Unable to parse the response: $e'));
    }
  }

  @override
  Future<Either<Failure, List<GetRestaurantResponse>>> getRestaurant() async {
    try {
      final Request request = serviceLocator<Request>();
      final response = await request.get(APIUrl.getRestaurantPath);

      if (response.statusCode == 200) {
        final dynamic responseData = response.data;
        if (responseData is List<dynamic>) {
          final List<GetRestaurantResponse> products = responseData
              .map((json) => GetRestaurantResponse.fromJson(json))
              .toList();
          return Right(products);
        } else {
          return const Left(ParsingFailure('Invalid response format'));
        }
      } else {
        return Left(ConnectionFailure(response.data['message']));
      }
    } catch (e) {
      return Left(ParsingFailure('Unable to parse the response: $e'));
    }
  }
}

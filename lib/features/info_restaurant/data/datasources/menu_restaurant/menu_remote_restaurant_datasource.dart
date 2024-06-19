import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/helper/database_helper.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/user/user_response_model.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/get_menu_model.dart';
import 'package:dartz/dartz.dart';

abstract class MenuRestaurantRemoteDatasource {
  Future<Either<Failure, List<GetMenuResponse>>> getMenuRestaurant(
    int mitraId,
  );
}

class MenuRestaurantRemoteDatasourceImpl
    implements MenuRestaurantRemoteDatasource {
  @override
  Future<Either<Failure, List<GetMenuResponse>>> getMenuRestaurant(
      int mitraId) async {
    try {
      final Request request = serviceLocator<Request>();
      final UserCacheService userCacheService =
          serviceLocator<UserCacheService>();
      final UserModel? user = await userCacheService.getUser();
      if (user == null) {
        return const Left(ParsingFailure('User not found'));
      }
      final response = await request
          .getById(APIUrl.getMenuRestaurantPath(mitraId), queryParameters: {
        'id': mitraId,
      });

      if (response.statusCode == 200) {
        final dynamic responseData = response.data;
        if (responseData is List<dynamic>) {
          final List<GetMenuResponse> menu = responseData
              .map((json) => GetMenuResponse.fromJson(json))
              .toList();
          final DatabaseHelper databaseHelper = DatabaseHelper.instance;
          for (final product in menu) {
            await databaseHelper.insertProduct(product);
          }
          return Right(menu);
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

import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
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
      final response = await request.getById(
          APIUrl.getMenuRestaurantPath(mitraId),
          queryParameters: {'id': mitraId});
      if (response.statusCode == 200) {
        final dynamic responseData = response.data;
        if (responseData is List<dynamic>) {
          final List<GetMenuResponse> products = responseData
              .map((json) => GetMenuResponse.fromJson(json))
              .toList();
          return Right(products);
        } else {
          return const Left(ParsingFailure('Invalid response format'));
        }
      } else {
        return Left(ConnectionFailure(response.data['message']));
      }
    } catch (e) {
      return const Left(
        ParsingFailure('Unable to parse the response'),
      );
    }
  }
}

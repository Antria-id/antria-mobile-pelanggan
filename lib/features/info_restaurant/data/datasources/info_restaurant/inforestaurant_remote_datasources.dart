import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/info_restaurant_model.dart';
import 'package:dartz/dartz.dart';

abstract class InfoRestaurantRemoteDatasource {
  Future<Either<Failure, GetInfoRestaurantResponse>> getInfoRestaurant(
    int mitraId,
  );
}

class InfoRestaurantRemoteDatasourceImpl
    implements InfoRestaurantRemoteDatasource {
  @override
  Future<Either<Failure, GetInfoRestaurantResponse>> getInfoRestaurant(
      int mitraId) async {
    try {
      final Request request = serviceLocator<Request>();
      final response = await request.getById(
          APIUrl.getInfoRestaurantPath(mitraId),
          queryParameters: {'id': mitraId});
      if (response.statusCode == 200) {
        final GetInfoRestaurantResponse infoRestaurant =
            GetInfoRestaurantResponse.fromJson(response.data);
        return Right(
          infoRestaurant,
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

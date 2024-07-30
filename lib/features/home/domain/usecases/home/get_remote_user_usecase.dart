import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/home/data/datasources/restaurant_remote_data_source.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:dartz/dartz.dart';

class GetUserRemoteUsecase {
  Future<Either<Failure, PelangganModel>> getUser() async {
    return serviceLocator<RestaurantRemoteDatasource>().getUserInfo();
  }
}

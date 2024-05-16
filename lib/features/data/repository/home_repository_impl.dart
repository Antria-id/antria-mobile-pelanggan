import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/data/data_source/home/home_local_datasource.dart';
import 'package:antria_mobile_pelanggan/features/data/models/response/user_response_model.dart';
import 'package:antria_mobile_pelanggan/features/domain/repository/home_repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<Either<Failure, UserModel>> getUserFromLocalStorage() {
    return serviceLocator<HomeLocalUserDatasource>().getUserFromLocalStorage();
  }
}

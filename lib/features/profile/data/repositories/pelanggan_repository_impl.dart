import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/update_pelanggan_request_mode.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/repositories/pelanggan_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  @override
  Future<Either<Failure, void>> deleteUserFromLocalStorage() {
    return serviceLocator<ProfileUserDatasource>().deleteUserFromLocalStorage();
  }

  @override
  Future<Either<Failure, PelangganModel>> getPelanggan() {
    return serviceLocator<ProfileUserDatasource>().getPelanggan();
  }

  @override
  Future<Either<Failure, PelangganModel>> updatePelanggan({
    required UpdatePelangganRequestModel requestModel,
  }) {
    return serviceLocator<ProfileUserDatasource>().updatePelanggan(
      requestModel: requestModel,
    );
  }
}

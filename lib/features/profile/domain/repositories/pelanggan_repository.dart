import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/update_pelanggan_request_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, PelangganModel>> getPelanggan();
  Future<Either<Failure, void>> deleteUserFromLocalStorage();
  Future<Either<Failure, PelangganModel>> updatePelanggan({
    required UpdatePelangganRequestModel requestModel,
  });
}

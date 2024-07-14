import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/update_pelanggan_request_mode.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/repositories/pelanggan_repository.dart';
import 'package:dartz/dartz.dart';

class UpdatePelangganUsecase {
  Future<Either<Failure, PelangganModel>> updatePelanggan(
      UpdatePelangganRequestModel request) async {
    final response = await serviceLocator<ProfileRepository>()
        .updatePelanggan(requestModel: request);
    return response;
  }
}

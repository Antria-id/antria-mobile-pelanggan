import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/data/models/update_ewallet_model.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/domain/repositories/ewallet_repository.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:dartz/dartz.dart';

class EwalletUsecase {
  Future<Either<Failure, PelangganModel>> addWallet(
      UpdateEwalletModel request) async {
    final response = await serviceLocator<EwalletRepository>()
        .addWallet(updateEwallet: request);
    return response;
  }
}

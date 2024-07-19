import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/data/models/update_ewallet_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:dartz/dartz.dart';

abstract class EwalletRepository {
  Future<Either<Failure, PelangganModel>> addWallet({
    required UpdateEwalletModel updateEwallet,
  });
}

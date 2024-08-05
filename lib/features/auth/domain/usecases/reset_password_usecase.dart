import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/repositories/auth_repository.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:dartz/dartz.dart';

class ResetPasswordUsecase {
  Future<Either<Failure, PelangganModel>> updatePassword(
      {required String password,
      required int id,
      required String token}) async {
    final response = await serviceLocator<AuthRepository>()
        .updatePassword(password: password, id: id, token: token);
    return response;
  }
}

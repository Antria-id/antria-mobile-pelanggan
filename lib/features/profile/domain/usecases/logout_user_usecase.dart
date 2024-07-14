import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/repositories/pelanggan_repository.dart';
import 'package:dartz/dartz.dart';

class LogoutUserUsecase {
  Future<Either<Failure, void>> deleteUserFromLocalStorage() async {
    final response =
        await serviceLocator<ProfileRepository>().deleteUserFromLocalStorage();
    if (response.isRight()) {
      serviceLocator<Request>().clearAuthorization();
    }
    return response;
  }
}

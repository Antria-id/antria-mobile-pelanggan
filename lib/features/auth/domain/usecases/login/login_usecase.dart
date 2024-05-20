import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/login_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/login_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase {
  Future<Either<Failure, LoginResponse>> loginUser(LoginRequest user) async {
    final response =
        await serviceLocator<AuthRepository>().loginUser(user: user);
    if (response.isRight()) {
      final remoteUser = response.getOrElse(() => LoginResponse());
      serviceLocator<Request>().updateAuthorization(
        remoteUser.accessToken!,
      );
    }
    return response;
  }
}

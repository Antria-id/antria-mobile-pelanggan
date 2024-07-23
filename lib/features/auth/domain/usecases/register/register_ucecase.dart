import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/register_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/resgister_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUsecase {
  Future<Either<Failure, RegisterResponse>> registerUser(
      RegisterRequest requestUser) async {
    final response = await serviceLocator<AuthRepository>()
        .registerUser(requestUser: requestUser);
    return response;
  }
}

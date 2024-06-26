import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/data/data_source/auth/auth_remote_data_source.dart';
import 'package:antria_mobile_pelanggan/features/data/models/request/login_request_model.dart';
import 'package:antria_mobile_pelanggan/features/data/models/request/register_request_model.dart';
import 'package:antria_mobile_pelanggan/features/data/models/response/login_response_model.dart';
import 'package:antria_mobile_pelanggan/features/data/models/response/resgister_response_model.dart';
import 'package:antria_mobile_pelanggan/features/domain/repository/auth_repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, LoginResponse>> loginUser(
      {required LoginRequest user}) {
    return serviceLocator<AuthRemoteDatasource>().loginUser(user: user);
  }

  @override
  Future<Either<Failure, RegisterResponse>> registerUser(
      {required RegisterRequest user}) {
    return serviceLocator<AuthRemoteDatasource>()
        .registerUser(requestUser: user);
  }
}

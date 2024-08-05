import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/login_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/register_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/login_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/resgister_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/send_email_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/verify_otp_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/repositories/auth_repository.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, LoginResponse>> loginUser(
      {required LoginRequest user}) {
    return serviceLocator<AuthRemoteDatasource>().loginUser(user: user);
  }

  @override
  Future<Either<Failure, RegisterResponse>> registerUser(
      {required RegisterRequest requestUser}) {
    return serviceLocator<AuthRemoteDatasource>()
        .registerUser(requestUser: requestUser);
  }

  @override
  Future<Either<Failure, void>> deleteUserFromLocalStorage() {
    return serviceLocator<AuthLocalDatasource>().deleteUserFromLocalStorage();
  }

  @override
  Future<Either<Failure, SendEmailResponse>> getOTP({required String email}) {
    return serviceLocator<AuthRemoteDatasource>().getOTP(email: email);
  }

  @override
  Future<Either<Failure, VerifyOtpResponse>> verifyOTP(
      {required String email, required int otp}) {
    return serviceLocator<AuthRemoteDatasource>()
        .verifyOTP(email: email, otp: otp);
  }

  @override
  Future<Either<Failure, PelangganModel>> updatePassword(
      {required String password, required int id, required String token}) {
    return serviceLocator<AuthRemoteDatasource>()
        .updatePassword(password: password, id: id, token: token);
  }
}

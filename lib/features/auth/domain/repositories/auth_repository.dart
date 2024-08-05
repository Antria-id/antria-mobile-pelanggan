import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/login_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/register_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/login_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/resgister_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/send_email_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/verify_otp_response_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> loginUser(
      {required LoginRequest user});
  Future<Either<Failure, RegisterResponse>> registerUser(
      {required RegisterRequest requestUser});
  Future<Either<Failure, void>> deleteUserFromLocalStorage();
  Future<Either<Failure, SendEmailResponse>> getOTP({required String email});
  Future<Either<Failure, VerifyOtpResponse>> verifyOTP(
      {required String email, required int otp});
  Future<Either<Failure, PelangganModel>> updatePassword(
      {required String password, required int id, required String token});
}

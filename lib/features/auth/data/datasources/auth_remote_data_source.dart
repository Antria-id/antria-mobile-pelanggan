import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/login_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/register_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/login_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/resgister_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/send_email_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/verify_otp_response_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failure, LoginResponse>> loginUser(
      {required LoginRequest user});
  Future<Either<Failure, RegisterResponse>> registerUser(
      {required RegisterRequest requestUser});
  Future<Either<Failure, SendEmailResponse>> getOTP({required String email});
  Future<Either<Failure, VerifyOtpResponse>> verifyOTP(
      {required String email, required int otp});
  Future<Either<Failure, PelangganModel>> updatePassword(
      {required String password, required int id, required String token});
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Request request = serviceLocator<Request>();
  final UserCacheService userCacheService = serviceLocator<UserCacheService>();
  @override
  Future<Either<Failure, LoginResponse>> loginUser(
      {required LoginRequest user}) async {
    try {
      final response = await request.post(
        APIUrl.loginUserPath,
        data: user.toJson(),
      );
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        await userCacheService.saveAccessToken(loginResponse.accessToken!);
        await userCacheService.setToken(loginResponse.accessToken!);
        return Right(loginResponse);
      }
      return Left(ConnectionFailure(response.data['message']));
    } catch (e) {
      debugPrint('LoginRemoteDataSourceImplError $e');
      return const Left(
        Exception('Exception Occured in LoginRemoteDataSourceImpl'),
      );
    }
  }

  @override
  Future<Either<Failure, RegisterResponse>> registerUser(
      {required RegisterRequest requestUser}) async {
    try {
      final response = await request.post(
        APIUrl.registerUserPath,
        data: requestUser.toJson(),
      );
      if (response.statusCode == 201) {
        RegisterResponse registerResponse =
            RegisterResponse.fromJson(response.data);
        return Right(registerResponse);
      }
      return Left(ConnectionFailure(response.data['message']));
    } catch (e) {
      debugPrint('LoginRemoteDataSourceImplError $e');
      return const Left(
        Exception('Exception Occured in LoginRemoteDataSourceImpl'),
      );
    }
  }

  @override
  Future<Either<Failure, SendEmailResponse>> getOTP(
      {required String email}) async {
    try {
      final response = await request.post(
        APIUrl.postForgotPasswordPath(email),
      );
      if (response.statusCode == 201) {
        SendEmailResponse sendEmailResponse =
            SendEmailResponse.fromJson(response.data);
        return Right(sendEmailResponse);
      }
      return Left(ConnectionFailure(response.data['message']));
    } catch (e) {
      return const Left(
        Exception('Exception Occured in AuthRemoteDataSourceImpl'),
      );
    }
  }

  @override
  Future<Either<Failure, VerifyOtpResponse>> verifyOTP(
      {required String email, required int otp}) async {
    try {
      final response = await request.post(
        APIUrl.postVerifyOTPPath(email, otp),
      );
      if (response.statusCode == 201) {
        VerifyOtpResponse verifyOtpResponse =
            VerifyOtpResponse.fromJson(response.data);
        return Right(verifyOtpResponse);
      }
      return Left(ConnectionFailure(response.data['message']));
    } catch (e) {
      return const Left(
        Exception('Exception Occured in AuthRemoteDataSourceImpl'),
      );
    }
  }

  @override
  Future<Either<Failure, PelangganModel>> updatePassword(
      {required String password,
      required int id,
      required String token}) async {
    try {
      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final response = await request.put(
        APIUrl.getPelangganPath(id),
        headers: headers,
        data: {'password': password},
      );
      if (response.statusCode == 200) {
        PelangganModel pelangganModel = PelangganModel.fromJson(response.data);
        return Right(pelangganModel);
      }
      return Left(ConnectionFailure(response.data['message']));
    } catch (e) {
      return const Left(
        Exception('Exception Occured in AuthRemoteDataSourceImpl'),
      );
    }
  }
}

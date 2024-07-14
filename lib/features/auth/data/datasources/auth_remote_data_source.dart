import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/login_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/register_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/login_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/resgister_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failure, LoginResponse>> loginUser(
      {required LoginRequest user});
  Future<Either<Failure, RegisterResponse>> registerUser(
      {required RegisterRequest requestUser});
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
}

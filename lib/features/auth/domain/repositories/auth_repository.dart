import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/features/data/models/request/login_request_model.dart';
import 'package:antria_mobile_pelanggan/features/data/models/request/register_request_model.dart';
import 'package:antria_mobile_pelanggan/features/data/models/response/login_response_model.dart';
import 'package:antria_mobile_pelanggan/features/data/models/response/resgister_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> loginUser(
      {required LoginRequest user});
  Future<Either<Failure, RegisterResponse>> registerUser(
      {required RegisterRequest user});
}

import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/send_email_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/verify_otp_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class OTPUsecase {
  Future<Either<Failure, SendEmailResponse>> sendOtp(
      {required String email}) async {
    final response =
        await serviceLocator<AuthRepository>().getOTP(email: email);
    return response;
  }

  Future<Either<Failure, VerifyOtpResponse>> verifyOTP({
    required String email,
    required int otp,
  }) async {
    final response = await serviceLocator<AuthRepository>()
        .verifyOTP(email: email, otp: otp);
    return response;
  }
}

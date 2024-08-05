import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/login_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/register_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/login_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/resgister_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/verify_otp_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/usecases/login/login_usecase.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/usecases/otp_usecase.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/usecases/register/register_ucecase.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/user/user_response_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/usecases/logout_user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

// auth_bloc.dart
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginButtonTapped) {
        final response = event.request;
        emit(LoginLoading());
        var result = await serviceLocator<LoginUsecase>().loginUser(response);
        result.fold(
          (failure) {
            emit(LoginFailed(message: failure.message));
          },
          (data) {
            emit(LoginSuccess(response: data));
          },
        );
      }

      if (event is RegisterButtonTapped) {
        final response = event.request;
        emit(RegisterLoading());
        var result =
            await serviceLocator<RegisterUsecase>().registerUser(response);
        result.fold(
          (failure) {
            emit(RegisterFailed(message: failure.message));
          },
          (data) {
            emit(
              RegisterSuccess(response: data),
            );
          },
        );
      }

      if (event is SendEmailTapped) {
        final request = event.email;
        emit(SendOTPLoading());
        var result = await serviceLocator<OTPUsecase>().sendOtp(email: request);
        result.fold(
          (failure) {
            emit(SendOTPFailed(message: failure.message));
          },
          (data) {
            emit(
              SendOTPSuccess(email: request),
            );
          },
        );
      }

      if (event is VerifyOTPTapped) {
        final requestEmail = event.email;
        final requestOtp = event.otp;
        emit(VerifyOTPLoading());
        var result = await serviceLocator<OTPUsecase>()
            .verifyOTP(email: requestEmail, otp: requestOtp);
        result.fold(
          (failure) {
            emit(VerifyOTPFailed(message: failure.message));
          },
          (data) {
            emit(
              VerifyOTPSuccess(response: data),
            );
          },
        );
      }

      if (event is UpdatePasswordTapped) {
        final requestId = event.id;
        final requestPassword = event.password;
        final requestToken = event.token;
        emit(UpdatePasswordLoading());
        var result =
            await serviceLocator<ResetPasswordUsecase>().updatePassword(
          id: requestId,
          password: requestPassword,
          token: requestToken,
        );
        result.fold(
          (failure) {
            emit(UpdatePasswordFailed(message: failure.message));
          },
          (data) {
            emit(
              UpdatePasswordSuccess(password: requestPassword),
            );
          },
        );
      }

      if (event is LogoutTapped) {
        emit(LogoutLoading());
        var result = await serviceLocator<LogoutUserUsecase>()
            .deleteUserFromLocalStorage();
        result.fold(
          (failure) {
            emit(LogoutFailed(message: failure.message));
          },
          (data) {
            emit(const LogoutSuccess(user: null));
          },
        );
      }
    });
  }
}

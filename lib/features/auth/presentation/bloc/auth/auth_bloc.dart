import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/login_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/register_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/login_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/resgister_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/usecases/login/login_usecase.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/usecases/register/register_ucecase.dart';
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

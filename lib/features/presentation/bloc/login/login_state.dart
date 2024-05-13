part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitialState;
  const factory LoginState.loading() = LoginLoadingState;
  const factory LoginState.error(String message) = LoginErrorState;
  const factory LoginState.loaded({
    required LoginRequest user,
  }) = LoginLoadedState;
}

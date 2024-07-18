part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final LoginResponse response;

  const LoginSuccess({required this.response});
}

final class LoginFailed extends AuthState {
  final String? message;

  const LoginFailed({required this.message});
}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {
  final RegisterResponse response;

  const RegisterSuccess({required this.response});
}

final class RegisterFailed extends AuthState {
  final String? message;

  const RegisterFailed({required this.message});
}

final class LogoutLoading extends AuthState {}

final class LogoutSuccess extends AuthState {
  final UserModel? user;

  const LogoutSuccess({required this.user});
}

final class LogoutFailed extends AuthState {
  final String? message;

  const LogoutFailed({required this.message});
}

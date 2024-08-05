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

final class SendOTPLoading extends AuthState {}

final class SendOTPSuccess extends AuthState {
  final String email;

  SendOTPSuccess({required this.email});
}

final class SendOTPFailed extends AuthState {
  final String? message;

  const SendOTPFailed({required this.message});
}

final class VerifyOTPLoading extends AuthState {}

final class VerifyOTPSuccess extends AuthState {
  final VerifyOtpResponse response;

  VerifyOTPSuccess({required this.response});
}

final class VerifyOTPFailed extends AuthState {
  final String? message;

  VerifyOTPFailed({required this.message});
}

final class UpdatePasswordLoading extends AuthState {}

final class UpdatePasswordSuccess extends AuthState {
  final String password;

  const UpdatePasswordSuccess({required this.password});

  @override
  List<Object> get props => [password];
}

final class UpdatePasswordFailed extends AuthState {
  final String message;

  const UpdatePasswordFailed({required this.message});

  @override
  List<Object> get props => [message];
}

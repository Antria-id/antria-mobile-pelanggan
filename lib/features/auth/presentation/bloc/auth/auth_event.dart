part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class LoginButtonTapped extends AuthEvent {
  final LoginRequest request;

  const LoginButtonTapped({required this.request});
  @override
  List<Object> get props => [request];
}

final class RegisterButtonTapped extends AuthEvent {
  final RegisterRequest request;

  const RegisterButtonTapped({required this.request});

  @override
  List<Object> get props => [request];
}

final class SendEmailTapped extends AuthEvent {
  final String email;

  SendEmailTapped({required this.email});

  @override
  List<Object> get props => [email];
}

final class VerifyOTPTapped extends AuthEvent {
  final String email;

  final int otp;

  VerifyOTPTapped({required this.email, required this.otp});

  @override
  List<Object> get props => [email, otp];
}

class UpdatePasswordTapped extends AuthEvent {
  final int id;
  final String password;
  final String token;

  const UpdatePasswordTapped(
      {required this.id, required this.password, required this.token});

  @override
  List<Object> get props => [id, password, token];
}

final class LogoutTapped extends AuthEvent {}

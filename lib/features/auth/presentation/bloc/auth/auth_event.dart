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

final class LogoutTapped extends AuthEvent {}

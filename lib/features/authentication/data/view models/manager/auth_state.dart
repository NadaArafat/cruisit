part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignInSuccess extends AuthState {}

final class SignInError extends AuthState {
  final String message;
  SignInError({required this.message});
}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignUpError extends AuthState {
  final String message;
  SignUpError({required this.message});
}

final class SignOutLoading extends AuthState {}

final class SignOutSuccess extends AuthState {}

final class SignOutError extends AuthState {
  final String message;
  SignOutError({required this.message});
}

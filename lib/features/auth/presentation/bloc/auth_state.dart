part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoaded extends AuthState {
  final User user;

  AuthLoaded({required this.user});
}

final class AuthFailure extends AuthState {
  final String textError;

  AuthFailure({required this.textError});
}

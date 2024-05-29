part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class Authsuccess extends AuthState {
  final String message;

  Authsuccess({required this.message});
}

final class Authfailure extends AuthState {
  final String message;

  Authfailure({required this.message});
}

// final class Authloading extends AuthState {}

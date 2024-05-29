part of 'auth_bloc.dart';

sealed class AuthEvent {}

class AuthReq extends AuthEvent {
  final String email;
  final String password;
  AuthReq({required this.email, required this.password});
}

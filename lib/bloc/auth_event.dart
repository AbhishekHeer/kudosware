part of 'auth_bloc.dart';

sealed class AuthEvent {}

class AuthReq extends AuthEvent {
  final String email;
  final String password;
  AuthReq({required this.email, required this.password});
}

final class LoginReq extends AuthEvent {
  final String email;
  final String password;
  LoginReq({required this.email, required this.password});
}

final class Calander extends AuthEvent {
  final String date;
  Calander({required this.date});
}

final class Dropdown extends AuthEvent {
  final String dropdown;
  Dropdown({required this.dropdown});
}

final class Storedata extends AuthEvent {
  final String uid;
  final String name;
  final String dob;
  final String gender;
  Storedata(
      {required this.uid,
      required this.name,
      required this.dob,
      required this.gender});
}

final class Getdata extends AuthEvent {}

part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class Authsuccess extends AuthState {
  final UserModel model;
  Authsuccess({required this.model});
}

final class Authfailure extends AuthState {
  final String message;

  Authfailure({required this.message});
}

final class AuthLoading extends AuthState {}

final class Loginrequest extends AuthState {}

final class Loginfailure extends AuthState {
  final String message;

  Loginfailure({required this.message});
}

final class LoginSuccess extends AuthState {
  final UserModel model;

  LoginSuccess({required this.model});
}

final class Picked extends AuthState {
  final String pickeddate;

  Picked({required this.pickeddate});
}

final class DropD extends AuthState {
  final String dropdown;

  DropD({required this.dropdown});
}

final class Store extends AuthState {
  final DBmodel storedata;

  Store({required this.storedata});
}

final class Get extends AuthState {
  final String data;

  Get({required this.data});
}

final class Storeerror extends AuthState {
  final String error;
  Storeerror({required this.error});
}

final class StoreSuccess extends AuthState {
  final String success;
  StoreSuccess({required this.success});
}

final class Getdataerror extends AuthState {
  final String error;
  Getdataerror({required this.error});
}

final class Proccess extends AuthState {
  final bool logged;
  Proccess({required this.logged});
}

final class Dataload extends AuthState {}

part of 'navigate_bloc.dart';

sealed class NavigateState {
  final int index;

  const NavigateState({required this.index});
}

final class NavigateInitial extends NavigateState {
  const NavigateInitial({required super.index});
}

final class Signup extends NavigateState {
  const Signup({required super.index});
}

part of 'navigate_bloc.dart';

sealed class NavigateEvent {}

class Tagchange extends NavigateEvent {
  final int tabindex;

  Tagchange({required this.tabindex});
}

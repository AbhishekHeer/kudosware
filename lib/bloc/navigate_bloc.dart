import 'package:bloc/bloc.dart';

part 'navigate_event.dart';
part 'navigate_state.dart';

class NavigateBloc extends Bloc<NavigateEvent, NavigateState> {
  NavigateBloc() : super(const NavigateInitial(index: 0)) {
    on<NavigateEvent>((event, emit) {
      if (event is Tagchange) {
        emit(NavigateInitial(index: event.tabindex));
      }
    });
  }
}

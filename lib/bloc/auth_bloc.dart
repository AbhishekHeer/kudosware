import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kudosware/Auth/loginbody.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthReq>((event, emit) async {
      try {
        final Auth = FirebaseAuth.instance;

        final logined = await Auth.signInWithEmailAndPassword(
            email: event.email, password: event.password);

        if (logined == true) {
          emit(Authsuccess(message: "Login Successfully"));
        } else {
          emit(Authfailure(message: "Login Failed"));
        }
      } on FirebaseAuthException catch (e) {
        emit(Authfailure(message: e.toString()));
        print(e);
      }
    });
  }
}

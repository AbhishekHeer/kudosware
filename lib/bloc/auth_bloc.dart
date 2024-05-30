import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kudosware/models/usermodel.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthReq>((event, emit) async {
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(Authfailure(message: "Please fill all the fields"));
      }
      try {
        final auth = FirebaseAuth.instance;
        final store = FirebaseFirestore.instance;

        final logined = await auth.signInWithEmailAndPassword(
            email: event.email, password: event.password);

        if (logined == true) {
          UserModel user =
              UserModel(name: "name", email: event.email, pic: event.password);
          String id = DateTime.now().microsecondsSinceEpoch.toString();
          await store.collection("user").doc(id).set(user.toJson());
          emit(Authsuccess(model: user));
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

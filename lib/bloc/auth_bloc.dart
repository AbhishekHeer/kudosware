import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kudosware/models/db.dart';
import 'package:kudosware/models/usermodel.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    //create account
    on<AuthReq>((event, emit) async {
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(Authfailure(message: "Please fill all the fields"));
      }

      if (!event.email.contains('@')) {
        emit(Authfailure(message: "Please enter a valid email"));
        return;
      }

      try {
        final auth = FirebaseAuth.instance;
        final store = FirebaseFirestore.instance;

        await auth.createUserWithEmailAndPassword(
            email: event.email, password: event.password);

        UserModel user =
            UserModel(name: "name", email: event.email, pic: event.password);
        String id = DateTime.now().microsecondsSinceEpoch.toString();
        await store.collection("user").doc(id).set(user.toJson());
        emit(Authsuccess(model: user));
      } on FirebaseAuthException catch (e) {
        emit(Authfailure(message: e.toString()));
        throw Exception(e);
      }
    });

//login
    on<LoginReq>((event, emit) async {
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(Loginfailure(message: "Please fill all the fields"));
      }

      if (!event.email.contains('@')) {
        emit(Loginfailure(message: "Please enter a valid email"));
        return;
      }

      final auth = FirebaseAuth.instance;
      emit(Proccess());

      try {
        await auth.signInWithEmailAndPassword(
            email: event.email, password: event.password);

        UserModel user =
            UserModel(name: "name", email: event.email, pic: event.password);
        emit(LoginSuccess(model: user));
      } on FirebaseAuthException catch (e) {
        emit(Loginfailure(message: e.toString()));
      }
    });

    on<Calander>((event, emit) {
      emit(Picked(pickeddate: event.date.substring(0, 10)));
    });

    on<Dropdown>((event, emit) {
      emit(DropD(dropdown: event.dropdown));
    });

//store data

    on<Storedata>((event, emit) async {
      try {
        final store = FirebaseFirestore.instance;
        final id = DateTime.now().microsecondsSinceEpoch.toString();

        DBmodel userdata = DBmodel(
            uid: id, name: event.name, dob: event.dob, gender: event.gender);
        await store.collection("student").doc(id).set(userdata.toJson());
        emit(StoreSuccess(success: "Data Stored"));
      } catch (e) {
        emit(Storeerror(error: e.toString()));
      }
    });

    on<Getdata>((event, emit) async {
      emit(Dataload());
      final data = FirebaseFirestore.instance.collection('student');
      emit(Get(data: "Data Loaded"));

      data.get().then((value) {
        emit(Dataload());
        emit(Get(data: value.toString()));
      });
    });
  }
}

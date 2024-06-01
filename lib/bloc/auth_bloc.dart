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

      if (event.password.length < 6) {
        emit(Loginfailure(
            message: "Password must be atleast 6 characters long"));
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
        await store.collection("user").doc(id).set(user.toJson()).then((value) {
          emit(Authsuccess(model: user));
        }).whenComplete(() {
          emit(Authsuccess(model: user));
        });
      } on FirebaseAuthException catch (e) {
        emit(Authfailure(message: "Email already used by another account"));
        throw Exception(e);
      }
    });

//login
    on<LoginReq>((event, emit) async {
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(Loginfailure(message: "Please fill all the fields"));

        return;
      }

      if (!event.email.contains('@')) {
        emit(Loginfailure(message: "Please enter a valid email"));
        return;
      }

      if (event.password.length < 6) {
        emit(Loginfailure(
            message: "Password must be atleast 6 characters long"));
        return;
      }

      final auth = FirebaseAuth.instance;

      try {
        emit(Proccess(logged: true));
        await auth
            .signInWithEmailAndPassword(
                email: event.email, password: event.password)
            .then((value) async {
          final user =
              UserModel(name: "name", email: event.email, pic: event.password);
          final store = FirebaseFirestore.instance;
          String id = DateTime.now().microsecondsSinceEpoch.toString();
          await store.collection("user").doc(id).set(user.toJson());

          emit(LoginSuccess());
        }).whenComplete(() {
          emit(Proccess(logged: false));
          emit(LoginSuccess());
        }).onError((error, stackTrace) {
          emit(Loginfailure(message: error.toString()));
        });
      } on FirebaseAuthException catch (e) {
        emit(Loginfailure(message: e.toString()));

        if (e.message ==
            "The password is invalid or the user does not have a password."
                "[ Password should be atleast 6 characters long ]") {
          emit(Loginfailure(
              message: "Password should be atleast 6 characters long"));
        } else if (e.message ==
            "There is no user record corresponding to this identifier. The user may have been deleted."
                "[ Please check your email and password ]") {
          emit(Loginfailure(message: "Please check your email and password"));
        } else if (e.message ==
            "The email address is badly formatted."
                "[ Please check your email and password ]") {
          emit(Loginfailure(message: "Please check your email and password"));
        } else {
          emit(Loginfailure(message: e.toString()));
        }
        return;
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

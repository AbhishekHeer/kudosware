import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kudosware/models/usermodel.dart';

class Auth {
  static final auth = FirebaseAuth.instance;

  static Future<Object?> login(context, String email, String password) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      return user.user;
    } catch (e) {
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Invalid email or password'),
      ));
    }
  }

  static Future<Object> signup(context, String email, String password) async {
    final store = FirebaseFirestore.instance;

    // Add a new document with a generated ID

    if (email.isEmpty || password.isEmpty) {
      return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
        ),
      );
    }

    if (!email.contains('@')) {
      return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email address'),
        ),
      );
    }

    if (password.length < 6) {
      return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must be at least 6 characters long'),
        ),
      );
    }

    final docUser = store.collection('users').doc(email);

    UserModel json = UserModel(name: password, email: email, pic: "");

    await docUser.set(json.toJson());
    return await auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  static Future<void> logout() async {
    await auth.signOut();
  }

  static Future<void> sendverificationlink() async {
    User? user = FirebaseAuth.instance.currentUser;
    await user!.sendEmailVerification();
  }

  static Future<void> resetpassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  static Future<void> deleteaccount() async {
    User? user = FirebaseAuth.instance.currentUser;
    await user!.delete();
  }
}

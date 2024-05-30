import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kudosware/Auth/backend.dart';
import 'package:kudosware/home/home.dart';
import 'package:kudosware/messege.dart';
import 'package:lottie/lottie.dart';

class Verifyemail extends StatefulWidget {
  const Verifyemail({super.key});

  @override
  State<Verifyemail> createState() => _VerifyemailState();
}

class _VerifyemailState extends State<Verifyemail> {
  @override
  void initState() {
    super.initState();
    Auth.sendverificationlink().then((value) {
      if (FirebaseAuth.instance.currentUser?.emailVerified == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        Messege.showMessege(context, "We Send Mail To Your Email");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 100),
            Center(
                child: Lottie.asset("Assets/Animation/email.json",
                    fit: BoxFit.cover, height: height * .1)),
            const SizedBox(height: 20),
            const Text(
              "Verify Email",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * .05),
            SizedBox(
                width: width * .9,
                child: const Text(
                    'We Send An Email Verifcation Link to Your Email',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 8, 8, 8),
                        fontStyle: FontStyle.italic))),
            const SizedBox(height: 20),
            const SizedBox(height: 10),
            const Text(
              'Please Check Your Inbox or Spam Folder',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

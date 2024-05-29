import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kudosware/Auth/backend.dart';
import 'package:kudosware/home/home.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

final TextEditingController email = TextEditingController();
final TextEditingController password = TextEditingController();

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: height * .06),
            Icon(
              Icons.person,
              size: height * .1,
            ),
            Text('Login',
                style: GoogleFonts.poppins(
                    fontSize: height * .035, fontWeight: FontWeight.bold)),
            SizedBox(height: height * .03),
            Text('Login to your account',
                style: GoogleFonts.poppins(fontSize: width * .05)),
            SizedBox(height: height * .05),
            Text('Username',
                style: GoogleFonts.poppins(fontSize: width * .043)),
            SizedBox(height: height * .01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .05),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(width * .043),
                  ),
                  hintText: 'Enter your username',
                ),
              ),
            ),
            SizedBox(height: height * .03),
            Text('Password',
                style: GoogleFonts.poppins(fontSize: width * .0436)),
            SizedBox(height: height * .01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .05),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(width * .043),
                  ),
                  hintText: 'Enter your password',
                ),
              ),
            ),
            SizedBox(height: height * .05),
            ElevatedButton(
              onPressed: () => Auth.login(
                      context, email.text.toString(), password.text.toString())
                  .then(
                (value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(width * .3, height * .05),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * .03),
                ),
              ),
              child: Text('Login',
                  style: GoogleFonts.poppins(fontSize: width * .043)),
            ),
            SizedBox(height: height * .05),
          ],
        ),
      ),
    );
  }
}

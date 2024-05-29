import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kudosware/bloc/auth_bloc.dart';
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
    final auth = BlocProvider.of<AuthBloc>(context);

    return BlocBuilder<AuthBloc, AuthState>(
      bloc: AuthBloc(),
      builder: (context, state) {
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
                  onPressed: () async {
                    // BlocProvider.of<AuthBloc>(context).add(LoginEvent(email.text, password.text));
                    auth.add(AuthReq(
                        email: email.text.toString(),
                        password: password.text.toString()));
                  },
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
      },
    );
  }
}

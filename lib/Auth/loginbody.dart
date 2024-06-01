import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kudosware/Auth/login..dart';
import 'package:kudosware/bloc/auth_bloc.dart';
import 'package:kudosware/home/home.dart';
import 'package:kudosware/messege.dart';

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
    final bloc = BlocProvider.of<AuthBloc>(context);

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Loginfailure) {
          Messege.showMessege(context, state.message);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
          return;
        }

        if (state is Proccess) {
          if (state.logged == true) {
            showAdaptiveDialog(
                context: context,
                builder: (context) {
                  return const Dialog.fullscreen(
                      child: Center(
                    child: CircularProgressIndicator(),
                  ));
                });
          }

          if (state.logged == false) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
            email.text = "";
            password.text = "";
          }
        }
      },
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
                    keyboardType: TextInputType.emailAddress,
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
                    bloc.add(
                      LoginReq(
                          email: email.text.toString(),
                          password: password.text.toString()),
                    );
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

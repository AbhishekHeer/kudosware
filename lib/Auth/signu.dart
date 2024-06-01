import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kudosware/Auth/verifyemial.dart';
import 'package:kudosware/bloc/auth_bloc.dart';
import 'package:kudosware/messege.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final email = TextEditingController();
    final password = TextEditingController();
    final bloc = BlocProvider.of<AuthBloc>(context);

    // final name = TextEditingController();
    // final phone = TextEditingController();
    // final address = TextEditingController();
    // final dob = TextEditingController();
    // final gender = TextEditingController();
    return SingleChildScrollView(
        child: BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(children: [
          Column(
            children: <Widget>[
              SizedBox(height: height * .06),
              Icon(
                Icons.person,
                size: height * .1,
              ),
              Text('Sign-Up',
                  style: GoogleFonts.poppins(
                      fontSize: height * .035, fontWeight: FontWeight.bold)),
              SizedBox(height: height * .03),
              Text('Create your account',
                  style: GoogleFonts.poppins(fontSize: width * .05)),
              SizedBox(height: height * .05),
              Text('Enter Your Email',
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
                    hintText: 'Enter your email',
                  ),
                ),
              ),
              SizedBox(height: height * .03),
              Text('Create A Password',
                  style: GoogleFonts.poppins(fontSize: width * .043)),
              SizedBox(height: height * .01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .05),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * .043),
                    ),
                    hintText: 'Enter password',
                  ),
                ),
              ),
              SizedBox(height: height * .03),
              ElevatedButton(
                onPressed: () {
                  bloc.add(AuthReq(
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
                child: Text('Next',
                    style: GoogleFonts.poppins(fontSize: width * .043)),
              ),
              SizedBox(height: height * .05),
            ],
          ),
        ]);
      },
      listener: (BuildContext context, AuthState state) {
        if (state is Authsuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Verifyemail()),
          );

          email.text = "";
          password.text = "";
        }
        if (state is Authfailure) {
          Messege.showMessege(context, state.message);
        }
      },
    ));
  }
}

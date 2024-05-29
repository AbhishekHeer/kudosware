import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kudosware/Auth/loginbody.dart';
import 'package:kudosware/Auth/signu.dart';
import 'package:kudosware/bloc/navigate_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

List pages = [
  const LoginBody(),
  const Sign(),
];

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocConsumer<NavigateBloc, NavigateState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  pages.elementAt(state.index),
                  SizedBox(
                    height: height * .14,
                    child: AnimatedButtonBar(
                      radius: height * .03,
                      padding: const EdgeInsets.all(16.0),
                      backgroundColor: Colors.blueGrey.shade800,
                      foregroundColor: Colors.blueGrey.shade300,
                      elevation: 24,
                      borderColor: Colors.white,
                      borderWidth: 2,
                      innerVerticalPadding: 16,
                      children: [
                        ButtonBarEntry(
                            onTap: () {
                              BlocProvider.of<NavigateBloc>(context)
                                  .add(Tagchange(tabindex: 0));
                            },
                            child: const Text('Login')),
                        ButtonBarEntry(
                            onTap: () => BlocProvider.of<NavigateBloc>(context)
                                .add(Tagchange(tabindex: 1)),
                            child: const Text('Signup')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

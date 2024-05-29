import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kudosware/Auth/login..dart';
import 'package:kudosware/Routes/gen_routes.dart';
import 'package:kudosware/bloc/auth_bloc.dart';
import 'package:kudosware/bloc/navigate_bloc.dart';
import 'package:kudosware/firebase_options.dart';
import 'package:kudosware/home/db.dart';
import 'package:kudosware/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigateBloc()),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kudosware',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        onGenerateRoute: RoutesGen().generateRoute,
        home: FirebaseAuth.instance.currentUser == null
            ? const LoginScreen()
            : const HomeScreen(),
      ),
    );
  }
}

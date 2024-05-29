import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kudosware/Auth/loginbody.dart';
import 'package:kudosware/Auth/signu.dart';
import 'package:kudosware/Auth/verifyemial.dart';
import 'package:kudosware/bloc/navigate_bloc.dart';
import 'package:kudosware/home/home.dart';

class RoutesGen {
  final NavigateBloc navi = NavigateBloc();
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<NavigateBloc>.value(
                  value: navi,
                  child: const LoginBody(),
                ));
      case '/signup':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<NavigateBloc>.value(
                  value: navi,
                  child: const Sign(),
                ));
      case '/home':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<NavigateBloc>.value(
                  value: navi,
                  child: const HomeScreen(),
                ));
      case '/verify':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<NavigateBloc>.value(
                  value: navi,
                  child: const Verifyemail(),
                ));
      // case '/third':
      //   return MaterialPageRoute(builder: (_) => args);
      // case '/fourth':
      //   return MaterialPageRoute(builder: (_) => args);
      // case '/fifth':
      //   return MaterialPageRoute(builder: (_) => args);
      // case '/sixth':
      default:
        return null;
    }
  }
}

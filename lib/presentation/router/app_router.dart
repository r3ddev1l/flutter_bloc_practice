import 'package:flutter/material.dart';
import 'package:flutter_bloc_concepts/presentation/Screens/home_screen.dart';
import 'package:flutter_bloc_concepts/presentation/Screens/second_screen.dart';
import 'package:flutter_bloc_concepts/presentation/Screens/third_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ('/'):
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            title: 'HomeScreen',
            color: Colors.amberAccent,
          ),
        );

        break;

      case ('/second'):
        return MaterialPageRoute(
          builder: (_) => SecondScreen(
            title: 'SecondScreen',
            color: Colors.redAccent,
          ),
        );

        break;

      case ('/third'):
        return MaterialPageRoute(
          builder: (_) =>
              ThirdScreen(title: 'ThirdScreen', color: Colors.greenAccent),
        );

        break;
      default:
        return null;
    }
  }
}

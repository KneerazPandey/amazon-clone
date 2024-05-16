import 'package:amazon_frontend/features/auth/screens/auth_screen.dart';
import 'package:amazon_frontend/core/errors/errors.dart';
import 'package:amazon_frontend/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (BuildContext context) => const AuthScreen(),
        settings: settings,
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (BuildContext context) => const HomeScreen(),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => const PageNotFoundScreen(),
      );
  }
}

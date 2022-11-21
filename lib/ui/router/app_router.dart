
import 'package:flutter/material.dart';
import 'package:gridlexapp/ui/screens/home_screen.dart';
import 'package:gridlexapp/ui/screens/view_screen.dart';

import '../screens/user_form_screen.dart';
import 'package:gridlexapp/data/model/form_model.dart';

class AppRouterPath {
  static const userFormScreen = '/userFormScreen';
  static const homeScreen = '/homeScreen';
  static const viewScreen = '/viewScreen';
}

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterPath.userFormScreen:
        return MaterialPageRoute(builder: (context) => const UserFormScreen());
      case AppRouterPath.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case AppRouterPath.viewScreen:
        final data = settings.arguments as FormModel;
        return MaterialPageRoute(builder: (context) => ViewScreen(data: data));
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("${settings.name}: Page not found"),
            ),
          ),
        );
    }
  }
}

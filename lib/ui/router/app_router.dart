
import 'package:flutter/material.dart';
import 'package:gridlexapp/ui/screens/event_details.dart';
import 'package:gridlexapp/ui/screens/home_screen.dart';

import 'package:gridlexapp/data/model/form_model.dart';

class AppRouterPath {
  static const homeScreen = '/homeScreen';
  static const eventDetails = '/eventDetails';
}

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterPath.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

     /* case AppRouterPath.eventDetails:
        return MaterialPageRoute(builder: (context) => EventDetails(date: '',));*/
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

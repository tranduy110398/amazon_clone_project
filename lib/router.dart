import 'package:amazon_clone_project/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  // This is the return type of the function, meaning it returns a Route object.
  // The <dynamic> part indicates that the route can hold any type of data,
  // though in practice, it usually holds specific data types you want to pass between pages.

  // This parameter provides information about the route request. RouteSettings
  // contains properties like the name of the route (useful for identifying
  // which route to display) and any arguments passed to the route.
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("This screen does not exist."),
          ),
        ),
      );
  }
}

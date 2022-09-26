import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/screens/bottom_navigation/bottom_navigation.dart';
import 'package:task/view_models/bottom_navigation/vm_bottom_navigation.dart';

class RouteManager {
  static const String initialRoute = "/";
  static const String repo = "/repo";
  static const String homeRoute = "/home";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (BuildContext context) => VmBottomNavigation(),
                child: const BottomNavigationScreen()));
      // case repo:
      //   return MaterialPageRoute(
      //       builder: (context) => ChangeNotifierProvider(
      //           create: (BuildContext context) => VmGithub(),
      //           child: const SignInScreen()));
      // case homeRoute:
      //   return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        throw const FormatException("Route not found please check route name");
    }
  }
}

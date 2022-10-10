import 'package:flutter/material.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.red,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.red,
      onPrimary: Colors.white,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(
      color: Colors.teal,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
      bodyText2: TextStyle(
        color: Colors.black87,
        fontSize: 18.0,
      ),
    ),
    tabBarTheme: const TabBarTheme(
        labelColor: Colors.black, indicatorSize: TabBarIndicatorSize.label),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.red,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.red,
      onPrimary: Colors.black,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(
      color: Colors.black,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      bodyText2: TextStyle(
        color: Colors.white70,
        fontSize: 18.0,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.yellow,
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelColor: Colors.white,
    ),
  );
}

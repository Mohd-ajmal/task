import 'package:flutter/material.dart';

import 'routes/routes.dart';
import 'themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: RouteManager.initialRoute,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => RouteManager.generateRoute(settings),
    );
  }
}

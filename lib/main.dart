import 'package:flutter/material.dart';
import 'package:travel_mate_mobile/screens/auth/login.dart';
import 'package:travel_mate_mobile/screens/splash.dart';

void main() {
  runApp(TravelMateApp());
}

class TravelMateApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      routes: <String, WidgetBuilder>{'/login': (_) => new LoginPage()},
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_mate_mobile/screens/auth/login.dart';
import 'package:travel_mate_mobile/screens/auth/register.dart';
import 'package:travel_mate_mobile/screens/splash.dart';

import 'screens/home/bottomNavBarContainer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TravelMateApp());
}

class TravelMateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      routes: <String, WidgetBuilder>{
        '/login': (_) => new LoginPage(),
        '/register': (_) => new RegisterPage(),
        '/home': (_) => new BottomNavigationContainer()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

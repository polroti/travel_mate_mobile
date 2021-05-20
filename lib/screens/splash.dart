import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_mate_mobile/constants/PathConstants.dart';
//import 'package:qr_flutter/qr_flutter.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    _firebaseAuth.authStateChanges().listen((User user) {
      if (user == null) {
        print(user);
        Navigator.pushReplacementNamed(context, Paths.PATH_LOGIN);
      } else {
        print(user);
        Navigator.pushReplacementNamed(context, Paths.PATH_HOME);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(child: CircularProgressIndicator()),
      ),
    );
  }
}

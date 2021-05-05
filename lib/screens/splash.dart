import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:qr_flutter/qr_flutter.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.green),
          // backgroundColor: Colors.red,
          strokeWidth: 1.25,
        )
            // child: QrImage(
            //   data: "noice",
            //   version: 2,
            //   size: 400.0,
            // ),
            ),
      ),
    );
  }
}

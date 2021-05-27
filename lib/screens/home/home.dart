import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Code"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Sure ah?"),
                      content: Text(
                        "Pandithayan waakula logout pannadha aparam onaku than email password thirupi adika warum!",
                        textAlign: TextAlign.justify,
                      ),
                      actions: [
                        FlatButton(
                          child: Text("Shape la powam"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        FlatButton(
                          child: Text("I'm pandithayan"),
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pushNamedAndRemoveUntil(
                                context, "/login", (_) => false);
                          },
                        ),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
      body: Center(
          child: Container(
              padding: new EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Please do not share this code with anyone else since it will expose your personal data. Only share it when your conductor requests it.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  PrettyQr(
                    typeNumber: 6,
                    data: FirebaseAuth.instance.currentUser.uid,
                    size: 400,
                    roundEdges: true,
                  )
                ],
              ))),
    );
  }
}

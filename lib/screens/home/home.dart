import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        title: Text("Home"),
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
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(elevation: 10),
          child: Text('Open route'),
          onPressed: () {
            print("object");
          },
        ),
      )),
    );
  }
}

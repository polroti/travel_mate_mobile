import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:travel_mate_mobile/constants/AppBarTitleConstants.dart';
import 'package:travel_mate_mobile/constants/ButtonConstants.dart';
import 'package:travel_mate_mobile/constants/DialogConstants.dart';
import 'package:travel_mate_mobile/constants/LabelConstants.dart';
import 'package:travel_mate_mobile/constants/PathConstants.dart';
import 'package:travel_mate_mobile/models/services/authServices.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Authentication authentication = new Authentication();

  Widget body() {
    return Center(
        child: Container(
            padding: new EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  HomeLabels.DONT_SHARE_QR_CODE,
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                SizedBox(
                  height: 50,
                ),
                PrettyQr(
                  typeNumber: 3,
                  data: FirebaseAuth.instance.currentUser.uid,
                  size: 400,
                  roundEdges: true,
                )
              ],
            )));
  }

  Widget appBar() {
    return AppBar(
      title: Text(AppBarTitles.APPBAR_TITLE_HOME),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return dialog(context);
                });
          },
        ),
      ],
    );
  }

  Widget dialog(BuildContext context) {
    return AlertDialog(
      title: Text(DialogTitleConstants.LOGOUT),
      content: Text(
        DialogContentConstants.LOGOUT_CONFIRMATION,
        textAlign: TextAlign.justify,
      ),
      actions: [
        TextButton(
          child: Text(ButtonLabel.CANCEL),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text(ButtonLabel.LOGOUT),
          onPressed: () {
            authentication.signOut();
            Navigator.pushNamedAndRemoveUntil(
                context, Paths.PATH_LOGIN, (_) => false);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }
}

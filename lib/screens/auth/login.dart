import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_mate_mobile/screens/home/home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  bool _isLogginIn;
  @override
  initState() {
    this._isLogginIn = false;
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value != "") {
      if (!regex.hasMatch(value)) {
        return "INVALID EMAIL";
      } else {
        return null;
      }
    } else {
      return "Please enter the email address";
    }
  }

  String pwdValidator(String value) {
    if (value != "") {
      if (value.length < 8) {
        return "Your password should be greater than 08 characters";
      } else {
        return null;
      }
    } else {
      return "Please enter a password";
    }
  }

  Widget customAppBar() {
    return AppBar(
      title: Text("Login"),
    );
  }

  Widget _textInputEmail() {
    return TextFormField(
      keyboardAppearance: Brightness.dark,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Email ",
          hintText: "Email "),
      controller: emailInputController,
      keyboardType: TextInputType.emailAddress,
      validator: emailValidator,
    );
  }

  Widget _textInputPassword() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Password",
        hintText: "Password",
      ),
      controller: pwdInputController,
      obscureText: true,
      validator: pwdValidator,
    );
  }

  Widget circularProgressBar() {
    if (this._isLogginIn) {
      return CircularProgressIndicator(
        strokeWidth: 2,
      );
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget _primaryButton() {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "LOGIN",
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(elevation: 5),
      onPressed: () async {
        if (_loginFormKey.currentState.validate()) {
          //await pr.show();
          //  setState(() {
          this._isLogginIn = true;
          //    });
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailInputController.text,
                  password: pwdInputController.text)
              .then((currentUser) => FirebaseFirestore.instance
                  .collection("users")
                  .doc(currentUser.user.uid)
                  .get()
                  .then((DocumentSnapshot result) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage())))
                  .catchError((err) => print(err)))
              .catchError((error) {
            print("==============================");
            print("Error code " + error.code);
            print("==============================");
            switch (error.code) {
              case "wrong-password":
                final snackBar = SnackBar(
                  content: Text('password pila da mayiru'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );

                // Find the ScaffoldMessenger in the widget tree
                // and use it to show a SnackBar.
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                break;
              case "too-many-requests":
                final snackBar2 = SnackBar(
                  content: Text('konjam porumaya iru da'),
                  action: SnackBarAction(
                    label: 'Sari',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar2);
                break;

              default:
                final snackBar = SnackBar(
                  content: Text('Unknown auth error'),
                  action: SnackBarAction(
                    label: 'Ela',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );

                // Find the ScaffoldMessenger in the widget tree
                // and use it to show a SnackBar.
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                break;
            }
          });

          // setState(() {
          this._isLogginIn = false;
          // });
        }
      },
    );
  }

  Widget _secondaryButton() {
    return OutlinedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "REGISTER",
          ),
        ],
      ),
      style: OutlinedButton.styleFrom(
        side:
            BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/register');
      },
    );
  }

  Widget body() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
          child: Form(
        key: _loginFormKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            _textInputEmail(),
            SizedBox(
              height: 10,
            ),
            _textInputPassword(),
            SizedBox(
              height: 30,
            ),
            _primaryButton(),
            SizedBox(
              height: 350,
            ),
            Text("Don't have an account?"),
            SizedBox(
              height: 15,
            ),
            _secondaryButton(),
            circularProgressBar()
          ],
        ),
      )),
      //)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: body(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:travel_mate_mobile/screens/home/home.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController firstNameInputController;
  TextEditingController lastNameInputController;
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;

  @override
  initState() {
    firstNameInputController = new TextEditingController();
    lastNameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
    super.initState();
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

  Widget _textInputFirstName() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "FirstName",
        hintText: "FirstName",
      ),
      controller: firstNameInputController,
      validator: (value) {
        if (value.length < 3) {
          return "Invalid FirstName";
        }
        return "";
      },
    );
  }

  Widget _textInputLastName() {
    return TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Last Name",
          hintText: "Last Name",
        ),
        controller: lastNameInputController,
        validator: (value) {
          if (value.length < 3) {
            return "invalid Last Name";
          }
          return "";
        });
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

  Widget _textInputConfirmPassword() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Confirm Password",
        hintText: "Confirm Password",
      ),
      controller: confirmPwdInputController,
      obscureText: true,
      validator: pwdValidator,
    );
  }

  Widget _primaryButton() {
    return ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "REGISTER",
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(elevation: 5),
        onPressed: () {});
  }

  Widget _secondaryButton() {
    return OutlinedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "LOG BACK IN",
          ),
        ],
      ),
      style: OutlinedButton.styleFrom(
        side:
            BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _body() {
    return Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: Form(
          key: _registerFormKey,
          child: Column(
            children: <Widget>[
              _textInputFirstName(),
              SizedBox(
                height: 10,
              ),
              _textInputLastName(),
              SizedBox(
                height: 10,
              ),
              _textInputEmail(),
              SizedBox(
                height: 10,
              ),
              _textInputPassword(),
              SizedBox(
                height: 10,
              ),
              _textInputConfirmPassword(),
              SizedBox(
                height: 10,
              ),
              _primaryButton(),
              SizedBox(
                height: 250,
              ),
              Text("Already ingaya?"),
              _secondaryButton()
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: _body());
  }
}

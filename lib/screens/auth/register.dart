import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_mate_mobile/constants/AppBarTitleConstants.dart';
import 'package:travel_mate_mobile/constants/ButtonConstants.dart';
import 'package:travel_mate_mobile/constants/ErrorConstants.dart';
import 'package:travel_mate_mobile/constants/FirebaseConstants.dart';
import 'package:travel_mate_mobile/constants/LabelConstants.dart';
import 'package:travel_mate_mobile/constants/RegExp.dart';
import 'package:travel_mate_mobile/constants/TextInputConstants.dart';

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
    Pattern pattern = EmailRegExp.REGEX;
    RegExp regex = new RegExp(pattern);
    if (value != "") {
      if (!regex.hasMatch(value)) {
        return ValidatorErrors.INVALID_EMAIL;
      } else {
        return null;
      }
    } else {
      return ValidatorErrors.EMPTY_EMAIL;
    }
  }

  String pwdValidator(String value) {
    if (value != "") {
      if (value.length < 8) {
        return ValidatorErrors.WEAK_PASSWORD;
      } else {
        return null;
      }
    } else {
      return ValidatorErrors.EMPTY_PASSWORD;
    }
  }

  Widget _textInputFirstName() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: Labels.LABEL_FIRST_NAME,
        hintText: Hints.FIRST_NAME,
      ),
      controller: firstNameInputController,
      validator: (value) {
        if (value.length < 2) {
          return ValidatorErrors.WEAK_FIRST_NAME;
        }
        return null;
      },
    );
  }

  Widget _textInputLastName() {
    return TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: Labels.LABEL_LAST_NAME,
          hintText: Hints.LAST_NAME,
        ),
        controller: lastNameInputController,
        validator: (value) {
          if (value.length < 3) {
            return ValidatorErrors.WEAK_LAST_NAME;
          }
          return null;
        });
  }

  Widget _textInputEmail() {
    return TextFormField(
      keyboardAppearance: Brightness.dark,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: Labels.LABEL_EMAIL,
          hintText: Hints.EMAIL),
      controller: emailInputController,
      keyboardType: TextInputType.emailAddress,
      validator: emailValidator,
    );
  }

  Widget _textInputPassword() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: Labels.LABEL_PASSWORD,
        hintText: Hints.PASSWORD,
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
        labelText: Labels.LABEL_CONFIRM_PASSWORD,
        hintText: Hints.PASSWORD,
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
          children: <Widget>[Text(ButtonLabel.REGISTER)],
        ),
        style: ElevatedButton.styleFrom(elevation: 5),
        onPressed: () {
          if (_registerFormKey.currentState.validate()) {
            if (pwdInputController.text == confirmPwdInputController.text) {
              FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: emailInputController.text,
                      password: pwdInputController.text)
                  .then((currentUser) => FirebaseFirestore.instance
                      .collection("users")
                      .doc(currentUser.user.uid)
                      .set({
                        "uid": currentUser.user.uid,
                        "fname": firstNameInputController.text,
                        "surname": lastNameInputController.text,
                        "email": emailInputController.text,
                      })
                      .then((result) => {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                                (_) => false),
                            firstNameInputController.clear(),
                            lastNameInputController.clear(),
                            emailInputController.clear(),
                            pwdInputController.clear(),
                            confirmPwdInputController.clear()
                          })
                      .catchError((err) => print(err)))
                  .catchError((error) {
                print("==============================");
                print("Error code " + error.code);
                print("==============================");

                switch (error.code) {
                  case FirebaseAuthExceptions.EMAIL_ALREADY_IN_USE:
                    final snackBar = SnackBar(
                      content: Text(AuthErrors.EMAIL_ALREADY_IN_USE),
                      action: SnackBarAction(
                        label: ButtonLabel.UNDO,
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    break;

                  default:
                    final snackBar = SnackBar(
                      content: Text(AuthErrors.UNKNOWN_AUTH_ERROR),
                      action: SnackBarAction(
                        label: ButtonLabel.OKAY,
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
            }
          }
        });
  }

  Widget _secondaryButton() {
    return OutlinedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(ButtonLabel.LOG_BACK_IN),
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
                height: 220,
              ),
              Text(AuthLabels.CHECK_HAVE_ACCOUNT),
              _secondaryButton()
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppBarTitles.APPBAR_TITLE_REGISTER),
        ),
        body: _body());
  }
}

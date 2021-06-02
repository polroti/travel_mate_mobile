import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<User> getCurrentUser();

  Future<void> signOut();

  Future<void> changePassword();
}

class Authentication implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

// @override
  Future<void> changePassword() {
    throw UnimplementedError();
  }

  @override
  Future<User> getCurrentUser() async {
    User user = this._firebaseAuth.currentUser;
    return user;
  }

  @override
  Future<String> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    this._firebaseAuth.signOut();
  }

  Future<String> signUp(
    String email,
    String password,
  ) async {
    UserCredential firebaseUser = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    return firebaseUser.user.uid;
  }
}

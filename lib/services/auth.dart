import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew/models/user.dart';
import 'package:brew/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userfromfirebaseuser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //sigin ann
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userfromfirebaseuser);
  }

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userfromfirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sigin email
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userfromfirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register email
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid)
          .updateUserData('0', 'new member', 100);
      return _userfromfirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:brew/screens/authenticate/register.dart';
import 'package:brew/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    //print(showSignIn.toString());
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SigIn(toggleview: toggleView);
    } else {
      return Register(toggleview: toggleView);
    }
  }
}

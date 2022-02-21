import 'package:flutter/material.dart';
import 'package:todo_firebase/screens/authentication/register.dart';
import 'package:todo_firebase/screens/authentication/signIn.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isSignIn = true;
  void setIfSignIn() {
    setState(() {
      isSignIn = !isSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isSignIn) {
      return SignIn(setIfSignIn: setIfSignIn);
    } else {
      return Register(setIfSignIn: setIfSignIn);
    }
  }
}

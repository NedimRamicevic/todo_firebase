import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_firebase/screens/authentication/home/home.dart';
import 'package:todo_firebase/screens/authentication/register.dart';
import 'package:todo_firebase/screens/authentication/signIn.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user != null) {
      return const Home();
    } else {
      return const SignIn();
    }
  }
}

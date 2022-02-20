import 'package:flutter/material.dart';
import 'package:todo_firebase/extensions/context_extension.dart';
import 'package:todo_firebase/services/authentication.dart';
import 'package:todo_firebase/shared/constants.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, required this.setIfSignIn}) : super(key: key);
  final Function setIfSignIn;
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService auth = AuthService();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.dynamicWidth(0.05))),
              onPressed: () {
                widget.setIfSignIn();
              },
              child: const Text("Register"))
        ],
        title: const Text("Sign In"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: context.lowWidthValue,
            vertical: context.mediumHeightValue),
        child: Column(
          children: [
            Form(
                key: _globalKey,
                child: Column(
                  children: [
                    context.emptyWidgetHeight,
                    TextFormField(
                      onChanged: (value) => setState(() {
                        email = value;
                      }),
                      decoration:
                          textInputDecoration.copyWith(hintText: "E-mail"),
                    ),
                    context.emptyWidgetHeight,
                    TextFormField(
                      onChanged: (value) => setState(() {
                        password = value;
                      }),
                      decoration:
                          textInputDecoration.copyWith(hintText: "Password"),
                    ),
                    context.emptyWidgetHeight,
                    SizedBox(
                      width: context.dynamicWidth(0.21),
                      child: ElevatedButton(
                          onPressed: () => AuthService()
                              .signInWithEmailPassword(email, password),
                          child: const Text("Sign In")),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

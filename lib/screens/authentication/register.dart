import 'package:flutter/material.dart';
import 'package:todo_firebase/extensions/context_extension.dart';
import 'package:todo_firebase/services/authentication.dart';
import 'package:todo_firebase/shared/constants.dart';

class Register extends StatefulWidget {
  const Register({Key? key, required this.setIfSignIn}) : super(key: key);
  final Function setIfSignIn;
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              onPressed: () {
                widget.setIfSignIn();
              },
              child: const Text("Sign In"))
        ],
        title: const Text("Register"),
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
                      validator: (value) =>
                          value!.isEmpty ? "unvalid email" : null,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      decoration:
                          textInputDecoration.copyWith(hintText: "E-mail"),
                    ),
                    context.emptyWidgetHeight,
                    TextFormField(
                      validator: (value) =>
                          value!.length <= 6 ? "at least 6 characters" : null,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      decoration:
                          textInputDecoration.copyWith(hintText: "Password"),
                    ),
                    context.emptyWidgetHeight,
                    SizedBox(
                      width: context.dynamicWidth(0.21),
                      child: ElevatedButton(
                          onPressed: () => auth.createUserWithEmailandPassword(
                              email, password),
                          child: const Text("Register")),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

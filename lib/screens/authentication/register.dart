import 'package:flutter/material.dart';
import 'package:todo_firebase/extensions/context_extension.dart';
import 'package:todo_firebase/services/authentication.dart';
import 'package:todo_firebase/shared/constants.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    Authenticate auth = Authenticate();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: context.lowWidthValue,
            vertical: context.lowHeighthValue),
        child: Column(
          children: [
            Form(
                child: Column(
              children: [
                context.emptyWidgetHeight,
                TextFormField(
                  validator: (value) {
                    value!.isEmpty ? "unvalid email" : null;
                  },
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: textInputDecoration.copyWith(hintText: "E-mail"),
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
                ElevatedButton(
                    onPressed: () =>
                        auth.createUserWithEmailandPassword(email, password),
                    child: const Text("Register")),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

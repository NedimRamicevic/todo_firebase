import 'package:flutter/material.dart';
import 'package:todo_firebase/extensions/context_extension.dart';
import 'package:todo_firebase/shared/constants.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: context.lowWidthValue,
            vertical: context.mediumHeightValue),
        child: Column(
          children: [
            Form(
                child: Column(
              children: [
                SizedBox(
                  height: context.dynamicHeight(0.01),
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "E-mail"),
                ),
                context.emptyWidgetHeight,
                TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: "Password"),
                ),
                context.emptyWidgetHeight,
                const ElevatedButton(onPressed: null, child: Text("Register"))
              ],
            ))
          ],
        ),
      ),
    );
  }
}

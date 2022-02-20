import 'package:flutter/material.dart';
import 'package:todo_firebase/extensions/context_extension.dart';
import 'package:todo_firebase/shared/constants.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
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
                SizedBox(
                  height: context.dynamicHeight(0.05),
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "E-mail"),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.05),
                ),
                TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: "Password"),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.05),
                ),
                const ElevatedButton(onPressed: null, child: Text("Register"))
              ],
            ))
          ],
        ),
      ),
    );
  }
}

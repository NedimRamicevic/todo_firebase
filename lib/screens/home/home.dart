import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo_firebase/services/authentication.dart';
import 'package:todo_firebase/services/timeBloC.dart';

import '../../shared/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      timeBloC.fetc();
    });
    return StreamBuilder<CurrentTime>(
        stream: timeBloC.time,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  ElevatedButton.icon(
                      onPressed: () => AuthService().signOut(),
                      icon: const Icon(Icons.logout_rounded),
                      label: const Text("Logout"))
                ],
                title: const Text("Home"),
              ),
              body: Center(
                child: Text(snapshot.toString()),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

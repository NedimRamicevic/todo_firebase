import 'dart:async';
import 'package:flutter/material.dart';
import '../../services/authentication.dart';
import '../../services/timeBloC.dart';
import '../../shared/constants.dart';

class Time extends StatefulWidget {
  const Time({Key? key}) : super(key: key);

  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
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
                child: Text(snapshot.data!.time),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

import 'package:flutter/material.dart';
import 'package:todo_firebase/services/authentication.dart';
import 'package:todo_firebase/services/data_retrieve.dart';

import '../../shared/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    timeService.fetc();
    return StreamBuilder<CurrentTime>(
        stream: timeService.time,
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
          return Center(child: CircularProgressIndicator());
        });
  }
}

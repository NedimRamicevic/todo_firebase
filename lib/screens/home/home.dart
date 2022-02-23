import 'package:flutter/material.dart';

import 'package:todo_firebase/screens/home/weather.dart';

import '../../services/authentication.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
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
          child: Column(
            children: const [
              Weather(),
            ],
          ),
        ));
  }
}

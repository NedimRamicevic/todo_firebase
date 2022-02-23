import 'package:flutter/material.dart';

import 'package:todo_firebase/screens/home/weather.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(child: Weather()),
      ],
    );
  }
}

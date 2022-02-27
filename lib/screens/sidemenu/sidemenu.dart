import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: const [
        ListTile(
          leading: Icon(Icons.abc_outlined),
          title: Text("To Do"),
        ),
        ListTile(
          leading: Icon(Icons.abc_outlined),
          title: Text("Weather"),
        ),
      ]),
    );
  }
}

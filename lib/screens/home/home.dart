import 'package:flutter/material.dart';

import 'package:todo_firebase/screens/home/weather.dart';
import 'package:todo_firebase/screens/home/weatherList.dart';
import 'package:todo_firebase/shared/constants.dart';

import '../../services/authentication.dart';
import '../../services/weatherBloC.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    weatherBloC.fetc();
    return StreamBuilder<CurrentWeather>(
        stream: weatherBloC.weather,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                    children: [
                      Weather(currentWeather: snapshot.data!),
                      const WeatherList(),
                    ],
                  ),
                ));
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

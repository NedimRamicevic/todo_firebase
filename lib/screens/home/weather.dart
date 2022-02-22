import 'package:flutter/material.dart';
import 'package:todo_firebase/services/weatherBloC.dart';
import 'package:todo_firebase/shared/constants.dart';
import '../../services/authentication.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    weatherBloC.fetc();
    return StreamBuilder<CurrentWeather>(
        stream: weatherBloC.weather,
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
                child: Text(snapshot.data!.temp),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

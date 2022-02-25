import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_firebase/shared/constants.dart';

class MainWeather extends StatelessWidget {
  const MainWeather({Key? key, required this.weather}) : super(key: key);
  final CurrentWeather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(weather.name, style: const TextStyle(color: Colors.white)),
        Text(weather.weather,
            style: const TextStyle(color: Colors.white, fontSize: 32.0)),
        Text(weather.temp, style: const TextStyle(color: Colors.white)),
        Image.network("https://openweathermap.org/img/w/${weather.icon}.png"),
        Text(DateFormat.yMMMd().format(weather.date),
            style: const TextStyle(color: Colors.white))
      ],
    );
  }
}

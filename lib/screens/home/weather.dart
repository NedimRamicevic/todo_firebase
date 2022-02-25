import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_firebase/shared/constants.dart';
import 'package:todo_firebase/extensions/context_extension.dart';

class Weather extends StatelessWidget {
  final CurrentWeather currentWeather;
  const Weather({Key? key, required this.currentWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.35),
      child: Card(
        elevation: 0,
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.all(context.lowHeighthValue),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(currentWeather.name,
                  style: const TextStyle(color: Colors.white)),
              Text(currentWeather.weather,
                  style: const TextStyle(color: Colors.white, fontSize: 32.0)),
              Text(currentWeather.temp,
                  style: const TextStyle(color: Colors.white)),
              Image.network(
                  "https://openweathermap.org/img/w/${currentWeather.icon}.png"),
              Text(DateFormat.yMMMd().format(currentWeather.date),
                  style: const TextStyle(color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}

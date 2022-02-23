import 'package:flutter/material.dart';
import 'package:todo_firebase/screens/home/weather.dart';
import 'package:todo_firebase/services/forecastBloC.dart';
import 'package:todo_firebase/shared/constants.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ForecastData>(
        future: forecastBloC.fetch,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.list.length,
            itemBuilder: (context, index) {
              return Weather(
                currentWeather: snapshot.data!.list.elementAt(index),
              );
            },
          );
        });
  }
}

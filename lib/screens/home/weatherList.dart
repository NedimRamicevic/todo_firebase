import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_firebase/screens/home/weather.dart';
import 'package:todo_firebase/services/forecastBloC.dart';
import 'package:todo_firebase/extensions/context_extension.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.highHeightValue,
      child: Consumer<ForecastBloC>(
        builder: (context, snapshot, child) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.forecastData != []
                  ? snapshot.forecastData.length
                  : 3,
              itemBuilder: (context, index) {
                return snapshot.forecastData != []
                    ? Weather(
                        currentWeather: snapshot.forecastData.elementAt(index),
                      )
                    : Container();
              });
        },
      ),
    );
  }
}

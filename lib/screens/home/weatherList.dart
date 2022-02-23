import 'package:flutter/material.dart';
import 'package:todo_firebase/screens/home/weather.dart';
import 'package:todo_firebase/services/forecastBloC.dart';
import 'package:todo_firebase/shared/constants.dart';
import 'package:todo_firebase/extensions/context_extension.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.highHeightValue,
      child: FutureBuilder<ForecastData>(
        future: forecastBloC.fetch,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.list.length,
                itemBuilder: (context, index) {
                  return Weather(
                    currentWeather: snapshot.data!.list.elementAt(index),
                  );
                });
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

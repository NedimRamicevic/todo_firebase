import 'package:flutter/material.dart';
import 'package:todo_firebase/screens/home/time.dart';
import 'package:todo_firebase/services/weatherBloC.dart';
import 'package:todo_firebase/shared/constants.dart';
import '../../services/authentication.dart';
import 'package:todo_firebase/extensions/context_extension.dart';

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
            return SizedBox(
              width: context.dynamicWidth(0.3),
              child: Card(
                elevation: 0,
                color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.all(context.lowHeighthValue),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(snapshot.data!.name,
                          style: const TextStyle(color: Colors.white)),
                      Text(snapshot.data!.weather,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 32.0)),
                      Text(snapshot.data!.temp,
                          style: const TextStyle(color: Colors.white)),
                      Image.network(
                          "https://openweathermap.org/img/w/${snapshot.data!.icon}.png"),
                      const Time(),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

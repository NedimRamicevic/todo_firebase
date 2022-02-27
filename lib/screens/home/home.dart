import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_firebase/screens/home/dropdown.dart';
import 'package:todo_firebase/screens/home/main_weather.dart';
import 'package:todo_firebase/screens/home/weatherList.dart';
import 'package:todo_firebase/services/forecastBloC.dart';
import '../../services/authentication.dart';
import '../../services/weatherBloC.dart';
import '../../extensions/context_extension.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ForecastBloC(),
            ),
            ChangeNotifierProvider(create: ((context) => WeatherBloC())),
          ],
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: context.lowWidthValue,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.lowHeighthValue * 2),
                  child: const CityDropDown(),
                ),
                Expanded(
                  child: Consumer<WeatherBloC>(
                    builder: (context, value, child) {
                      return Center(
                        child: value.weather != null
                            ? MainWeather(
                                weather: value.weather!,
                              )
                            : Container(),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.lowHeighthValue),
                  child: SafeArea(
                      child: Column(
                    children: [
                      const WeatherList(),
                      SizedBox(
                        height: context.lowWidthValue,
                      )
                    ],
                  )),
                )
              ],
            ),
          ),
        ));
  }
}

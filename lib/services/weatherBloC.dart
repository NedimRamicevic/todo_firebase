import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:todo_firebase/services/data_retrieve.dart';
import 'package:todo_firebase/shared/constants.dart';

class WeatherBloC extends ChangeNotifier {
  final WeatherServise _weatherServise = WeatherServise();

  CurrentWeather? weather;

  Future<void> fetc(String city) async {
    await _weatherServise.fetchWeather(city).then((value) => weather = value);
    notifyListeners();
  }
}

WeatherBloC weatherBloC = WeatherBloC();

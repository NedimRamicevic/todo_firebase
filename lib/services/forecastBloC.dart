import 'package:flutter/material.dart';
import 'package:todo_firebase/services/data_retrieve.dart';
import 'package:todo_firebase/shared/constants.dart';

class ForecastBloC extends ChangeNotifier {
  final WeatherServise _weatherServise = WeatherServise();

  List forecastData = [];

  Future<void> fetch(String city) async {
    await _weatherServise
        .fetchForecast(city)
        .then((value) => forecastData = value.list);
    notifyListeners();
  }
}

ForecastBloC forecastBloC = ForecastBloC();

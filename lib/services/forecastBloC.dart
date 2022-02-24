import 'package:flutter/material.dart';
import 'package:todo_firebase/services/data_retrieve.dart';
import 'package:todo_firebase/shared/constants.dart';

class ForecastBloC extends ChangeNotifier {
  final WeatherServise _weatherServise = WeatherServise();

  late final Future<ForecastData> forecastData;

  void fetch(String city) {
    forecastData = _weatherServise.fetchForecast(city);
    notifyListeners();
  }
}

ForecastBloC forecastBloC = ForecastBloC();

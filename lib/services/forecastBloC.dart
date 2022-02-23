import 'package:flutter/material.dart';
import 'package:todo_firebase/services/data_retrieve.dart';
import 'package:todo_firebase/shared/constants.dart';

class ForecastBloC {
  final WeatherServise _weatherServise = WeatherServise();

  Future<ForecastData> get fetch {
    return _weatherServise.fetchForecast();
  }
}

ForecastBloC forecastBloC = ForecastBloC();

import 'dart:async';

import 'package:todo_firebase/services/data_retrieve.dart';
import 'package:todo_firebase/shared/constants.dart';

class WeatherBloC {
  final WeatherServise _weatherServise = WeatherServise();

  final StreamController<CurrentWeather> _weatherFetcher =
      StreamController<CurrentWeather>();

  Stream<CurrentWeather> get weather => _weatherFetcher.stream;

  fetc() async {
    print("selams");
    CurrentWeather currentWeather = await _weatherServise.fetchWeather();
    print(currentWeather);
    _weatherFetcher.sink.add(currentWeather);
  }

  dispose() {
    _weatherFetcher.close();
  }
}

WeatherBloC weatherBloC = WeatherBloC();

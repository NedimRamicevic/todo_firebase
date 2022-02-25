import 'dart:convert';
import 'package:todo_firebase/shared/constants.dart';
import 'package:http/http.dart' as http;

class TimeServise {
  Future<CurrentTime> fetchTime() async {
    final response = await http
        .get(Uri.parse('http://worldtimeapi.org/api/timezone/Europe/Istanbul'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return CurrentTime.fromJSon(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load time');
    }
  }
}

class WeatherServise {
  Future<CurrentWeather> fetchWeather(String city) async {
    final response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&cnt=7&appid=4cb5591bc154c06ef202e10a2ae5757b'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return CurrentWeather.fromJSon(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load time');
    }
  }

  Future<ForecastData> fetchForecast(String city) async {
    final forecastResponse = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/forecast?q=$city&units=metric&cnt=7&appid=4cb5591bc154c06ef202e10a2ae5757b'));
    if (forecastResponse.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return ForecastData.fromJSon(jsonDecode(forecastResponse.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load time');
    }
  }
}

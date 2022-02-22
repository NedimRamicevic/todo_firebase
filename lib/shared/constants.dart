import 'package:flutter/material.dart';

var textInputDecoration = InputDecoration(
    fillColor: Colors.amber.shade300,
    filled: true,
    enabledBorder:
        const OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent)));

class CurrentTime {
  final String location;
  final String time;

  const CurrentTime({required this.location, required this.time});

  factory CurrentTime.fromJSon(Map<String, dynamic> json) {
    return CurrentTime(
        location: json["timezone"],
        time: json["datetime"].toString().split("T")[1].substring(0, 8));
  }
}

class CurrentWeather {
  final String temp;
  final String location;

  const CurrentWeather({required this.temp, required this.location});

  factory CurrentWeather.fromJSon(Map<String, dynamic> json) {
    print("burası önemli ${json["main"]["temp"]}");
    return CurrentWeather(
        location: json["main"]["temp"].toString(),
        temp: json["weather"]["main"].toString());
  }
}

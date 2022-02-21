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
    return CurrentTime(location: json["location"], time: json["datetime"]);
  }
}

import 'dart:convert';
import 'package:rxdart/subjects.dart';
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
      throw Exception('Failed to load album');
    }
  }

  final _timeFetcher = PublishSubject<CurrentTime>();

  Stream<CurrentTime> get time => _timeFetcher.stream;

  fetc() async {
    CurrentTime currentTime = await fetchTime();
    _timeFetcher.sink.add(currentTime);
  }
}

final timeService = TimeServise();

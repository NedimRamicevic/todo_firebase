import 'dart:async';

import 'package:todo_firebase/services/data_retrieve.dart';
import 'package:todo_firebase/shared/constants.dart';

class TimeBloC {
  final TimeServise _timeServise = TimeServise();

  final StreamController<CurrentTime> _timeFetcher =
      StreamController<CurrentTime>();

  Stream<CurrentTime> get time => _timeFetcher.stream;

  fetc() async {
    CurrentTime currentTime = await _timeServise.fetchTime();
    _timeFetcher.sink.add(currentTime);
  }

  dispose() {
    _timeFetcher.close();
  }
}

TimeBloC timeBloC = TimeBloC();

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerCountDown {
  static StreamController<String> controller =
      StreamController<String>.broadcast();
  static StreamController<double> percentageController =
      StreamController<double>.broadcast();

  static final double _totalminutes = 24 * 60;

  String _printDuration(Duration duration) {
    String negativeSign = duration.isNegative ? '-' : '';
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    return "$negativeSign${twoDigits(duration.inHours)}\n$twoDigitMinutes";
  }

  static Duration fromStringToDuration(String duration) {
    List time = duration.split('\n');
    int hour = int.parse(time[0]);
    int minutes = int.parse(time[1]);

    return Duration(hours: hour, minutes: minutes);
  }

  void timeToMidnight() async {
    Timer.periodic(const Duration(seconds: 60), (timer) {
      DateTime midnight = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + 1,
      );

      Duration difference = midnight.difference(DateTime.now());

      String timeLeft = _printDuration(difference);

      calculatePercentage(timeLeft);

      controller.add(timeLeft);

      if (midnight.compareTo(DateTime.now()) < 0) {
        timer.cancel();
        controller.close();
      }
    });
  }

  void calculatePercentage(String timeLeft1) {
    int timeLeft = fromStringToDuration(timeLeft1).inMinutes;

    percentageController.add((timeLeft) / _totalminutes);

    if ((timeLeft) / _totalminutes <= 0.01) {
      percentageController.close();
    }
  }

  double printPercentageInitial() {
    DateTime midnight = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + 1,
    );

    Duration difference = midnight.difference(DateTime.now());

    int timeLeft = fromStringToDuration(_printDuration(difference)).inMinutes;

    return timeLeft/_totalminutes;


  }

  String printTimeInitial() {
    DateTime midnight = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + 1,
    );

    Duration difference = midnight.difference(DateTime.now());

    calculatePercentage(_printDuration(difference));

    return _printDuration(difference);
  }
}

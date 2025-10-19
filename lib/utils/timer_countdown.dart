import 'dart:async';

class TimerCountDown {
  static StreamController<String> controller = StreamController<String>.broadcast();

  String _printDuration(Duration duration) {
    String negativeSign = duration.isNegative ? '-' : '';
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    return "$negativeSign${twoDigits(duration.inHours)}\n$twoDigitMinutes";
  }

  static Duration fromStringToDuration(String duration){

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
      controller.add(timeLeft);

      if (midnight.compareTo(DateTime.now()) < 0) {
        timer.cancel();
        controller.close();
      }
    });
  }

  String printTimeInitial(){

      DateTime midnight = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + 1,
      );

      Duration difference = midnight.difference(DateTime.now());

       return _printDuration(difference);

  }

}

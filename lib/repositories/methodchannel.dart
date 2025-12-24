import 'package:flutter/services.dart';

class Methodchannel{

  static const platform = MethodChannel('getbattery/kotlin');

  static Future<void> getbattery() async {
    try {

      int batterylevel = await platform.invokeMethod('getbatterylevel');
      print("battery level $batterylevel");

    } on PlatformException catch(e) {
      rethrow;
    }
  }

}

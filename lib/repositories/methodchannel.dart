import 'dart:developer';

import 'package:flutter/services.dart';

class Methodchannel {

  static const platform = MethodChannel('getbattery/kotlin');
  static const notifyUserLoggedIn = MethodChannel('userLoggedIn/kotlin');

  static Future<void> getbattery() async {
    try {
      int batterylevel = await platform.invokeMethod('getbatterylevel');
      print("battery level $batterylevel");
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> userLoggedIn() async {
    try {
      log("hi from method channel");
      await notifyUserLoggedIn.invokeMethod('userLoggedIn');

    } catch (e) {
      rethrow;
    }
  }
}

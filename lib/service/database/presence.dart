// service/database/presence.dart

import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _incetans;

  static Future<void> init() async {
    _incetans = await SharedPreferences.getInstance();
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _incetans.setBool(key, value);
  }

  static bool getBool(String key) {
    return _incetans.getBool(key) ?? false;
  }

  static setString(String key, String value) async {
    return await _incetans.setString(key, value);
  }

  static String? getStringfromShared(String key) {
    log(key);
    log(_incetans.getString(key).toString());
    return _incetans.getString(key);
  }
}

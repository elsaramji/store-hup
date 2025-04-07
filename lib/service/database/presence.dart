// service/database/presence.dart

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
    print("setString: $key = $value");

    await _incetans.setString(key, value);
  }

  Future<String?> getUid() async {
    return await _incetans.getString("uid");
  }

  static String? getStringfromShared(String key) {
    return _incetans.getString(key);
  }
}

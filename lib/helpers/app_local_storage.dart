import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {

  static Future<void> saveValue(String key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else {
      await prefs.setInt(key, value);
    }
  }

  static Future<dynamic> getValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static Future<void> saveMap(String key, Map<String, dynamic> jsonMap) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, json.encode(jsonMap));
  }

  static Future<Map<String, dynamic>?> getMap<T>(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? value = prefs.getString(key);
    if (value != null) {
      return json.decode(prefs.getString(key)!) as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  static Future<void> removeValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<bool> containsKey(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

}

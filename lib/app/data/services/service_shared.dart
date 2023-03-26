import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ServiceShared {
  static String key = "data";

  // save data use shared preferences
  static Future<void> saveData(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(key, data);
  }

  // get data use shared preferences
  static Future<String?> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // remove data use shared preferences
  static Future<void> removeData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}

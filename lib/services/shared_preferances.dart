

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  Future<bool> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("token", token);
  }
  Future<bool> setUser(String user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("user", user);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") ?? '';
  }

  Future<String> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user") ?? '';
  }
}
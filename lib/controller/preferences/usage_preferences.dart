import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UsagePreferences {
  bool _notFirstTime = false;
  bool _onBoardingCompleted = false;

  Future<bool> get isFirstTime async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstTime') ?? false;
  }

  Future<bool> get onBoardingCompleted async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onBoardingCompleted') ?? false;
  }

  Future<void> setNotFirstTime(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', value);
    _notFirstTime = value;
  }

  Future<void> setOnBoardingCompleted(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoardingCompleted', value);
    _onBoardingCompleted = value;
  }
}

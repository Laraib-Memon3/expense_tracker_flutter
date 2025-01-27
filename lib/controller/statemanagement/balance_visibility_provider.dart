import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BalanceVisibilityProvider extends ChangeNotifier {
  static const String _visibilityKey = 'balance_visibility';
  bool _isVisible = true;

  BalanceVisibilityProvider() {
    _loadVisibility();
  }

  bool get isVisible => _isVisible;

  void toggleVisibility() {
    _isVisible = !_isVisible;
    _saveVisibility();
    notifyListeners();
  }

  Future<void> _loadVisibility() async {
    final prefs = await SharedPreferences.getInstance();
    _isVisible = prefs.getBool(_visibilityKey) ?? true;
    notifyListeners();
  }

  Future<void> _saveVisibility() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_visibilityKey, _isVisible);
  }
}

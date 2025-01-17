import 'package:flutter/material.dart';

class StatisticsProvider with ChangeNotifier {
  bool _showAvg = false;
  String _selectedValue = 'Expense';
  String _selectedCategory = 'Day'; 

  bool get showAvg => _showAvg;
  String get selectedValue => _selectedValue;
   String get selectedCategory => _selectedCategory;

   void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void toggleShowAvg() {
    _showAvg = !_showAvg;
    notifyListeners();
  }

  void setSelectedValue(String value) {
    _selectedValue = value;
    notifyListeners(); 
  }
}
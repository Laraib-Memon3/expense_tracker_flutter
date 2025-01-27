import 'package:flutter/material.dart';

class AddExpenseProvider extends ChangeNotifier {
  String _selectedExpense = 'Netflix';
  DateTime _selectedDate = DateTime.now();

  String get selectedExpense => _selectedExpense;
  DateTime get selectedDate => _selectedDate;

  void setSelectedExpense(String expense) {
    _selectedExpense = expense;
    notifyListeners();
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }
}
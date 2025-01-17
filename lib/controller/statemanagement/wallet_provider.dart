import 'package:flutter/material.dart';

class WalletProvider with ChangeNotifier {
  bool _isTransactionSelected = true;

  bool get isTransactionSelected => _isTransactionSelected;

  void toggleTab(bool isTransaction) {
    _isTransactionSelected = isTransaction;
    notifyListeners();
  }
}

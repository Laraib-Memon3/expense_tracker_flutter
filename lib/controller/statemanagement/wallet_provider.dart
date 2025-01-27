import 'package:flutter/material.dart';

class WalletProvider extends ChangeNotifier {
  bool _isTransactionSelected = true;

  bool get isTransactionSelected => _isTransactionSelected;

  void toggleTab(bool isTransaction) {
    _isTransactionSelected = isTransaction;
    notifyListeners();
  }
}

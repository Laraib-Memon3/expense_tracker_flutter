import 'package:flutter/material.dart';

class ConnectWalletProvider extends ChangeNotifier {
  bool _isCardsSelected = true;
  String? _selectedAccount = 'Bank Link';

  bool get isCardsSelected => _isCardsSelected;
  String? get selectedAccount => _selectedAccount;

  void toggleTab(bool isCards) {
    _isCardsSelected = isCards;
    notifyListeners();
  }

  void selectAccount(String account) {
    _selectedAccount = account;
    notifyListeners();
  }
}

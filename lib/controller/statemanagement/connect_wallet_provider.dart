import 'package:flutter/material.dart';

class ConnectWalletProvider with ChangeNotifier {
  bool _isCardsSelected = true;

  bool get isCardsSelected => _isCardsSelected;

  void toggleTab(bool isCards) {
    _isCardsSelected = isCards;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:incomeapp/Model/transaction_details_model.dart';

class TransactionDetailsProvider extends ChangeNotifier {
  final List<TransactionDetailsModel> _transactionDetailsModel = [];

  List<TransactionDetailsModel> get transactionDetailsModel => _transactionDetailsModel;

  void addTransactionDetails(TransactionDetailsModel transactionDetails) {
    _transactionDetailsModel.add(transactionDetails);
    notifyListeners();
  }

  void removeTransactionDetails(TransactionDetailsModel transactionDetails) {
    _transactionDetailsModel.remove(transactionDetails);
    notifyListeners();
  }


}
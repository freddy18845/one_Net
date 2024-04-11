import 'package:flutter/material.dart';

class CurrencySelectionViewModel extends ChangeNotifier {
  String activeCurrency = "USD";
  String dropdownvalue = 'USD';
  var items = [
    'USD',
    'ZiG',
  ];

  void changeCurrency(currency) {
    activeCurrency = currency;
    currency == "USD" ? activeCurrency = "USD" : activeCurrency = "ZWL";
    notifyListeners();
    print(activeCurrency);
  }
}

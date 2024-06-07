import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputAmountViewModel extends ChangeNotifier {
  String amount = '';
  String number = '';

  bool point = false;
  bool isloading = true;
  String status = '';
  late bool showAllNetworks;

  setPointTapped() {
    point = true;
  }

  setloadingStatus() {
    status = '';
    isloading = false;
  }

  setNetworks(bool network) {
    showAllNetworks = network;
  }

  clearPointTapped() {
    point = false;
  }

  double getAmount() {
    return double.parse(amount);
  }

  void setCustonAmount(String value) {
    print(value);
    if (value == '.') return;
    if (amount.length > 6 && (value != 'back')) return;
    if (value == 'back') {
      if (amount.isNotEmpty) {
        amount = amount.substring(0, amount.length - 1);

        notifyListeners();
      } else {
        return;
      }
    } else {
      amount += value;
      notifyListeners();
    }
    amount = amount.replaceAll('.', '');
    if (amount.isNotEmpty) {
      switch (amount.length) {
        case 1:
          amount = '00$amount';
          break;
        case 2:
          amount = '0$amount';
          break;
        default:
          break;
      }
      amount =
          '${amount.substring(0, amount.length - 2)}.${amount.substring(amount.length - 2, amount.length)}';
      notifyListeners();
    }
    double rawAmount = amount.isEmpty ? 0.0 : double.parse(amount);
    amount = rawAmount <= 0 ? '' : rawAmount.toStringAsFixed(2);

    //amount = Provider.of<StoreViewModel>(context).getTxnType();
    notifyListeners();
    //setState(() {});
  }

  void setRecipientNo(String value) {
    if (value == '.') return;
    if (number.length > 9 && (value != 'back')) return;
    if (value == 'back') {
      if (number.isNotEmpty) {
        number = number.substring(0, number.length - 1);

        notifyListeners();
      } else {
        return;
      }
    } else {
      if (number.length < 9) {
        number += value;

        //print(number.length);
        if (number.length == 9) {
          isloading = true;
          status = 'isloading';
          Timer(const Duration(seconds: 4), () {
            isloading = false;
            status = 'display';
            notifyListeners();
            print(status);
          });
        }
      }
      notifyListeners();
    }
  }

  clearCustonAmount() {
    amount = "";
    number = "";
  }

  clearNumber() {
    number = "";
  }

  reset() {
    amount = "";
    point = false;
    // notifyListeners();
  }
}

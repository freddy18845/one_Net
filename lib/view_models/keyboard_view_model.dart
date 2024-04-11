import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputAmountViewModel extends ChangeNotifier {
  String amount = '';
  bool point = false;

  setPointTapped() {
    point = true;
  }

  clearPointTapped() {
    point = false;
  }

  double getAmount() {
    return double.parse(amount);
  }

  void setCustonAmount(String value, TextEditingController contoller) {
    print(value);
    if (value == '.') return;
    if (amount.length > 7 && (value != 'back')) return;
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
    contoller.text = amount;
    //amount = Provider.of<StoreViewModel>(context).getTxnType();
    notifyListeners();
    //setState(() {});
  }

  clearCustonAmount(TextEditingController contoller) {
    amount = '';
    contoller.text = '';
    print(amount);
    notifyListeners();
  }
  // setCustonAmount(String number) {
  //   if (point) {
  //     if (amount == '') {
  //       amount = "0.$number";
  //     } else {
  //       List myAmountList = amount.split('.');
  //       if (myAmountList.length == 1) {
  //         amount = "$amount.$number";
  //       } else if (myAmountList.length == 2) //Amount Conatians Decimal
  //       {
  //         if (myAmountList[1].length ==
  //             1) // Amount Contains 1 Decimal, Add Next Decimal
  //         {
  //           amount = "$amount$number";
  //         } else //Amount Contains More Than 1 Decimal, Remove Last One And Put In Another One
  //         {
  //           amount = amount.substring(0, amount.length - 1);
  //           amount = "$amount$number";
  //         }
  //       }
  //     }
  //   } else {
  //     if (amount == '') {
  //       amount = number;
  //     } else {
  //       amount = amount + number;
  //     }
  //   }
  //   notifyListeners();
  // }

  // clearCustonAmount() {
  //   if (amount == "") {
  //   } else {
  //     List myAmountList = amount.split('.');

  //     if (myAmountList.length == 1) //The amount does not contain decimal
  //     {
  //       amount = amount.substring(0, amount.length - 1);
  //       point = false;
  //     } else if (myAmountList.length == 2) //The amount contains decimal
  //     {
  //       if (myAmountList[1].length == 1) {
  //         amount = amount.substring(0, amount.length - 2);
  //       } else if (myAmountList[1].length == 2) {
  //         amount = amount.substring(0, amount.length - 1);
  //       }
  //     }
  //   }
  //   notifyListeners();
  // }

  reset() {
    amount = "";
    point = false;
    // notifyListeners();
  }
}

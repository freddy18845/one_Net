import 'dart:math';

import 'package:flutter/widgets.dart';

class StoreViewModel extends ChangeNotifier {
  Map transactionData = {};
  List mobileNetworks = [
    {
      "name": "telecash",
      "image": "assets/images/payments/TeleCash.png",
    },
    {
      "name": "one Money",
      "image": "assets/images/payments/OneMoney.png",
    },
    {
      "name": "ecocash",
      "image": "assets/images/payments/EcoCash.png",
    }
  ];
  setRecipietNo(String value) {
    transactionData["recipientNo"] = value;
    notifyListeners();
  }

  momoNum(String value) {
    transactionData["momoNumber"] = value;
    notifyListeners();
    print(transactionData["momoNumber"]);
  }

  setallfield() {
    transactionData["buyerNo"] == '';
    transactionData["recipientNo"] == '';
    transactionData["rechargeAmount"] == '';
    transactionData["momoNo"] == '';
    transactionData["paymentMethod"] = '';
    transactionData["selectedNetwork"] = "";
    transactionData["selectedNetworkImage"] = "";
    transactionData["cardNumber"] = '';
    transactionData["receiptNum"] = '';
    transactionData["orderDateTime"] = '';
  }

  setBuyerNo(String value) {
    transactionData["buyerNo"] = value;
    notifyListeners();
  }

  setRechargeAmount(String value) {
    transactionData["rechargeAmount"] = value;
    notifyListeners();
  }

  setPayment(String value) {
    transactionData["paymentMethod"] = value;
    generateOrderNumAndDate();
    notifyListeners();
  }

  // setmomoNum(String value) {
  //   transactionData["momoNo"] = value;
  //   notifyListeners();
  // }

  double getAmount() {
    return double.parse(transactionData["rechargeAmount"]);
  }

  setPaymetData(data) {
    transactionData["cardNumber"] = data["pan"];
    transactionData["receiptNum"] = data["transactionId"];
    transactionData["orderDateTime"] = data["date"];
  }

  generateOrderNumAndDate() {
    transactionData["receiptNum"] = 1 + Random().nextInt(9999999 - 0000001);
    transactionData["orderDateTime"] = DateTime.now();
    notifyListeners();
  }

  setSelectedNet() {
    transactionData["selectedNetwork"] = "";
    transactionData["selectedNetworkImage"] = "";
  }

  addSelectedNet(int index, Map selectedNet) {
    Map unselectNetwork = mobileNetworks[1];

    mobileNetworks[index] = unselectNetwork;
    mobileNetworks[1] = selectedNet;

    transactionData["selectedNetwork"] = selectedNet["name"];

    notifyListeners();
    print(transactionData["selectedNetworkImage"]);
  }

  resetNetworksPosition() {
    mobileNetworks = [
      {
        "name": "telecash",
        "image": "assets/images/payments/Telecash.png",
      },
      {
        "name": "one Money",
        "image": "assets/images/payments/OneMoney.png",
      },
      {
        "name": "ecocash",
        "image": "assets/images/payments/EcoCash.png",
      }
    ];
  }
}
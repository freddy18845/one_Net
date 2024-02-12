import 'dart:async';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:one_net/views/cardpayment.dart';
import 'package:one_net/views/home_screen.dart';
import 'package:one_net/views/mobile_money_screen.dart';
import 'package:one_net/views/qr_scan_screen.dart';
import 'package:one_net/views/splash_screen.dart';

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

  goToSplashScreen(context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              const SplashScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    });
  }

  defualtRecipietNo() {
    transactionData["recipientNo"] = '';
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

  setPayment(String value, context) {
    if (transactionData["recipientNo"] != null) {
      transactionData["paymentMethod"] = value;
      generateOrderNumAndDate();
      switch (value) {
        case "Mobile Money":
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  const MobileMoneyScreen(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
          break;
        case "Card":
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  const CardPayment(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
          break;
        case "QR":
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  const QRCodePaymentScreen(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
          break;
      }

      notifyListeners();
      print("working");
    }
  }

  double getAmount() {
    return double.parse(transactionData["rechargeAmount"]);
  }

  defaultResponse() {
    generateOrderNumAndDate();
    transactionData["cardNumber"] = "6769897907095013";
    transactionData["receiptNum"] = 1 + Random().nextInt(9999999 - 0000001);
    transactionData["orderDateTime"] = DateTime.now();
    notifyListeners();
  }

  setPaymetData(data) {
    transactionData["cardNumber"] = data["pan"].toString();
    transactionData["receiptNum"] = data["transactionId"].toString();
    transactionData["orderDateTime"] = data["date"];
    notifyListeners();
  }

  generateOrderNumAndDate() {
    transactionData["receiptNum"] = 1 + Random().nextInt(9999999 - 0000001);
    transactionData["orderDateTime"] = DateTime.now();
    notifyListeners();
  }

  // setSelectedNet() {
  //   transactionData["selectedNetwork"] = "";
  //   transactionData["selectedNetworkImage"] = "";
  // }

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
  }
}

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_net/views/cardpayment.dart';
import 'package:one_net/views/esim_reciept_screen.dart';
import 'package:one_net/views/mobile_money_screen.dart';
import 'package:one_net/views/qr_scan_screen.dart';
import 'package:one_net/views/reciept_screen.dart';
import 'package:one_net/views/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class StoreViewModel extends ChangeNotifier {
  Map transactionData = {};
  String esimType = '';
  String momonumber = '';
  String selectedAmount = '';
  bool esimInvoice = false;

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
  setRecipienttNo(String value) {
    transactionData["recipientNo"] = value;
    notifyListeners();
  }

  setAirtime(String value) {
    selectedAmount = value;
    notifyListeners();
  }

  setEmail(String value) {
    transactionData["email"] = value;
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
  }

  txnType(bool data) {
    esimInvoice = data;
    notifyListeners();
  }

  momoNum(String value) {
    transactionData["momoNumber"] = value;
    notifyListeners();
  }

  setallfield() {
    transactionData["buyerNo"] = '';
    transactionData["recipientNo"] = '';
    transactionData["rechargeAmount"] = '';
    transactionData["paymentMethod"] = '';
    transactionData["selectedNetwork"] = "";
    transactionData["selectedNetworkImage"] = "";
    transactionData["cardNumber"] = '';
    transactionData["receiptNum"] = '';
    transactionData["orderDateTime"] = '';
    transactionData["TranactionType"] = '';
    transactionData["totalPrice"] = '';
    transactionData["email"] = '';
    esimType = '';
  }

  setTxnProgress(context) {
    esimInvoice == true
        ? Timer(const Duration(seconds: 3), () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const ReceiptScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          })
        : Timer(const Duration(seconds: 3), () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const EsimRecieptScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          });
  }

  clearmomoNumber(context) {
    Navigator.pop(context);
    momonumber = '';
  }

  clearmomoNum() {
    momonumber = '';
  }

  void setMomoNo(String value) {
    if (value == '.') return;
    if (momonumber.length > 10 && (value != 'back')) return;
    if (value == 'back') {
      if (momonumber.isNotEmpty) {
        momonumber = momonumber.substring(0, momonumber.length - 1);

        notifyListeners();
      } else {
        return;
      }
    } else {
      if (momonumber.length < 10) {
        momonumber += value;

        //print(number.length);
      }
      notifyListeners();
    }
  }

  setBuyerNo(String value) {
    transactionData["buyerNo"] = value;
    notifyListeners();
    clearNumber();
  }

  clearNumber() {
    momonumber = "";
  }

  setRechargeAmount(String value) {
    transactionData["totalPrice"] = double.parse(value) + 2.00;
    transactionData["rechargeAmount"] = double.parse(value);
    notifyListeners();
  }

  setAmount(String value) {
    transactionData["totalPrice"] = double.parse(value);
    transactionData["rechargeAmount"] = double.parse(value);
    notifyListeners();
  }

  setTxnType(String value) {
    transactionData["TransactionType"] = value;

    notifyListeners();
  }

  String getTxnType() {
    return transactionData["TransactionType"].toString();
  }

  String geteSimUserType() {
    return esimType.toString();
  }

  seteSimType(String value) {
    esimType = value;
    notifyListeners();
  }

  String getEsimType() {
    return esimType.toString();
  }

  setPayment(String value, context) {
    if (transactionData["recipientNo"] != null) {
      transactionData["paymentMethod"] = value;
      generateOrderNumAndDate();
      switch (value) {
        case "Mobile Money":
          Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 900),
                reverseDuration: const Duration(milliseconds: 900),
                child: const MobileMoneyScreen(),
                inheritTheme: true,
                ctx: context),
          );

          break;
        case "Card":
          Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 900),
                reverseDuration: const Duration(milliseconds: 900),
                child: const CardPayment(),
                inheritTheme: true,
                ctx: context),
          );

          break;
        case "QR":
          Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 900),
                reverseDuration: const Duration(milliseconds: 900),
                child: const QRCodePaymentScreen(),
                inheritTheme: true,
                ctx: context),
          );

          break;
      }

      notifyListeners();
    }
  }

  defaultResponse() {
    generateOrderNumAndDate();
    transactionData["cardNumber"] = "6769897907095013";
    transactionData["receiptNum"] = 1 + Random().nextInt(9999999 - 0000001);
    transactionData["orderDateTime"] = DateTime.now();
    notifyListeners();
  }

  setPaymetData(data) {
    transactionData["cardNumber"] = data["PAN"].toString();
    transactionData["receiptNum"] = 1 + Random().nextInt(9999999 - 0000001);
    transactionData["orderDateTime"] = data["DateTime"];
    notifyListeners();
  }

  generateOrderNumAndDate() {
    transactionData["receiptNum"] = 1 + Random().nextInt(9999999 - 0000001);
    transactionData["orderDateTime"] = DateTime.now();
    notifyListeners();
  }

  setSelectedNet(String network) {
    transactionData["selectedNetwork"] = network;
    // transactionData["selectedNetworkImage"] = "";
  }

  addSelectedNet(int index, Map selectedNet) {
    Map unselectNetwork = mobileNetworks[1];

    mobileNetworks[index] = unselectNetwork;
    mobileNetworks[1] = selectedNet;

    transactionData["selectedNetwork"] = selectedNet["name"];

    notifyListeners();
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

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/screen_size.dart';

class FontsStyle {
  startbtnText() {
    return TextStyle(
        color: Colors.black,
        fontSize: ScreenSize().getScreenHeight(2.5),
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w600);
  }

  startbtnTextdisable() {
    return TextStyle(
        color: const Color.fromARGB(64, 0, 0, 0),
        fontSize: ScreenSize().getScreenHeight(2.5),
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w600);
  }

  curencybtnText() {
    return TextStyle(
        color: Colors.black,
        fontSize: ScreenSize().getScreenHeight(1.5),
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w600);
  }

  btnText() {
    return TextStyle(
        color: Colors.black,
        fontSize: ScreenSize().getScreenHeight(3),
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w600);
  }

  splashText1() {
    return TextStyle(
        color: Colors.white,
        fontSize: ScreenSize().getScreenHeight(7.7),
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w900);
  }

  splashText2() {
    return TextStyle(
        color: Colors.black,
        fontSize: ScreenSize().getScreenHeight(2.5),
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w700);
  }

  inputAmtText() {
    return TextStyle(
        color: Colors.black,
        fontSize: ScreenSize().getScreenHeight(2.5),
        decoration: TextDecoration.none,
        fontFamily: 'comfortaa',
        fontWeight: FontWeight.w800);
  }

  splashText3() {
    return TextStyle(
        color: Colors.white,
        fontSize: ScreenSize().getScreenHeight(1.8),
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w600);
  }

  copyrightText() {
    return TextStyle(
        color: Colors.black,
        fontSize: ScreenSize().getScreenHeight(1),
        fontWeight: FontWeight.w600);
  }

  intText() {
    return TextStyle(
        color: Colour().primary(),
        fontSize: ScreenSize().getScreenHeight(3),
        fontWeight: FontWeight.w600);
  }

  mainMenuText() {
    return TextStyle(
        color: Colour().primary(),
        fontSize: ScreenSize().getScreenHeight(3),
        fontWeight: FontWeight.w900);
  }

  mainMenuTextOne() {
    return TextStyle(
        color: Colour().primary(),
        fontSize: ScreenSize().getScreenHeight(4),
        fontWeight: FontWeight.w900);
  }

  mainText() {
    return TextStyle(
        color: Colors.white,
        fontSize: ScreenSize().getScreenHeight(2),
        fontWeight: FontWeight.normal);
  }

  recipientNumText() {
    return TextStyle(
        color: Colors.black,
        fontSize: ScreenSize().getScreenHeight(1.7),
        fontWeight: FontWeight.normal);
  }

  recipientNumName() {
    return TextStyle(
        color: Colors.black,
        fontSize: ScreenSize().getScreenHeight(1.7),
        fontWeight: FontWeight.w700);
  }

  buyText() {
    return TextStyle(
        color: Colour().secondary(),
        fontSize: ScreenSize().getScreenHeight(2),
        fontWeight: FontWeight.w600);
  }

  buyTextGold() {
    return TextStyle(
        color: Colour().primary(),
        fontSize: ScreenSize().getScreenHeight(2),
        fontWeight: FontWeight.w600);
  }

  cardreadDone() {
    return TextStyle(
        color: Colour().primary(),
        fontSize: ScreenSize().getScreenHeight(2),
        fontWeight: FontWeight.w600);
  }

  textComfirmNumber() {
    return TextStyle(
        color: Colors.black,
        fontSize: ScreenSize().getScreenHeight(3.5),
        fontWeight: FontWeight.w900);
  }

  txnInprogress() {
    return TextStyle(
        color: Colour().primary(),
        fontSize: ScreenSize().getScreenHeight(2.5),
        fontWeight: FontWeight.w900);
  }

  congrats() {
    return TextStyle(
        color: Colors.green,
        fontSize: ScreenSize().getScreenHeight(3.5),
        fontWeight: FontWeight.w900);
  }

  invoicetxn() {
    return TextStyle(
        color: Colour().primary(),
        fontSize: ScreenSize().getScreenHeight(2),
        fontWeight: FontWeight.w900);
  }

  invoiceEsimtxn() {
    return TextStyle(
        color: Colour().primary(),
        fontSize: ScreenSize().getScreenHeight(1.5),
        fontWeight: FontWeight.w700);
  }

  invoiceEsimtext() {
    return TextStyle(
        color: Colors.black,
        fontSize: ScreenSize().getScreenHeight(1),
        fontWeight: FontWeight.w600);
  }

  invoicetext() {
    return TextStyle(
        color: Colors.black,
        fontSize: ScreenSize().getScreenHeight(1.5),
        fontWeight: FontWeight.w600);
  }

  invoicetext1() {
    return TextStyle(
        color: Colors.black,
        fontSize: ScreenSize().getScreenHeight(1.5),
        fontWeight: FontWeight.normal);
  }

  debitText() {
    return TextStyle(
        color: Colour().secondary(),
        fontSize: ScreenSize().getScreenHeight(2),
        fontWeight: FontWeight.w600);
  }

  cardAmtText() {
    return TextStyle(
        color: Colour().secondary(),
        fontSize: ScreenSize().getScreenHeight(6),
        fontWeight: FontWeight.w800);
  }

  invoiceAmtText() {
    return TextStyle(
        color: Colour().green(),
        fontSize: ScreenSize().getScreenHeight(5),
        fontWeight: FontWeight.w800);
  }

  priceText() {
    return TextStyle(
        color: Colour().secondary(),
        fontSize: ScreenSize().getScreenHeight(2.5),
        fontWeight: FontWeight.normal);
  }

  rechargeText() {
    return TextStyle(
        color: Colour().secondary(),
        fontSize: ScreenSize().getScreenHeight(2),
        fontWeight: FontWeight.w800);
  }

  loadingText() {
    return TextStyle(
        color: Colour().primary(),
        fontSize: ScreenSize().getScreenHeight(2),
        fontWeight: FontWeight.bold);
  }

  inTheWorld() {
    return TextStyle(
        color: Colour().primary(),
        fontSize: ScreenSize().getScreenHeight(2),
        fontWeight: FontWeight.bold);
  }

  receiptTitle() {
    return TextStyle(
        color: Colors.black,
        fontSize: ScreenSize().getScreenHeight(1.5),
        fontWeight: FontWeight.normal);
  }
}

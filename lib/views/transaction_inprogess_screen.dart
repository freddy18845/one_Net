import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/views/reciept_screen.dart';

class TransactionInprogress extends StatelessWidget {
  const TransactionInprogress({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              const ReceiptScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/txn_inprogess.png"),
              fit: BoxFit.fill),
        ),
        child: Center(
          child: Container(
            height: ScreenSize().getScreenHeight(45),
            width: ScreenSize().getScreenWidth(80),
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/txn_card.png"),
                  fit: BoxFit.cover),
              border: Border.all(width: 5, color: Colour().primary()),
              borderRadius: BorderRadius.circular(
                ScreenSize().getScreenHeight(3),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Transaction In Progress",
                  style: FontsStyle().txnInprogress(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenSize().getScreenHeight(7)),
                  child: Lottie.asset(
                    'assets/lottie/checked.json',
                    repeat: false,
                    //options: LottieOptions(),
                    height: ScreenSize().getScreenHeight(17),
                  ),
                ),
                Text(
                  "Card Read Done - Remove Card",
                  style: FontsStyle().cardreadDone(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

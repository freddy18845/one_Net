import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/views/reciept_screen.dart';
import 'package:page_transition/page_transition.dart';

class TransactionInprogress extends StatelessWidget {
  const TransactionInprogress({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 200),
            reverseDuration: const Duration(milliseconds: 200),
            child: const ReceiptScreen(),
            inheritTheme: true,
            ctx: context),
      );
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/home.png"), fit: BoxFit.fill),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/logo2.png",
              width: ScreenSize().getScreenWidth(70),
              height: ScreenSize().getScreenHeight(15),
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: ScreenSize().getScreenHeight(30),
            ),
            Center(
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
            )
          ],
        ),
        // ),
      ),
    );
  }
}

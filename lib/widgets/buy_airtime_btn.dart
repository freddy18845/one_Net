import 'dart:async';

import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/views/select_airtime_package.dart';

class BuyAirtimeBtn extends StatefulWidget {
  const BuyAirtimeBtn({super.key});

  @override
  State<BuyAirtimeBtn> createState() => _BuyAirtimeBtnState();
}

bool isPressed = false;

class _BuyAirtimeBtnState extends State<BuyAirtimeBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPressed = true;
        });

        Timer(const Duration(milliseconds: 200), () {
          setState(() {
            isPressed = false;
          });
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  const SelectAirtimePackageScreen(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        });
      },
      child: Container(
        height: ScreenSize().getScreenHeight(18),
        width: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("assets/images/airtime.png"),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(
            ScreenSize().getScreenHeight(1),
          ),
          border: isPressed
              ? Border.all(width: 3, color: Colour().primary())
              : Border.all(width: 3, color: Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/phone.png",
              width: ScreenSize().getScreenWidth(12),
              height: ScreenSize().getScreenHeight(8),
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: ScreenSize().getScreenWidth(1),
            ),
            Text(
              "Buy Airtime",
              style: FontsStyle().buyAirtimeText(),
            ),
          ],
        ),
      ),
    );
  }
}

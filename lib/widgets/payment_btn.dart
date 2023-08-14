import 'dart:async';

import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/screen_size.dart';

class PaymentButton extends StatefulWidget {
  final Widget btnText;

  final Function btnAction;

  const PaymentButton({
    super.key,
    required this.btnText,
    required this.btnAction,
  });

  @override
  State<PaymentButton> createState() => _PaymentButtonState();
}

bool isPressed = false;

class _PaymentButtonState extends State<PaymentButton> {
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
          widget.btnAction();
        });
      },
      child: Container(
        height: ScreenSize().getScreenHeight(17),
        width: ScreenSize().getScreenWidth(26),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(85, 85, 85, 1),
          borderRadius: BorderRadius.circular(
            ScreenSize().getScreenHeight(2),
          ),
          border: isPressed
              ? Border.all(width: 5, color: Colour().primary())
              : Border.all(width: 0, color: Colors.transparent),
        ),
        child: Center(
          child: widget.btnText,
        ),
      ),
    );
  }
}

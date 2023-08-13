import 'dart:async';

import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';

class Button extends StatefulWidget {
  final double btnHeight;
  final double btnWight;
  final Widget btnText;
  final Color btnColor;

  final Function btnAction;

  const Button({
    super.key,
    required this.btnHeight,
    required this.btnWight,
    required this.btnText,
    required this.btnAction,
    required this.btnColor,
  });

  @override
  State<Button> createState() => _ButtonState();
}

bool isPressed = false;

class _ButtonState extends State<Button> {
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
        height: widget.btnHeight,
        width: widget.btnWight,
        decoration: BoxDecoration(
          color: widget.btnColor,
          borderRadius: BorderRadius.circular(
            ScreenSize().getScreenHeight(1),
          ),
          border: isPressed
              ? Border.all(width: 3, color: Colors.white)
              : Border.all(width: 3, color: Colors.transparent),
        ),
        child: Center(
          child: widget.btnText,
        ),
      ),
    );
  }
}

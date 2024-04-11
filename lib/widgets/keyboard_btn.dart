import 'dart:async';

import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/screen_size.dart';

class KeyboardButton extends StatefulWidget {
  final Widget btnLabel;

  final Function btnAction;

  const KeyboardButton({
    super.key,
    required this.btnLabel,
    required this.btnAction,
  });

  @override
  State<KeyboardButton> createState() => _ButtonState();
}

bool isPressed = false;

class _ButtonState extends State<KeyboardButton> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: InkWell(
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
          height: ScreenSize().getScreenHeight(7),
          //width: widget.btnWight,
          //  isPressed
          //       ?
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isPressed
                  ? [Colour().primary(), Colour().primary()]
                  : [Colors.white, Colour().primary()],
            ),
            borderRadius: BorderRadius.circular(
              ScreenSize().getScreenHeight(2),
            ),
            border: Border.all(width: 2, color: Colour().primary()),
          ),
          child: Center(
            child: widget.btnLabel,
          ),
        ),
      ),
    );
  }
}

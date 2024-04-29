import 'dart:async';

import 'package:flutter/material.dart';
import 'package:one_net/utils/screen_size.dart';

class Button extends StatefulWidget {
  final Function btnAction;
  final Widget btnLabel;
  final double btnOutwardHieghtSize;
  final double btnOutwardWidthSize;
  final double btnInwardWidthSize;
  final double btnInwardHightSize;
  final Color outerColor;
  final Color inerColor;

  const Button({
    super.key,
    required this.btnAction,
    required this.btnLabel,
    required this.btnOutwardHieghtSize,
    required this.btnOutwardWidthSize,
    required this.btnInwardWidthSize,
    required this.btnInwardHightSize,
    required this.outerColor,
    required this.inerColor,
  });

  @override
  State<Button> createState() => _ButtonState();
}

bool isPressed = false;

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.btnOutwardHieghtSize,
      width: widget.btnOutwardWidthSize,
      child: InkWell(
        onTap: () {
          setState(() {
            isPressed = true;
          });
          Timer(const Duration(milliseconds: 200), () {
            widget.btnAction();
            setState(() {
              isPressed = false;
            });
          });
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: widget.btnOutwardHieghtSize,
                width: widget.btnOutwardWidthSize,
                decoration: BoxDecoration(
                  color: widget.outerColor,
                  borderRadius: BorderRadius.circular(
                    ScreenSize().getScreenHeight(1),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: widget.btnInwardHightSize,
                width: widget.btnInwardWidthSize,
                decoration: BoxDecoration(
                  color: widget.inerColor,
                  border: !isPressed
                      ? null
                      : Border.all(width: 3, color: Colors.white),
                  borderRadius:
                      BorderRadius.circular(ScreenSize().getScreenHeight(1)),
                ),
                child: Center(child: widget.btnLabel),
              ),
            )
          ],
        ),
      ),
    );
  }
}

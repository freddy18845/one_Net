import 'package:flutter/material.dart';
import 'package:one_net/utils/screen_size.dart';

class RoundBtn extends StatelessWidget {
  final Widget btnLabel;
  final Color innerColor;
  final Color outerColor;
  const RoundBtn(
      {super.key,
      required this.btnLabel,
      required this.innerColor,
      required this.outerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize().getScreenHeight(6),
      width: ScreenSize().getScreenHeight(6),
      decoration: BoxDecoration(
        color: innerColor,
        borderRadius: BorderRadius.circular(
          ScreenSize().getScreenHeight(3),
        ),
        border: Border.all(width: 3, color: outerColor),
      ),
      child: Center(child: btnLabel),
    );
  }
}

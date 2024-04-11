import 'dart:async';

import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';

// class Button extends StatefulWidget {
//   final double btnHeight;
//   final double btnWight;
//   final Widget btnText;
//   final Color btnColor;

//   final Function btnAction;

//   const Button({
//     super.key,
//     required this.btnHeight,
//     required this.btnWight,
//     required this.btnText,
//     required this.btnAction,
//     required this.btnColor,
//   });

//   @override
//   State<Button> createState() => _ButtonState();
// }

// bool isPressed = false;

// class _ButtonState extends State<Button> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           isPressed = true;
//         });

//         Timer(const Duration(milliseconds: 200), () {
//           setState(() {
//             isPressed = false;
//           });
//           widget.btnAction();
//         });
//       },
//       child: Container(
//         height: widget.btnHeight,
//         width: widget.btnWight,
//         decoration: BoxDecoration(
//           color: widget.btnColor,
//           borderRadius: BorderRadius.circular(
//             ScreenSize().getScreenHeight(2),
//           ),
//           border: isPressed
//               ? Border.all(width: 5, color: Colors.white)
//               : Border.all(
//                   width: 3,
//                   color: Color.fromARGB(255, 255, 122, 13).withOpacity(0.1)),
//         ),
//         child: Center(
//           child: widget.btnText,
//         ),
//       ),
//     );
//   }
// }
class Button extends StatefulWidget {
  final Function btnAction;
  final Widget btnLabel;
  //final bool showActiveBtn;
  final double btnOutwardHieghtSize;
  final double btnOutwardWidthSize;
  final double btnInwardWidthSize;
  final double btnInwardHightSize;
  // final double btnInwardRadiusSize;
  //// final double btnOutwardRadiusSize;
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
    // required this.btnInwardRadiusSize,
    // required this.btnOutwardRadiusSize,
    required this.outerColor,
    required this.inerColor,
    // required this.showActiveBtn,
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
                    ScreenSize().getScreenHeight(2),
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
                      BorderRadius.circular(ScreenSize().getScreenHeight(2)),
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

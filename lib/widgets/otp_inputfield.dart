import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/screen_size.dart';

class OTPInputField extends StatelessWidget {
  final String otpValue;
  const OTPInputField({
    super.key,
    required this.otpValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize().getScreenHeight(7),
      width: ScreenSize().getScreenHeight(7),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(
          ScreenSize().getScreenHeight(1.5),
        ),
        border: Border.all(
          width: 2,
          color: Colour().primary(),
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: ScreenSize().getScreenHeight(1)),
          child: Text(
            // ignore: unnecessary_null_comparison
            otpValue.isEmpty || otpValue == null ? ' ' : '*',
            style: TextStyle(
                // ignore: unnecessary_null_comparison
                fontWeight: otpValue.isEmpty || otpValue == null
                    ? FontWeight.w100
                    : FontWeight.w700,
                // ignore: unnecessary_null_comparison
                fontSize: otpValue.isEmpty || otpValue == null
                    ? ScreenSize().getScreenHeight(3.5)
                    : ScreenSize().getScreenHeight(6),
                // ignore: unnecessary_null_comparison
                color: otpValue.isEmpty || otpValue == null
                    ? Colors.black38
                    : Colors.black),
          ),
        ),
      ),
    );
    // SizedBox(
    //   height: ScreenSize().getScreenHeight(7),
    //   width: ScreenSize().getScreenHeight(7),
    //   child: Center(
    //     child: TextFormField(
    //       initialValue: otpValue,
    //       textAlign: TextAlign.center,
    //       obscureText: true,
    //       obscuringCharacter: "✱",
    //       autofocus: true,
    //       style: TextStyle(
    //         fontWeight: FontWeight.normal,
    //         fontSize: ScreenSize().getScreenHeight(2.7),
    //       ),
    //       maxLength: 1,
    //       keyboardType: TextInputType.none,
    //       textInputAction: TextInputAction.none,
    //       decoration: InputDecoration(
    //           filled: true,
    //           counterText: "",
    //           hintText: '*',
    //           fillColor: const Color.fromARGB(255, 221, 217, 217),
    //           enabledBorder: OutlineInputBorder(
    //             borderSide: BorderSide(width: 2, color: Colour().primary()),
    //             borderRadius:
    //                 BorderRadius.circular(ScreenSize().getScreenHeight(1)),
    //           ),

    //           // Set border for focused state
    //           focusedBorder: OutlineInputBorder(
    //             borderSide: BorderSide(width: 2, color: Colour().primary()),
    //             borderRadius:
    //                 BorderRadius.circular(ScreenSize().getScreenHeight(1)),
    //           )),
    //     ),
    //   ),
    // );
  }
}

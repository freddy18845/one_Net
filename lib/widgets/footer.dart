import 'package:flutter/material.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ScreenSize().getScreenHeight(5),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "....The World In One",
              style: FontsStyle().inTheWorld(),
            ),
          ],
        ),
      ),
    );
  }
}

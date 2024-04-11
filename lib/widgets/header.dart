import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/widgets/round_btn.dart';

import '../views/home_screen.dart';

class Header extends StatelessWidget {
  final bool showHome;
  final bool showPrevious;
  final String titleText;
  final String subtitleText;
  //final Function previousFunction;

  const Header({
    super.key,
    required this.showHome,
    required this.titleText,
    required this.showPrevious,
    required this.subtitleText,
    //required this.previousFunction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize().getScreenHeight(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showPrevious
              ? InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: RoundBtn(
                    btnLabel: Icon(
                      Icons.arrow_back,
                      color: Colour().primary(),
                      size: ScreenSize().getScreenHeight(4),
                    ),
                    innerColor: Colour().secondary(),
                    outerColor: Colour().primary(),
                  ),
                )
              : Container(
                  width: ScreenSize().getScreenHeight(6),
                ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: ScreenSize().getScreenHeight(1),
              ),
              Text(
                titleText,
                style: FontsStyle().mainMenuText(),
              ),
              SizedBox(
                height: ScreenSize().getScreenHeight(1),
              ),
              Text(
                subtitleText,
                style: FontsStyle().buyText(),
              ),
            ],
          ),
          showHome
              ? InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            HomeScreen(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                  child: RoundBtn(
                    btnLabel: Image.asset(
                      "assets/images/home_logo.png",
                      width: ScreenSize().getScreenHeight(3.5),
                      height: ScreenSize().getScreenHeight(3.5),
                      fit: BoxFit.contain,
                    ),
                    innerColor: Colour().secondary(),
                    outerColor: Colour().primary(),
                  ),
                )
              : Container(
                  width: ScreenSize().getScreenHeight(6),
                ),
        ],
      ),
    );
  }
}

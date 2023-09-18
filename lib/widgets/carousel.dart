import 'dart:async';
import 'dart:ui';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/widgets/debug_switch.dart';
import 'package:one_net/widgets/round_btn.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;

  List<String> images = [
    'assets/images/carousel/splash1.png',
    'assets/images/carousel/splash2.png',
    'assets/images/carousel/splash3.png',
  ];
  Timer _timer = Timer.periodic(const Duration(seconds: 2), (timer) async {});

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      if (mounted) {
        setState(() {
          if (_currentIndex + 1 == images.length) {
            _currentIndex = 0;
          } else {
            _currentIndex = _currentIndex + 1;
          }
        });
      }
      // print(mounted);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize().getScreenHeight(73),
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
//color: Colors.black,
        borderRadius: BorderRadius.circular(
          ScreenSize().getScreenHeight(3),
        ),
      ),
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 1500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Image.asset(
              images[_currentIndex],
              key: ValueKey<int>(_currentIndex),
              fit: BoxFit.cover,
              height: ScreenSize().getScreenHeight(73),
              width: double.infinity,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(
                ScreenSize().getScreenHeight(3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DebugSwitch(),
                  Image.asset(
                    "assets/images/logo1.png",
                    width: ScreenSize().getScreenWidth(32),
                  ),
                  InkWell(
                    onTap: () {
                      FlutterExitApp.exitApp();
                    },
                    child: RoundBtn(
                      btnLabel: Icon(
                        Icons.power_settings_new,
                        size: ScreenSize().getScreenHeight(4),
                        color: Colors.white,
                      ),
                      innerColor: const Color.fromRGBO(237, 50, 55, 1),
                      outerColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: ScreenSize().getScreenHeight(27),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize().getScreenHeight(4),
                  vertical: ScreenSize().getScreenHeight(1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TALK MORE",
                      style: FontsStyle().splashText1(),
                    ),
                    Text(
                      "FOR LESS US DALLOR A DAY",
                      style: FontsStyle().splashText2(),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.pending_actions,
                          size: ScreenSize().getScreenHeight(2.5),
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: ScreenSize().getScreenHeight(1),
                        ),
                        Text(
                          "Unlimited OnNet Calls - 12 Midnight Till 4AM ",
                          style: FontsStyle().splashText3(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenSize().getScreenHeight(1),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone_in_talk,
                          size: ScreenSize().getScreenHeight(2.5),
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: ScreenSize().getScreenHeight(1),
                        ),
                        Text(
                          "60 min OnNet ",
                          style: FontsStyle().splashText3(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: ScreenSize().getScreenHeight(2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.mapIndexed((index, item) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize().getScreenWidth(0.5)),
                    child: Container(
                      height: ScreenSize().getScreenHeight(1.5),
                      width: ScreenSize().getScreenHeight(1.5),
                      decoration: BoxDecoration(
                          // border: Border.all(
                          //     width: ScreenSize().getScreenHeight(0.2),
                          //     color: Colors.white),
                          color: _currentIndex == index
                              ? Colors.white
                              : const Color.fromARGB(113, 0, 0, 0),
                          borderRadius: BorderRadius.circular(
                              ScreenSize().getScreenHeight(0.75))),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

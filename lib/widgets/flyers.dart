import 'dart:async';

import 'package:flutter/material.dart';
import 'package:one_net/utils/screen_size.dart';

class Flyer extends StatefulWidget {
  const Flyer({super.key});

  @override
  State<Flyer> createState() => _FlyerState();
}

class _FlyerState extends State<Flyer> {
  int _currentIndex = 0;

  List<String> images = [
    'assets/images/flyers/image1.png',
    'assets/images/flyers/image2.png',
    'assets/images/flyers/image3.png',
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
      height: ScreenSize().getScreenHeight(22),
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
              height: ScreenSize().getScreenHeight(22),
              width: double.infinity,
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomLeft,
          //   child: Padding(
          //     padding: EdgeInsets.only(top: ScreenSize().getScreenWidth(32)),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: images.mapIndexed((index, item) {
          //         return Padding(
          //           padding: EdgeInsets.symmetric(
          //               horizontal: ScreenSize().getScreenWidth(0.5)),
          //           child: Container(
          //             height: ScreenSize().getScreenHeight(1.5),
          //             width: ScreenSize().getScreenHeight(1.5),
          //             decoration: BoxDecoration(
          //                 border: Border.all(
          //                     width: ScreenSize().getScreenHeight(0.2),
          //                     color: Colors.white),
          //                 color: _currentIndex == index
          //                     ? Colors.white
          //                     : Colors.transparent,
          //                 borderRadius: BorderRadius.circular(
          //                     ScreenSize().getScreenHeight(0.75))),
          //           ),
          //         );
          //       }).toList(),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

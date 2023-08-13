import 'package:flutter/material.dart';

class ScreenSize {
  MediaQueryData screenSize =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window);

  getScreenWidth(double percent) {
    double screenWidth = screenSize.size.width;
    return screenWidth * (percent / 100);
  }

  getScreenHeight(double percent) {
    double screenHeight = screenSize.size.height;
    return screenHeight * (percent / 100);
  }
}

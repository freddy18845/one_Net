import 'dart:async';
import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/views/splash_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              const SplashScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    });
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/loading_screen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 210),
                child: Column(
                  children: [
                    Text(
                      "Initializing",
                      style: FontsStyle().intText(),
                    ),
                    Text(
                      "Please Wait....",
                      style: FontsStyle().loadingText(),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 140,
                    ),
                    Text(
                      "       ....The world in one",
                      style: FontsStyle().loadingText(),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 200),
                child: CircularProgressIndicator(
                  color: Colour().primary(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 120),
                child: Text(
                  "Loading....",
                  style: FontsStyle().loadingText(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.copyright,
                      size: 12,
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Text(
                        "Copyright 2023 Sovereign Payment Solutions, GH. All Right Reserved",
                        style: FontsStyle().copyrightText()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/views/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 200),
            reverseDuration: const Duration(milliseconds: 200),
            child: const SplashScreen(),
            inheritTheme: true,
            ctx: context),
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
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 600),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 360,
                    ),
                    Text(
                      "       ....The world in one",
                      style: TextStyle(
                          color: Colour().primary(),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 370),
                child: Column(
                  children: [
                    Text(
                      "Initializing",
                      style: TextStyle(
                          color: Colour().primary(),
                          fontSize: 50,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Please Wait....",
                      style: TextStyle(
                          color: Colour().primary(),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 420),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    color: Colour().primary(),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 120),
                child: Text(
                  "Loading....",
                  style: TextStyle(
                      color: Colour().primary(),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
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
                    Row(
                      children: [
                        const Text("Copyright ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w600)),
                        Text(DateFormat.y().format(DateTime.now()),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w600)),
                        const Text(
                            " Sovereign Payment Solutions, GH. All Right Reserved",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/views/home_screen.dart';
import 'package:one_net/widgets/button.dart';
import 'package:one_net/widgets/carousel.dart';
import 'package:one_net/widgets/ip_address_modal.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/splash_screen.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(ScreenSize().getScreenHeight(3)),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: ScreenSize().getScreenHeight(3)),
                    child: InkWell(
                        onDoubleTap: () {
                          getIPModal(context);
                        },
                        child: const Carousel()),
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Button(
                  btnAction: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            const HomeScreen(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                  btnHeight: ScreenSize().getScreenHeight(15),
                  btnText: Text(
                    'Tap To Start',
                    style: FontsStyle().btnText(),
                  ),
                  btnWight: double.infinity,
                  btnColor: Colour().primary(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

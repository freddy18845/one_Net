import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/change_pinpad_theme_view_model.dart';
import 'package:one_net/views/home_screen.dart';
import 'package:one_net/widgets/button.dart';
import 'package:one_net/widgets/carousel.dart';
import 'package:one_net/widgets/ip_address_modal.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<PinpadThemeView>(context).colourTheme(context);

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
                  btnInwardHightSize: ScreenSize().getScreenHeight(14),
                  btnLabel: Text(
                    'Tap To Start',
                    style: FontsStyle().btnText(),
                  ),
                  btnOutwardHieghtSize: ScreenSize().getScreenHeight(15.5),
                  btnInwardWidthSize: ScreenSize().getScreenWidth(86.3),
                  btnOutwardWidthSize: ScreenSize().getScreenWidth(89),
                  inerColor: Colour().primary(),
                  outerColor: Colour().primary().withOpacity(0.5),
                  btnAction: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => HomeScreen()),
                    // );
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 200),
                          reverseDuration: const Duration(milliseconds: 200),
                          child: HomeScreen(),
                          inheritTheme: true,
                          ctx: context),
                    );
                    // Navigator.push(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder: (context, animation1, animation2) =>
                    //         HomeScreen(),
                    //     transitionDuration: Duration.zero,
                    //     reverseTransitionDuration: Duration.zero,
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

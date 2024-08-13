import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:intl/intl.dart';
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

import '../widgets/debug_switch.dart';
import '../widgets/round_btn.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Provider.of<PinpadThemeView>(context).colourTheme(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: InkWell(
                  onDoubleTap: () {
                    getIPModal(context);
                  },
                  child: const Carousel())),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(
                ScreenSize().getScreenHeight(2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DebugSwitch(),
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
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: ScreenSize().getScreenHeight(7),
                  left: ScreenSize().getScreenHeight(3),
                  right: ScreenSize().getScreenHeight(3)),
              child: Card(
                elevation: 7,
                shadowColor: Colors.black,
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
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 600),
                          reverseDuration: const Duration(milliseconds: 600),
                          child: const HomeScreen(),
                          inheritTheme: true,
                          ctx: context),
                    );
                  },
                ),
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
                      Text("Copyright ",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: ScreenSize().getScreenHeight(0.8),
                              fontWeight: FontWeight.w600)),
                      Text(DateFormat.y().format(DateTime.now()),
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: ScreenSize().getScreenHeight(0.8),
                              fontWeight: FontWeight.w600)),
                      Text(
                          " Sovereign Payment Solutions, GH. All Right Reserved",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: ScreenSize().getScreenHeight(0.8),
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

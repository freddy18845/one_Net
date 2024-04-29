import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/change_pinpad_theme_view_model.dart';
import 'package:one_net/view_models/keyboard_view_model.dart';
import 'package:one_net/views/splash_screen.dart';
import 'package:one_net/widgets/home_card_btn.dart';
import 'package:one_net/widgets/flyers.dart';
import 'package:one_net/widgets/footer.dart';
import 'package:one_net/widgets/round_btn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../view_models/store_view_model.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Provider.of<StoreViewModel>(context, listen: false).setallfield();
    Provider.of<InputAmountViewModel>(context, listen: false)
        .clearCustonAmount();

    Provider.of<PinpadThemeView>(context).colourTheme(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/home.png"), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/logo2.png",
                    width: ScreenSize().getScreenWidth(70),
                    height: ScreenSize().getScreenHeight(15),
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: ScreenSize().getScreenHeight(2)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 200),
                              reverseDuration:
                                  const Duration(milliseconds: 200),
                              child: const SplashScreen(),
                              inheritTheme: true,
                              ctx: context),
                        );
                      },
                      child: RoundBtn(
                        btnLabel: Icon(
                          Icons.power_settings_new,
                          size: ScreenSize().getScreenHeight(4),
                          color: Colors.white,
                        ),
                        innerColor: Colour().primary(),
                        outerColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: ScreenSize().getScreenHeight(2),
                  right: ScreenSize().getScreenHeight(2),
                  top: ScreenSize().getScreenHeight(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: ScreenSize().getScreenHeight(48),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(235, 55, 52, 53),
                        borderRadius: BorderRadius.circular(
                          ScreenSize().getScreenHeight(3),
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.all(ScreenSize().getScreenHeight(2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: ScreenSize().getScreenHeight(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: ScreenSize().getScreenHeight(1),
                                      ),
                                      Text(
                                        "Main Menu",
                                        style: FontsStyle().mainMenuTextOne(),
                                      ),
                                      Text(
                                        "Select Buy Airtime To Purchase",
                                        style: FontsStyle().mainText(),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    "assets/images/grid.png",
                                    width: ScreenSize().getScreenHeight(5.5),
                                    height: ScreenSize().getScreenHeight(5.5),
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colour().primary(),
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(1),
                            ),
                            HomeCardBtn(
                              image: "assets/images/top_airtime.png",
                              textbtn: 'Buy Airtime',
                              btntype: 'Buy Airtime',
                              btnid: 0,
                              textColor: Colour().secondary(),
                              imageBackgroud: true,
                              contianerHeight: ScreenSize().getScreenHeight(10),
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(0.8),
                            ),
                            HomeCardBtn(
                              image: "assets/images/topup.png",
                              textbtn: 'TopUp Wallet',
                              btntype: 'TopUp Wallet',
                              btnid: 1,
                              imageBackgroud: true,
                              contianerHeight: ScreenSize().getScreenHeight(10),
                              textColor: Colour().secondary(),
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(0.8),
                            ),
                            HomeCardBtn(
                                image: "assets/images/esim.png",
                                textbtn: 'Get eSIM',
                                btntype: 'Get eSIM',
                                btnid: 2,
                                textColor: Colour().secondary(),
                                imageBackgroud: true,
                                contianerHeight:
                                    ScreenSize().getScreenHeight(10)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenSize().getScreenHeight(1),
                    ),
                    Text(
                      "Offers & Promos",
                      style: FontsStyle().mainMenuText(),
                    ),
                    const Divider(),
                    SizedBox(
                      height: ScreenSize().getScreenHeight(1),
                    ),
                    const Flyer(),
                    const Expanded(
                      child: SizedBox.shrink(),
                    ),
                    const Footer()
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

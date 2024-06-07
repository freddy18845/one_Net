import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/change_pinpad_theme_view_model.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/home_screen.dart';

import 'package:one_net/widgets/footer.dart';
import 'package:one_net/widgets/home_card_btn.dart';
import 'package:one_net/widgets/round_btn.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ESIMOptionScreen extends StatelessWidget {
  const ESIMOptionScreen({super.key});

  // TextEditingController amountCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<PinpadThemeView>(context).colourTheme(context);
    final String transactionType =
        Provider.of<StoreViewModel>(context).getTxnType();

    return Scaffold(
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
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: RoundBtn(
                                          btnLabel: Icon(
                                            Icons.arrow_back,
                                            color: Colour().primary(),
                                            size:
                                                ScreenSize().getScreenHeight(4),
                                          ),
                                          innerColor: Colour().secondary(),
                                          outerColor: Colour().primary(),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height:
                                                ScreenSize().getScreenHeight(1),
                                          ),
                                          Text(
                                            transactionType.toString(),
                                            style: FontsStyle().mainMenuText(),
                                          ),
                                          SizedBox(
                                            height:
                                                ScreenSize().getScreenHeight(1),
                                          ),
                                          Text(
                                            "Select An Option Below",
                                            style: FontsStyle().buyTextGold(),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (context, animation1,
                                                      animation2) =>
                                                  HomeScreen(),
                                              transitionDuration: Duration.zero,
                                              reverseTransitionDuration:
                                                  Duration.zero,
                                            ),
                                          );
                                        },
                                        child: RoundBtn(
                                          btnLabel: Image.asset(
                                            "assets/images/home_logo.png",
                                            width: ScreenSize()
                                                .getScreenHeight(3.5),
                                            height: ScreenSize()
                                                .getScreenHeight(3.5),
                                            fit: BoxFit.contain,
                                          ),
                                          innerColor: Colour().secondary(),
                                          outerColor: Colour().primary(),
                                        ),
                                      )
                                    ])),
                            Divider(
                              thickness: 1,
                              color: Colour().primary(),
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(1),
                            ),
                            HomeCardBtn(
                              image: "assets/images/esim.png",
                              textbtn: 'Existing User',
                              btntype: 'Get eSIM',
                              textColor: Colour().secondary(),
                              imageBackgroud: false,
                              contianerHeight: ScreenSize().getScreenHeight(12),
                              btnid: 3,
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(1.5),
                            ),
                            HomeCardBtn(
                              image: "assets/images/esim.png",
                              textbtn: 'New Subscriber',
                              btntype: 'Get eSIM',
                              imageBackgroud: false,
                              btnid: 4,
                              contianerHeight: ScreenSize().getScreenHeight(12),
                              textColor: Colour().secondary(),
                            ),
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
                    Container(
                      clipBehavior: Clip.hardEdge,
                      height: ScreenSize().getScreenHeight(22),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage("assets/images/flyers/ads2.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(
                          ScreenSize().getScreenHeight(1.5),
                        ),
                      ),
                    ),
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

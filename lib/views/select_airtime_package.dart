import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/currency_format.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/change_pinpad_theme_view_model.dart';
import 'package:one_net/view_models/currency_selection.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/custom_recharge.dart';
import 'package:one_net/views/home_screen.dart';
import 'package:one_net/views/select_payment.dart';
import 'package:one_net/widgets/button.dart';
import 'package:one_net/widgets/footer.dart';
import 'package:one_net/widgets/round_btn.dart';
import 'package:provider/provider.dart';

import '../widgets/header.dart';

class SelectAirtimePackageScreen extends StatelessWidget {
  const SelectAirtimePackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

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
          child: Consumer<CurrencySelectionViewModel>(
            builder: (context, myCurrency, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/logo2.png",
                    width: ScreenSize().getScreenWidth(70),
                    height: ScreenSize().getScreenHeight(15),
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize().getScreenHeight(2),
                    ),
                    child: Container(
                      height: ScreenSize().getScreenHeight(70),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(166, 119, 118, 116), //New
                            blurRadius: 25.0,
                          )
                        ],
                        image: const DecorationImage(
                            image: AssetImage("assets/images/card.jpg"),
                            fit: BoxFit.fill),
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
                            Consumer<StoreViewModel>(
                              builder: (context, myTxnType, child) {
                                return Header(
                                  showHome: true,
                                  showPrevious: false,
                                  titleText: myTxnType
                                      .transactionData["TransactionType"]
                                      .toString(),
                                  subtitleText: 'Select Currency Below',
                                  previousFunction: () {
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            ),
                            Divider(
                              thickness: 1,
                              color: Colour().primary(),
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(1),
                            ),
                            Text(
                              "Direct Recharge",
                              style: FontsStyle().rechargeText(),
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(1),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Provider.of<StoreViewModel>(context,
                                            listen: false)
                                        .setRechargeAmount("5");
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                const SelectPaymentOption(),
                                        transitionDuration: Duration.zero,
                                        reverseTransitionDuration:
                                            Duration.zero,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: ScreenSize().getScreenHeight(9),
                                    width: ScreenSize().getScreenWidth(40),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/tag1.png"),
                                          fit: BoxFit.fill),
                                    ),
                                    child: Center(
                                        child: Text(
                                            myCurrency.activeCurrency +
                                                Currency().format("5"),
                                            style: FontsStyle().priceText())),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Provider.of<StoreViewModel>(context,
                                            listen: false)
                                        .setRechargeAmount("10");
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                const SelectPaymentOption(),
                                        transitionDuration: Duration.zero,
                                        reverseTransitionDuration:
                                            Duration.zero,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: ScreenSize().getScreenHeight(9),
                                    width: ScreenSize().getScreenWidth(40),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/tag1.png"),
                                          fit: BoxFit.fill),
                                    ),
                                    child: Center(
                                      child: Text(
                                        myCurrency.activeCurrency +
                                            Currency().format("10"),
                                        style: FontsStyle().priceText(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(2),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Provider.of<StoreViewModel>(context,
                                            listen: false)
                                        .setRechargeAmount("30");
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                const SelectPaymentOption(),
                                        transitionDuration: Duration.zero,
                                        reverseTransitionDuration:
                                            Duration.zero,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: ScreenSize().getScreenHeight(9),
                                    width: ScreenSize().getScreenWidth(40),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/tag2.png"),
                                          fit: BoxFit.fill),
                                    ),
                                    child: Center(
                                        child: Text(
                                            myCurrency.activeCurrency +
                                                Currency().format("30"),
                                            style: FontsStyle().priceText())),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Provider.of<StoreViewModel>(context,
                                            listen: false)
                                        .setRechargeAmount("50");
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                const SelectPaymentOption(),
                                        transitionDuration: Duration.zero,
                                        reverseTransitionDuration:
                                            Duration.zero,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: ScreenSize().getScreenHeight(9),
                                    width: ScreenSize().getScreenWidth(40),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/tag2.png"),
                                          fit: BoxFit.fill),
                                    ),
                                    child: Center(
                                        child: Text(
                                            myCurrency.activeCurrency +
                                                Currency().format("50"),
                                            style: FontsStyle().priceText())),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(2),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Provider.of<StoreViewModel>(context,
                                            listen: false)
                                        .setRechargeAmount("75");
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                const SelectPaymentOption(),
                                        transitionDuration: Duration.zero,
                                        reverseTransitionDuration:
                                            Duration.zero,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: ScreenSize().getScreenHeight(9),
                                    width: ScreenSize().getScreenWidth(40),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/tag3.png"),
                                          fit: BoxFit.fill),
                                    ),
                                    child: Center(
                                        child: Text(
                                            myCurrency.activeCurrency +
                                                Currency().format("75"),
                                            style: FontsStyle().priceText())),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Provider.of<StoreViewModel>(context,
                                            listen: false)
                                        .setRechargeAmount("100");
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                const SelectPaymentOption(),
                                        transitionDuration: Duration.zero,
                                        reverseTransitionDuration:
                                            Duration.zero,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: ScreenSize().getScreenHeight(9),
                                    width: ScreenSize().getScreenWidth(40),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/tag3.png"),
                                          fit: BoxFit.fill),
                                    ),
                                    child: Center(
                                        child: Text(
                                            myCurrency.activeCurrency +
                                                Currency().format("100"),
                                            style: FontsStyle().priceText())),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(2),
                            ),
                            const Divider(
                              thickness: 1,
                              // color: Colour().primary(),
                            ),
                            Text(
                              "Custom Recharge",
                              style: FontsStyle().rechargeText(),
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(1),
                            ),
                            Button(
                              btnAction: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const CustomRechargeScreen(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              btnLabel: Text(
                                'Custom Amount',
                                style: FontsStyle().startbtnText(),
                              ),
                              btnInwardHightSize:
                                  ScreenSize().getScreenHeight(7),
                              btnOutwardHieghtSize:
                                  ScreenSize().getScreenHeight(8.5),
                              btnInwardWidthSize:
                                  ScreenSize().getScreenWidth(78),
                              btnOutwardWidthSize:
                                  ScreenSize().getScreenWidth(81),
                              inerColor: Colour().primary(),
                              outerColor: Colour().primary().withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize().getScreenHeight(2),
                    ),
                    child: const Footer(),
                  )
                ],
              );
            },
          )),
    );
  }
}

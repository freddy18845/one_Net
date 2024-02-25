import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/currency_format.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/currency_selection.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/custom_recharge.dart';
import 'package:one_net/views/home_screen.dart';
import 'package:one_net/views/select_payment.dart';
import 'package:one_net/widgets/button.dart';
import 'package:one_net/widgets/footer.dart';
import 'package:one_net/widgets/round_btn.dart';
import 'package:provider/provider.dart';

class SelectAirtimePackageScreen extends StatelessWidget {
  const SelectAirtimePackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Provider.of<StoreViewModel>(context, listen: false).setallfield();

    final myCurrency1 =
        Provider.of<CurrencySelectionViewModel>(context, listen: false);
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
                            SizedBox(
                              height: ScreenSize().getScreenHeight(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation1,
                                                  animation2) =>
                                              const HomeScreen(),
                                          transitionDuration: Duration.zero,
                                          reverseTransitionDuration:
                                              Duration.zero,
                                        ),
                                      );
                                    },
                                    child: RoundBtn(
                                      btnLabel: Image.asset(
                                        "assets/images/home_logo.png",
                                        width:
                                            ScreenSize().getScreenHeight(3.5),
                                        height:
                                            ScreenSize().getScreenHeight(3.5),
                                        fit: BoxFit.contain,
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
                                        height: ScreenSize().getScreenHeight(1),
                                      ),
                                      Text(
                                        "Buy Airtime",
                                        style: FontsStyle().mainMenuText(),
                                      ),
                                      SizedBox(
                                        height: ScreenSize().getScreenHeight(1),
                                      ),
                                      Text(
                                        "Select Currency Below",
                                        style: FontsStyle().buyText(),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: ScreenSize().getScreenHeight(6),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colour().primary(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Button(
                                  btnAction: () {
                                    myCurrency.changeCurrency('USD');
                                  },
                                  btnColor: myCurrency.activeCurrency == 'USD'
                                      ? Colour().primary()
                                      : const Color.fromARGB(107, 255, 122, 13),
                                  btnHeight: ScreenSize().getScreenHeight(3),
                                  btnText: Text(
                                    'USD',
                                    style: FontsStyle().curencybtnText(),
                                  ),
                                  btnWight: ScreenSize().getScreenWidth(12),
                                ),
                                SizedBox(
                                  width: ScreenSize().getScreenWidth(3),
                                ),
                                Button(
                                  btnAction: () {
                                    myCurrency.changeCurrency('ZWL');
                                  },
                                  btnColor: myCurrency.activeCurrency == 'ZWL'
                                      ? Colour().primary()
                                      : const Color.fromARGB(107, 255, 122, 13),
                                  btnHeight: ScreenSize().getScreenHeight(3),
                                  btnText: Text(
                                    'ZWL',
                                    style: FontsStyle().curencybtnText(),
                                  ),
                                  btnWight: ScreenSize().getScreenWidth(12),
                                ),
                              ],
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
                                            const CustomRecharge(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              btnColor: Colour().primary(),
                              btnHeight: ScreenSize().getScreenHeight(7),
                              btnText: Text(
                                'Custom Amount',
                                style: FontsStyle().startbtnText(),
                              ),
                              btnWight: double.infinity,
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/change_pinpad_theme_view_model.dart';
import 'package:one_net/view_models/currency_selection.dart';
import 'package:one_net/view_models/keyboard_view_model.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/custom_recharge.dart';
import 'package:one_net/widgets/button.dart';
import 'package:one_net/widgets/footer.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../widgets/airtime_package_tag.dart';
import '../widgets/header.dart';

// ignore: must_be_immutable
class SelectAirtimePackageScreen extends StatelessWidget {
  const SelectAirtimePackageScreen({super.key});

  // TextEditingController amountCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Provider.of<InputAmountViewModel>(context, listen: false)
        .clearCustonAmount();
    Provider.of<PinpadThemeView>(context).colourTheme(context);
    final String transactionType =
        Provider.of<StoreViewModel>(context).getTxnType();

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
                            Header(
                              showHome: true,
                              showPrevious: true,
                              titleText: transactionType.toString(),
                              subtitleText: 'Select Airtime Below',
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
                                AirtimeTag(
                                  airtimeAmt: '5',
                                  tagBg: 'tag1',
                                ),
                                AirtimeTag(
                                  airtimeAmt: '10',
                                  tagBg: 'tag1',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(2),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AirtimeTag(
                                  airtimeAmt: '30',
                                  tagBg: 'tag2',
                                ),
                                AirtimeTag(
                                  airtimeAmt: '50',
                                  tagBg: 'tag2',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(2),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AirtimeTag(
                                  airtimeAmt: '75',
                                  tagBg: 'tag3',
                                ),
                                AirtimeTag(
                                  airtimeAmt: '100',
                                  tagBg: 'tag3',
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
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration:
                                          const Duration(milliseconds: 600),
                                      reverseDuration:
                                          const Duration(milliseconds: 600),
                                      child: const CustomRechargeScreen(),
                                      inheritTheme: true,
                                      ctx: context),
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
                                  ScreenSize().getScreenWidth(83),
                              btnOutwardWidthSize:
                                  ScreenSize().getScreenWidth(87),
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

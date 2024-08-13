import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
import '../constant.dart';
import '../widgets/airtime.dart';
import '../widgets/header.dart';

// ignore: must_be_immutable
class SelectAirtimePackageScreen extends StatefulWidget {
  const SelectAirtimePackageScreen({super.key});

  @override
  State<SelectAirtimePackageScreen> createState() =>
      _SelectAirtimePackageScreenState();
}

bool islaoding = false;

class _SelectAirtimePackageScreenState
    extends State<SelectAirtimePackageScreen> {
  // Initial Selected Value
  String dropdownvalue = 'USD';
  List airtimeData = airtime;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<StoreViewModel>(context, listen: false).setAirtime('');

      // final String transactionType =
      //     Provider.of<StoreViewModel>(context).getTxnType();
      setloader();
    });
  }

  setloader() {
    setState(() {
      islaoding = true;
    });

    Timer(const Duration(milliseconds: 1200), () {
      setState(() {
        islaoding = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
                            const Header(
                              showHome: true,
                              showPrevious: true,
                              titleText: "Buy Airtime",
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
                              height: ScreenSize().getScreenHeight(0.5),
                            ),
                            Container(
                              height: ScreenSize().getScreenHeight(4.8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1, color: Colors.black12),
                                  borderRadius: BorderRadius.circular(
                                      ScreenSize().getScreenHeight(0.8))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        ScreenSize().getScreenWidth(0.3)),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            dropdownvalue = 'USD';
                                          });
                                          Provider.of<CurrencySelectionViewModel>(
                                                  context,
                                                  listen: false)
                                              .changeCurrency(dropdownvalue);
                                          setloader();
                                          Provider.of<StoreViewModel>(context,
                                                  listen: false)
                                              .setAirtime('');
                                        },
                                        child: Container(
                                          height:
                                              ScreenSize().getScreenHeight(4.3),
                                          width:
                                              ScreenSize().getScreenWidth(42),
                                          decoration: BoxDecoration(
                                              color: dropdownvalue == 'USD'
                                                  ? Colour().primary()
                                                  : Colors.white,
                                              borderRadius: BorderRadius
                                                  .circular(ScreenSize()
                                                      .getScreenHeight(0.5)),
                                              border: Border.all(
                                                  width: 1,
                                                  color: dropdownvalue == 'USD'
                                                      ? Colors.transparent
                                                      : Colors.black12)),
                                          child: Center(
                                            child: Text(
                                              'USD',
                                              style: TextStyle(
                                                  color: dropdownvalue == 'USD'
                                                      ? Colors.white
                                                      : Colour().primary(),
                                                  fontSize: ScreenSize()
                                                      .getScreenHeight(1.5),
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            dropdownvalue = 'ZiG';
                                          });
                                          Provider.of<CurrencySelectionViewModel>(
                                                  context,
                                                  listen: false)
                                              .changeCurrency(dropdownvalue);
                                          setloader();
                                          Provider.of<StoreViewModel>(context,
                                                  listen: false)
                                              .setAirtime('');
                                        },
                                        child: Container(
                                          height:
                                              ScreenSize().getScreenHeight(4.3),
                                          width:
                                              ScreenSize().getScreenWidth(42),
                                          decoration: BoxDecoration(
                                              color: dropdownvalue == 'ZiG'
                                                  ? Colour().primary()
                                                  : Colors.white,
                                              borderRadius: BorderRadius
                                                  .circular(ScreenSize()
                                                      .getScreenHeight(0.5)),
                                              border: Border.all(
                                                  width: 1,
                                                  color: dropdownvalue == 'ZiG'
                                                      ? Colors.transparent
                                                      : Colors.black12)),
                                          child: Center(
                                            child: Text(
                                              'ZiG',
                                              style: TextStyle(
                                                  color: dropdownvalue == 'ZiG'
                                                      ? Colors.white
                                                      : Colour().primary(),
                                                  fontSize: ScreenSize()
                                                      .getScreenHeight(1.5),
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(0.5),
                            ),
                            Expanded(
                                child: islaoding
                                    ? Center(
                                        child: Image.asset(
                                          'assets/images/loader_1.gif',
                                          fit: BoxFit.fill,
                                          height:
                                              ScreenSize().getScreenHeight(10),
                                          width:
                                              ScreenSize().getScreenHeight(10),
                                          opacity:
                                              const AlwaysStoppedAnimation(0.2),
                                        ),
                                      )
                                    : Animate(
                                        effects: const [
                                          FadeEffect(
                                              duration:
                                                  Duration(milliseconds: 600)),
                                          ScaleEffect(
                                              duration:
                                                  Duration(milliseconds: 600))
                                        ],
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: airtimeData.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return AirtimeTag(
                                              airtimeAmt: airtimeData[index]
                                                  ["airtime"],
                                              airtimeindex: index,
                                            );
                                          },
                                        ),
                                      )),
                            const Divider(
                              thickness: 1,
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

import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/views/home_screen.dart';
import 'package:one_net/views/transaction_inprogess_screen.dart';
import 'package:one_net/widgets/button.dart';
import 'package:one_net/widgets/footer.dart';
import 'package:one_net/widgets/keyboard_btn.dart';
import 'package:one_net/widgets/otp_inputfield.dart';
import 'package:one_net/widgets/round_btn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../view_models/store_view_model.dart';

class EsimOTPScreen extends StatefulWidget {
  const EsimOTPScreen({super.key});

  @override
  State<EsimOTPScreen> createState() => _EsimOTPScreenState();
}

class _EsimOTPScreenState extends State<EsimOTPScreen> {
  List pin = ["", "", "", "", "", ""];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void setPin(String value) {
    for (int i = 0; i < pin.length; i++) {
      print(pin[i]);
      if (pin[i].isEmpty) {
        setState(() {
          pin[i] = value;
        });
        break;
      }
    }
    print(pin);
    //notifyListeners();
  }

  resetPin() {
    setState(() {
      pin = ["", "", "", "", "", ""];
    });
  }

  back() {
    for (int i = pin.length - 1; i >= 0; i--) {
      if (pin[i].isNotEmpty) {
        setState(() {
          pin[i] = "";
        });

        break;
      }
    }
    print(pin);
  }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
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
                height: ScreenSize().getScreenHeight(75),
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
                  padding: EdgeInsets.all(ScreenSize().getScreenHeight(2)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: ScreenSize().getScreenHeight(10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    resetPin();
                                    Provider.of<StoreViewModel>(context,
                                            listen: false)
                                        .seteSimType('Existing User');
                                    Navigator.pop(context);
                                  },
                                  child: RoundBtn(
                                    btnLabel: Icon(
                                      Icons.arrow_back,
                                      color: Colour().primary(),
                                      size: ScreenSize().getScreenHeight(4),
                                    ),
                                    innerColor: Colour().secondary(),
                                    outerColor: Colour().primary(),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: ScreenSize().getScreenHeight(1),
                                    ),
                                    Text(
                                      transactionType.toString(),
                                      style: FontsStyle().mainMenuText(),
                                    ),
                                    SizedBox(
                                      height: ScreenSize().getScreenHeight(1),
                                    ),
                                    Text(
                                      "Enter OTP Code Below",
                                      style: FontsStyle().buyText(),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Provider.of<StoreViewModel>(context,
                                            listen: false)
                                        .seteSimType('');

                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
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
                                      width: ScreenSize().getScreenHeight(3.5),
                                      height: ScreenSize().getScreenHeight(3.5),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OTPInputField(otpValue: pin[0].toString()),
                          OTPInputField(otpValue: pin[1].toString()),
                          OTPInputField(otpValue: pin[2].toString()),
                          OTPInputField(otpValue: pin[3].toString()),
                          OTPInputField(otpValue: pin[4].toString()),
                          OTPInputField(otpValue: pin[5].toString()),
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(3),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KeyboardButton(
                            btnAction: () {
                              setPin('1');
                            },
                            btnLabel: Text(
                              '1',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize().getScreenWidth(1.5),
                          ),
                          KeyboardButton(
                            btnAction: () {
                              setPin('2');
                            },
                            btnLabel: Text(
                              '2',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize().getScreenWidth(1.5),
                          ),
                          KeyboardButton(
                            btnAction: () {
                              setPin('3');
                            },
                            btnLabel: Text(
                              '3',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(1.2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KeyboardButton(
                            btnAction: () {
                              setPin('4');
                            },
                            btnLabel: Text(
                              '4',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize().getScreenWidth(1.5),
                          ),
                          KeyboardButton(
                            btnAction: () {
                              setPin('5');
                            },
                            btnLabel: Text(
                              '5',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize().getScreenWidth(1.5),
                          ),
                          KeyboardButton(
                            btnAction: () {
                              setPin('6');
                            },
                            btnLabel: Text(
                              '6',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(1.2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KeyboardButton(
                            btnAction: () {
                              setPin('7');
                            },
                            btnLabel: Text(
                              '7',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize().getScreenWidth(1.5),
                          ),
                          KeyboardButton(
                            btnAction: () {
                              setPin('8');
                            },
                            btnLabel: Text(
                              '8',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize().getScreenWidth(1.5),
                          ),
                          KeyboardButton(
                            btnAction: () {
                              setPin('9');
                            },
                            btnLabel: Text(
                              '9',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(1.2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KeyboardButton(
                            btnAction: () {
                              // Provider.of<OTPScreenViewModel>(context,
                              //         listen: false)
                              //     .setPin('.', context);
                            },
                            btnLabel: Text(
                              '.',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize().getScreenWidth(1.5),
                          ),
                          KeyboardButton(
                            btnAction: () {
                              setPin('0');
                            },
                            btnLabel: Text(
                              '0',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize().getScreenWidth(1.5),
                          ),
                          KeyboardButton(
                            btnAction: () {
                              back();
                            },
                            btnLabel: Image.asset(
                              "assets/images/clear.png",
                              width: ScreenSize().getScreenWidth(10),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(7),
                      ),
                      Button(
                        btnAction: pin.length < 6
                            ? () {}
                            : () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      reverseDuration:
                                          const Duration(milliseconds: 200),
                                      child: const TransactionInprogress(),
                                      inheritTheme: true,
                                      ctx: context),
                                );
                              },
                        inerColor: pin.length < 6
                            ? const Color.fromARGB(255, 245, 195, 154)
                            : Colour().primary(),
                        btnLabel: Text(
                          'Proceed ',
                          style: pin.length < 6
                              ? FontsStyle().startbtnTextdisable()
                              : FontsStyle().startbtnText(),
                        ),
                        btnInwardHightSize: ScreenSize().getScreenHeight(7),
                        btnOutwardHieghtSize: ScreenSize().getScreenHeight(8.5),
                        btnInwardWidthSize: ScreenSize().getScreenWidth(83),
                        btnOutwardWidthSize: ScreenSize().getScreenWidth(87),
                        outerColor: Colour().primary().withOpacity(0.2),
                      )
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
        ),
      ),
    );
  }
}

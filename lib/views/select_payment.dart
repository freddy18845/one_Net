import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/change_pinpad_theme_view_model.dart';
import 'package:one_net/view_models/currency_selection.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/qr_scan_screen.dart';
import 'package:one_net/widgets/footer.dart';
import 'package:one_net/widgets/header.dart';
import 'package:one_net/widgets/payment_btn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../utils/currency_format.dart';

class SelectPaymentOption extends StatefulWidget {
  const SelectPaymentOption({super.key});

  @override
  State<SelectPaymentOption> createState() => _SelectPaymentOptionState();
}

class _SelectPaymentOptionState extends State<SelectPaymentOption> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Provider.of<StoreViewModel>(context, listen: false).clearmomoNumber();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Provider.of<CurrencySelectionViewModel>(context, listen: false);
    Provider.of<PinpadThemeView>(context).colourTheme(context);

    final myCurrency =
        Provider.of<CurrencySelectionViewModel>(context, listen: false);
    final String transactionType =
        Provider.of<StoreViewModel>(context).getTxnType();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer<StoreViewModel>(
          builder: (context, myType, child) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/home.png"),
                    fit: BoxFit.cover),
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
                              subtitleText: 'Payment Method',
                            ),
                            Divider(
                              thickness: 1,
                              color: Colour().primary(),
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(2),
                            ),
                            Container(
                                height: transactionType == "Get eSIM"
                                    ? ScreenSize().getScreenHeight(31)
                                    : ScreenSize().getScreenHeight(27),
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/Subtract_one.png"),
                                      fit: BoxFit.fill),
                                ),
                                child: Consumer<StoreViewModel>(
                                  builder: (context, amount, child) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            ScreenSize().getScreenHeight(2.5),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                              height: ScreenSize()
                                                  .getScreenHeight(2)),
                                          Text(
                                            "Amount To Pay",
                                            style: FontsStyle().buyText(),
                                          ),
                                          Text(
                                            myCurrency.activeCurrency +
                                                Currency().format(
                                                  amount.transactionData[
                                                          "totalPrice"]
                                                      .toString(),
                                                ),
                                            //  "Amount To Pay",

                                            style: FontsStyle().cardAmtText(),
                                          ),
                                          Text(
                                            "Will Be Debited From Your Account ",
                                            style: FontsStyle().debitText(),
                                          ),
                                          Image.asset(
                                            "assets/images/dash.png",
                                            width: double.infinity,
                                          ),
                                          transactionType != "Get eSIM"
                                              ? const SizedBox.shrink()
                                              : SizedBox(
                                                  height: ScreenSize()
                                                      .getScreenHeight(1),
                                                ),
                                          transactionType != "Get eSIM"
                                              ? const SizedBox.shrink()
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "eSIM Fee",
                                                      style: FontsStyle()
                                                          .debitText(),
                                                    ),
                                                    Text(
                                                      Currency().format(amount
                                                              .transactionData[
                                                          "0"]),
                                                      style: FontsStyle()
                                                          .debitText(),
                                                    ),
                                                  ],
                                                ),
                                          SizedBox(
                                            height:
                                                ScreenSize().getScreenHeight(1),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Processing Fee",
                                                style: FontsStyle().debitText(),
                                              ),
                                              Text(
                                                transactionType != "Get eSIM"
                                                    ? "2.00"
                                                    : "0.00",
                                                style: FontsStyle().debitText(),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                ScreenSize().getScreenHeight(1),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Subtotal",
                                                style: FontsStyle().debitText(),
                                              ),
                                              Text(
                                                Currency().format(
                                                    amount.transactionData[
                                                        "rechargeAmount"]),
                                                style: FontsStyle().debitText(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(1),
                            ),
                            Text(
                              "Select Payment Method",
                              style: FontsStyle().rechargeText(),
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(1),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PaymentButton(
                                  btnAction: () {
                                    myType.setPayment("Card", context);
                                  },
                                  btnText: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/visa.png",
                                        width: ScreenSize().getScreenWidth(9),
                                        height: ScreenSize().getScreenHeight(5),
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(
                                        height: ScreenSize().getScreenHeight(1),
                                      ),
                                      Text(
                                        "Card",
                                        style: FontsStyle().mainText(),
                                      )
                                    ],
                                  ),
                                ),
                                PaymentButton(
                                  btnAction: () {
                                    myType.setPayment("Mobile Money", context);
                                  },
                                  btnText: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/mobile.png",
                                        width: ScreenSize().getScreenWidth(9),
                                        height: ScreenSize().getScreenHeight(5),
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(
                                        height: ScreenSize().getScreenHeight(1),
                                      ),
                                      Text(
                                        "Mobile Money",
                                        style: FontsStyle().mainText(),
                                      )
                                    ],
                                  ),
                                ),
                                PaymentButton(
                                  btnAction: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          duration:
                                              const Duration(milliseconds: 200),
                                          reverseDuration:
                                              const Duration(milliseconds: 200),
                                          child: const QRCodePaymentScreen(),
                                          inheritTheme: true,
                                          ctx: context),
                                    );

                                    myType.setPayment("QR", context);
                                  },
                                  btnText: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/qr.png",
                                        width: ScreenSize().getScreenWidth(9),
                                        height: ScreenSize().getScreenHeight(5),
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(
                                        height: ScreenSize().getScreenHeight(1),
                                      ),
                                      Text(
                                        "QR Code",
                                        style: FontsStyle().mainText(),
                                      )
                                    ],
                                  ),
                                ),
                              ],
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
            );
          },
        ));
  }
}

import 'dart:async';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/currency_format.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/currency_selection.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/transaction_inprogess_screen.dart';
import 'package:one_net/widgets/footer.dart';
import 'package:one_net/widgets/round_btn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class QRCodePaymentScreen extends StatelessWidget {
  const QRCodePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myCurrency =
        Provider.of<CurrencySelectionViewModel>(context, listen: false);
    var navigateTime = Timer(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 200),
            reverseDuration: const Duration(milliseconds: 200),
            child: const TransactionInprogress(),
            inheritTheme: true,
            ctx: context),
      );
      // Navigator.push(
      //   context,
      //   PageRouteBuilder(
      //     pageBuilder: (context, animation1, animation2) =>
      //         const TransactionInprogress(),
      //     transitionDuration: Duration.zero,
      //     reverseTransitionDuration: Duration.zero,
      //   ),
      // );
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                height: ScreenSize().getScreenHeight(67),
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
                  padding: EdgeInsets.all(ScreenSize().getScreenHeight(3)),
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
                                    navigateTime.cancel();
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
                                      "QR Code",
                                      style: FontsStyle().mainMenuText(),
                                    ),
                                    SizedBox(
                                      height: ScreenSize().getScreenHeight(1),
                                    ),
                                    Text(
                                      "Scan The QR Code",
                                      style: FontsStyle().buyText(),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: ScreenSize().getScreenHeight(9),
                                )
                              ])),
                      Divider(
                        thickness: 1,
                        color: Colour().primary(),
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(1),
                      ),
                      Container(
                          height: ScreenSize().getScreenHeight(20),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/subtract.png"),
                                fit: BoxFit.fill),
                          ),
                          child: Consumer<StoreViewModel>(
                            builder: (context, amount, child) {
                              return Column(
                                children: [
                                  SizedBox(
                                      height: ScreenSize().getScreenHeight(2)),
                                  Text(
                                    "Amount To Pay",
                                    style: FontsStyle().buyText(),
                                  ),
                                  Text(
                                    myCurrency.activeCurrency +
                                        Currency().format(
                                          amount.transactionData["totalPrice"]
                                              .toString(),
                                        ),
                                    //  "Amount To Pay",

                                    style: FontsStyle().cardAmtText(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          ScreenSize().getScreenHeight(3.5),
                                    ),
                                    child: Image.asset(
                                      "assets/images/dash.png",
                                      width: double.infinity,
                                    ),
                                  ),
                                  SizedBox(
                                    height: ScreenSize().getScreenHeight(1),
                                  ),
                                  Text(
                                    "Will Be Debited From Your Account ",
                                    style: FontsStyle().debitText(),
                                  ),
                                ],
                              );
                            },
                          )),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(2),
                      ),
                      Consumer<StoreViewModel>(
                        builder: (context, myQrCode, child) {
                          return Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: ScreenSize().getScreenHeight(15),
                                  height: ScreenSize().getScreenHeight(15),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3, color: Colour().primary())),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: ScreenSize().getScreenHeight(1)),
                                  child: BarcodeWidget(
                                    drawText: false,
                                    barcode: Barcode
                                        .qrCode(), // Barcode type and settings
                                    data:
                                        '{"payment":"QR Code","merchant":"One Net", "amount":${myQrCode.transactionData["rechargeAmount"].toString()}, "currency":"USD","paymentId":${myQrCode.transactionData["receiptNum"].toString()},"callbackUrl":""}', // Content

                                    width: ScreenSize().getScreenHeight(13),
                                    height: ScreenSize().getScreenHeight(13),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(2),
                      ),
                      Text(
                        " Scan To Tap To Pay",
                        style: FontsStyle().rechargeText(),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colour().primary(),
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(2),
                      ),
                      Image.asset(
                        "assets/images/Vs.png",
                        width: double.infinity,
                        height: ScreenSize().getScreenHeight(4),
                        fit: BoxFit.contain,
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
        ),
      ),
    );
  }
}

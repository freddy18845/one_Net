import 'dart:async';

import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/widgets/button.dart';
import 'package:page_transition/page_transition.dart';
import '../view_models/store_view_model.dart';
import '../views/input_recipientNo.dart';
import '../view_models/currency_selection.dart';
import 'package:provider/provider.dart';
import 'package:one_net/utils/currency_format.dart';

import '../views/select_payment.dart';

confirmAirtimeAlert(context, String airtimeAmt) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        double btnInHeightSize = ScreenSize().getScreenHeight(7);
        double btnOutHeightSize = ScreenSize().getScreenHeight(8);
        double btnInWidthSize = ScreenSize().getScreenWidth(33);
        double btnOutWidthSize = ScreenSize().getScreenWidth(35);
        final String currency =
            Provider.of<CurrencySelectionViewModel>(context, listen: false)
                .activeCurrency;
        final String transactionType =
            Provider.of<StoreViewModel>(context).getTxnType();

        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          contentPadding: const EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding:
              EdgeInsets.symmetric(vertical: ScreenSize().getScreenWidth(0)),
          content: SizedBox(
            height: ScreenSize().getScreenHeight(37),
            width: ScreenSize().getScreenWidth(80),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: ScreenSize().getScreenHeight(23),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                                "assets/images/confirmation_modal.png"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(
                          ScreenSize().getScreenHeight(2),
                        ),
                        border:
                            Border.all(width: 2, color: Colour().primary())),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenSize().getScreenHeight(3),
                          horizontal: ScreenSize().getScreenWidth(5)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: ScreenSize().getScreenHeight(2),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Name",
                                  style: FontsStyle().airtimetitle(),
                                ),
                                Text(
                                  currency == 'USD'
                                      ? "USD Airtime"
                                      : "ZiG Airtime",
                                  style: FontsStyle().airtimetext(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: double.infinity,
                              child: Divider(
                                thickness: 1,
                                color: Colors.black12,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Amount",
                                  style: FontsStyle().airtimetitle(),
                                ),
                                currency == 'USD'
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.attach_money,
                                            color: Colors.black,
                                            weight:
                                                ScreenSize().getScreenWidth(40),
                                            size: ScreenSize()
                                                .getScreenHeight(1.5),
                                          ),
                                          Text(Currency().format(airtimeAmt),
                                              style:
                                                  FontsStyle().airtimetext()),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(currency,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: ScreenSize()
                                                      .getScreenHeight(1.2),
                                                  fontWeight: FontWeight.w700)),
                                          Text(Currency().format(airtimeAmt),
                                              style:
                                                  FontsStyle().airtimetext()),
                                        ],
                                      ),
                              ],
                            ),
                            const SizedBox(
                              width: double.infinity,
                              child: Divider(
                                thickness: 1,
                                color: Colors.black12,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Validity Period",
                                  style: FontsStyle().airtimetitle(),
                                ),
                                Text(
                                  "30 Days",
                                  style: FontsStyle().airtimetext(),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: ScreenSize().getScreenHeight(0.5)),
                    child: Image.asset("assets/images/circle.png",
                        height: ScreenSize().getScreenHeight(10),
                        width: ScreenSize().getScreenHeight(10),
                        fit: BoxFit.cover),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: ScreenSize().getScreenWidth(3),
                        right: ScreenSize().getScreenWidth(3),
                        top: ScreenSize().getScreenHeight(13)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                            btnLabel: Text(
                              'Back',
                              style: FontsStyle().startbtnText(),
                            ),
                            btnInwardHightSize: btnInHeightSize,
                            btnOutwardHieghtSize: btnOutHeightSize,
                            btnInwardWidthSize: btnInWidthSize,
                            btnOutwardWidthSize: btnOutWidthSize,
                            outerColor: Colour().primary().withOpacity(0.2),
                            inerColor: Colors.red,
                            btnAction: () {
                              Navigator.pop(context);
                            }),
                        Button(
                          btnLabel: Text(
                            'Buy',
                            style: FontsStyle().startbtnText(),
                          ),
                          btnInwardHightSize: btnInHeightSize,
                          btnOutwardHieghtSize: btnOutHeightSize,
                          btnInwardWidthSize: btnInWidthSize,
                          btnOutwardWidthSize: btnOutWidthSize,
                          outerColor: Colour().primary().withOpacity(0.2),
                          btnAction: () {
                            if (transactionType == "Get eSIM") {
                              Provider.of<StoreViewModel>(context,
                                      listen: false)
                                  .setAmount(airtimeAmt);
                              Provider.of<StoreViewModel>(context,
                                      listen: false)
                                  .setAirtime('');

                              Timer(const Duration(seconds: 1), () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      reverseDuration:
                                          const Duration(milliseconds: 200),
                                      child: const SelectPaymentOption(),
                                      inheritTheme: true,
                                      ctx: context),
                                );
                              });
                            } else {
                              Provider.of<StoreViewModel>(context,
                                      listen: false)
                                  .setRechargeAmount(airtimeAmt);

                              Timer(const Duration(seconds: 1), () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      reverseDuration:
                                          const Duration(milliseconds: 200),
                                      child: const InputRecipientNumScreen(),
                                      inheritTheme: true,
                                      ctx: context),
                                );
                              });
                              Provider.of<StoreViewModel>(context,
                                      listen: false)
                                  .setAirtime('');
                            }
                          },
                          inerColor: Colour().green(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}

import 'package:flutter/material.dart';
import 'package:one_net/utils/currency_format.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/views/select_payment.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../utils/screen_size.dart';
import '../view_models/store_view_model.dart';
import '../views/input_recipientNo.dart';

// ignore: must_be_immutable
class AirtimeTag extends StatelessWidget {
  String airtimeAmt;
  String tagBg;
  AirtimeTag({super.key, required this.airtimeAmt, required this.tagBg});

  @override
  Widget build(BuildContext context) {
    final String transactionType =
        Provider.of<StoreViewModel>(context).getTxnType();
    return InkWell(
      onTap: () {
        Provider.of<StoreViewModel>(context, listen: false)
            .setRechargeAmount(airtimeAmt);
        // confirmDataAlert(context, "airtime", airtimeAmt.toString());

        if (transactionType == "Get eSIM") {
          Provider.of<StoreViewModel>(context, listen: false)
              .setAmount(airtimeAmt);
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  const SelectPaymentOption(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        } else {
          Provider.of<StoreViewModel>(context, listen: false)
              .setRechargeAmount(airtimeAmt);
          Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 200),
                reverseDuration: const Duration(milliseconds: 200),
                child: const InputRecipientNumScreen(),
                inheritTheme: true,
                ctx: context),
          );
        }
      },
      child: Container(
        height: ScreenSize().getScreenHeight(9),
        width: ScreenSize().getScreenWidth(40),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/$tagBg.png"), fit: BoxFit.fill),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.attach_money,
              color: Colors.black,
              weight: ScreenSize().getScreenWidth(40),
              size: ScreenSize().getScreenHeight(3),
            ),
            Text(Currency().format(airtimeAmt),
                style: FontsStyle().priceText()),
          ],
        ),
      ),
    );
  }
}

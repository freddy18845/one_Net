import 'dart:async';

import 'package:flutter/material.dart';
import 'package:one_net/utils/currency_format.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:provider/provider.dart';
import '../utils/colour.dart';
import '../utils/screen_size.dart';
import '../view_models/currency_selection.dart';
import '../view_models/store_view_model.dart';
import 'airtime_modal.dart';

// ignore: must_be_immutable
class AirtimeTag extends StatefulWidget {
  String airtimeAmt;
  int airtimeindex;

  AirtimeTag({super.key, required this.airtimeAmt, required this.airtimeindex});

  @override
  State<AirtimeTag> createState() => _AirtimeTagState();
}

class _AirtimeTagState extends State<AirtimeTag> {
  @override
  Widget build(BuildContext context) {
    final String currency =
        Provider.of<CurrencySelectionViewModel>(context, listen: false)
            .activeCurrency;

    return InkWell(
      onTap: () {
        Provider.of<StoreViewModel>(context, listen: false)
            .setRechargeAmount(widget.airtimeAmt);
        Provider.of<StoreViewModel>(context, listen: false)
            .setAirtime(widget.airtimeAmt);
        Timer(const Duration(milliseconds: 200), () {
          confirmAirtimeAlert(context, widget.airtimeAmt.toString());
        });
      },
      child: Container(
        color: widget.airtimeindex.floor().isEven
            ? Colour().primary().withOpacity(0.1)
            : Colors.white70,
        child: ListTile(
          leading: SizedBox(
              width: ScreenSize().getScreenWidth(70),
              child: Row(
                children: [
                  Text("$currency Airtime", style: FontsStyle().airtimeText()),
                  SizedBox(
                    width: ScreenSize().getScreenWidth(10),
                  ),
                  Text("30 Days", style: FontsStyle().airtimeText()),
                  SizedBox(
                    width: ScreenSize().getScreenWidth(10),
                  ),
                  currency == 'USD'
                      ? Row(
                          children: [
                            Icon(
                              Icons.attach_money,
                              color: Colour().dark(),
                              weight: ScreenSize().getScreenWidth(40),
                              size: ScreenSize().getScreenHeight(1.8),
                            ),
                            SizedBox(
                              width: ScreenSize().getScreenWidth(0.5),
                            ),
                            Text(Currency().format(widget.airtimeAmt),
                                style: FontsStyle().priceText()),
                          ],
                        )
                      : Row(
                          children: [
                            Text(currency,
                                style: TextStyle(
                                    color: Colour().dark(),
                                    fontSize: ScreenSize().getScreenHeight(1.6),
                                    fontWeight: FontWeight.w600)),
                            SizedBox(
                              width: ScreenSize().getScreenWidth(0.5),
                            ),
                            Text(Currency().format(widget.airtimeAmt),
                                style: FontsStyle().priceText()),
                          ],
                        ),
                ],
              )),
          trailing: Consumer<StoreViewModel>(
            builder: (context, myData, child) {
              return Icon(
                myData.selectedAmount == widget.airtimeAmt
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: myData.selectedAmount == widget.airtimeAmt
                    ? Colour().green()
                    : Colors.black12.withOpacity(0.2),
                size: ScreenSize().getScreenHeight(2.3),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/keyboard_view_model.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/custom_recharge.dart';
import 'package:one_net/views/select_airtime_package.dart';
import 'package:provider/provider.dart';

class HomeCardBtn extends StatefulWidget {
  const HomeCardBtn(
      {super.key,
      required this.image,
      required this.textbtn,
      required this.btntype});
  final String image;
  final String textbtn;
  final String btntype;
  @override
  State<HomeCardBtn> createState() => _HomeCardBtnState();
}

bool isPressed = false;

class _HomeCardBtnState extends State<HomeCardBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPressed = true;
        });

        Timer(const Duration(milliseconds: 200), () {
          setState(() {
            isPressed = false;
          });
          Provider.of<StoreViewModel>(context, listen: false)
              .setTxnType(widget.btntype);
          if (widget.btntype == "Buy Airtime") {
            Provider.of<InputAmountViewModel>(context, listen: false)
                .setNetworks(true);
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const SelectAirtimePackageScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          } else {
            Provider.of<InputAmountViewModel>(context, listen: false)
                .setNetworks(false);
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const CustomRechargeScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          }
        });
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: ScreenSize().getScreenHeight(13.5),
        width: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("assets/images/airtime.png"),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(
            ScreenSize().getScreenHeight(2.5),
          ),
          border: isPressed
              ? Border.all(width: 5, color: Colour().primary())
              : Border.all(width: 3, color: Colors.transparent),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: ScreenSize().getScreenWidth(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                widget.image,
                width: ScreenSize().getScreenWidth(10),
                height: ScreenSize().getScreenHeight(8),
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: ScreenSize().getScreenWidth(3),
              ),
              Text(
                widget.textbtn,
                style: FontsStyle().buyAirtimeText(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

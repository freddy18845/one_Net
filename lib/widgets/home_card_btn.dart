import 'dart:async';

import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/keyboard_view_model.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/custom_recharge.dart';
import 'package:one_net/views/esim_option.dart';
import 'package:one_net/views/new_esim_screen.dart';
import 'package:one_net/views/select_airtime_package.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../views/input_recipientNo.dart';

class HomeCardBtn extends StatefulWidget {
  const HomeCardBtn(
      {super.key,
      required this.image,
      required this.textbtn,
      required this.btntype,
      required this.textColor,
      required this.imageBackgroud,
      required this.contianerHeight,
      required this.btnid});
  final String image;
  final double contianerHeight;
  final String textbtn;
  final Color textColor;
  final String btntype;
  final int btnid;
  final bool imageBackgroud;
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
          switch (widget.btnid) {
            case 0:
              {
                Provider.of<InputAmountViewModel>(context, listen: false)
                    .setNetworks(true);
                Provider.of<InputAmountViewModel>(context, listen: false)
                    .clearCustonAmount();
                Provider.of<StoreViewModel>(context, listen: false)
                    .txnType(true);

                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 200),
                      reverseDuration: const Duration(milliseconds: 200),
                      child: const SelectAirtimePackageScreen(),
                      inheritTheme: true,
                      ctx: context),
                );
              }
              break;
            case 1:
              {
                Provider.of<InputAmountViewModel>(context, listen: false)
                    .setNetworks(false);
                Provider.of<InputAmountViewModel>(context, listen: false)
                    .clearCustonAmount();
                Provider.of<StoreViewModel>(context, listen: false)
                    .txnType(true);

                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 200),
                      reverseDuration: const Duration(milliseconds: 200),
                      child: const CustomRechargeScreen(),
                      inheritTheme: true,
                      ctx: context),
                );
              }
              break;

            case 2:
              {
                Provider.of<StoreViewModel>(context, listen: false)
                    .txnType(false);
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 200),
                      reverseDuration: const Duration(milliseconds: 200),
                      child: const ESIMOptionScreen(),
                      inheritTheme: true,
                      ctx: context),
                );
              }
              break;
            case 3:
              {
                Provider.of<InputAmountViewModel>(context, listen: false)
                    .setNetworks(false);
                Provider.of<StoreViewModel>(context, listen: false)
                    .seteSimType('Existing User');
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
              break;
            case 4:
              {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 200),
                      reverseDuration: const Duration(milliseconds: 200),
                      child: const SelectNewEsimScreen(),
                      inheritTheme: true,
                      ctx: context),
                );
                // Navigator.push(
                //   context,
                //   PageRouteBuilder(
                //     pageBuilder: (context, animation1, animation2) =>
                //         const SelectNewEsimScreen(),
                //     transitionDuration: Duration.zero,
                //     reverseTransitionDuration: Duration.zero,
                //   ),
                // );
              }
              break;
          }
        });
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        // height: ScreenSize().getScreenHeight(13),
        height: widget.contianerHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("assets/images/airtime.png"),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(
            ScreenSize().getScreenHeight(1.5),
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
                width: widget.imageBackgroud
                    ? ScreenSize().getScreenWidth(9)
                    : ScreenSize().getScreenWidth(12),
                height: widget.imageBackgroud
                    ? ScreenSize().getScreenHeight(6)
                    : ScreenSize().getScreenHeight(8),
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: ScreenSize().getScreenWidth(3),
              ),
              Text(
                widget.textbtn,
                style: TextStyle(
                    color: widget.textColor,
                    fontSize: widget.imageBackgroud
                        ? ScreenSize().getScreenHeight(2.5)
                        : ScreenSize().getScreenHeight(2.8),
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

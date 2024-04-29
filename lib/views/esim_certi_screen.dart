import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/cert_txn_inprogress.dart';
import 'package:one_net/views/splash_screen.dart';
import 'package:one_net/views/transaction_inprogess_screen.dart';
import 'package:one_net/widgets/button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../widgets/confirmation_modal.dart';

class EsimCertiScreen extends StatelessWidget {
  const EsimCertiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double btnInHeightSize = ScreenSize().getScreenHeight(5);
    double btnOutHeightSize = ScreenSize().getScreenHeight(6);
    double btnInWidthSize = ScreenSize().getScreenWidth(30);
    double btnOutWidthSize = ScreenSize().getScreenWidth(32);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/txn_inprogess.png"),
              fit: BoxFit.fill),
        ),
        child: Center(
          child: Container(
            height: ScreenSize().getScreenHeight(65),
            width: ScreenSize().getScreenWidth(80),
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/cert_bg.png"),
                  fit: BoxFit.cover),
              border: Border.all(width: 3, color: Colour().primary()),
              borderRadius: BorderRadius.circular(
                ScreenSize().getScreenHeight(2),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize().getScreenWidth(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: ScreenSize().getScreenHeight(1.5),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/cert_qr.png",
                      width: ScreenSize().getScreenHeight(16),
                      height: ScreenSize().getScreenHeight(16),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: ScreenSize().getScreenHeight(2),
                  ),
                  Text(
                    "Congratulations".toUpperCase(),
                    style: FontsStyle().congrats(),
                  ),
                  Text(
                    "Your eSIM Is successfully Created!",
                    style: FontsStyle().recipientNumName(),
                  ),
                  SizedBox(
                    height: ScreenSize().getScreenHeight(0.5),
                  ),
                  Center(
                    child: Text(
                      "Download Your eSIM By Scanning QR code On Your Mobile Device . ",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenSize().getScreenHeight(0.8),
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Center(
                    child: Text(
                      "This Replaces Standard SIM Cards By Downloading ",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenSize().getScreenHeight(0.8),
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Center(
                    child: Text(
                      "The SIM Info  On Your Phone.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenSize().getScreenHeight(0.8),
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: ScreenSize().getScreenHeight(0.5),
                  ),
                  const Divider(
                    color: Colors.black87,
                    thickness: 1.5,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "MSISDN",
                            style: FontsStyle().invoicetext(),
                          ),
                          Text(
                            '233200068758',
                            style: FontsStyle().invoicetext1(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ICCID",
                            style: FontsStyle().invoicetext(),
                          ),
                          Text(
                            '8923302050020013008',
                            style: FontsStyle().invoicetext1(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "PIN 1",
                            style: FontsStyle().invoicetext(),
                          ),
                          Text(
                            '1234',
                            style: FontsStyle().invoicetext1(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "PIN 2",
                            style: FontsStyle().invoicetext(),
                          ),
                          Text(
                            '4734',
                            style: FontsStyle().invoicetext1(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "PUK 1",
                            style: FontsStyle().invoicetext(),
                          ),
                          Text(
                            '87994856',
                            style: FontsStyle().invoicetext1(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "PUK 2",
                            style: FontsStyle().invoicetext(),
                          ),
                          Text(
                            '55504503',
                            style: FontsStyle().invoicetext1(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenSize().getScreenHeight(1),
                  ),
                  const Divider(
                    color: Colors.black87,
                    thickness: 1.5,
                  ),
                  SizedBox(
                    height: ScreenSize().getScreenHeight(1.5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(
                          btnLabel: Text(
                            'Email',
                            style: FontsStyle().startbtnText(),
                          ),
                          btnInwardHightSize: btnInHeightSize,
                          btnOutwardHieghtSize: btnOutHeightSize,
                          btnInwardWidthSize: btnInWidthSize,
                          btnOutwardWidthSize: btnOutWidthSize,
                          outerColor: Colour().primary().withOpacity(0.2),
                          inerColor: Colour().primary(),
                          btnAction: () {
                            confirmDataAlert(context, "email", "send_email");
                          }),
                      Button(
                        btnLabel: Text(
                          'Print',
                          style: FontsStyle().startbtnText(),
                        ),
                        btnInwardHightSize: btnInHeightSize,
                        btnOutwardHieghtSize: btnOutHeightSize,
                        btnInwardWidthSize: btnInWidthSize,
                        btnOutwardWidthSize: btnOutWidthSize,
                        outerColor: Colour().primary().withOpacity(0.2),
                        btnAction: () {
                          Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                duration: const Duration(milliseconds: 200),
                                reverseDuration:
                                    const Duration(milliseconds: 200),
                                child: const TransactionInprogress(),
                                inheritTheme: true,
                                ctx: context),
                          );
                        },
                        inerColor: Colour().primary(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

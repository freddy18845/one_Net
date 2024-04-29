import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/widgets/button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../views/select_airtime_package.dart';
import '../views/transaction_inprogess_screen.dart';

confirmDataAlert(context, String myDataType, String myData) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        double btnInHeightSize = ScreenSize().getScreenHeight(7);
        double btnOutHeightSize = ScreenSize().getScreenHeight(8);
        double btnInWidthSize = ScreenSize().getScreenWidth(33);
        double btnOutWidthSize = ScreenSize().getScreenWidth(35);
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
            height: ScreenSize().getScreenHeight(35),
            width: ScreenSize().getScreenWidth(80),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: ScreenSize().getScreenHeight(30),
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
                          vertical: ScreenSize().getScreenHeight(5),
                          horizontal: ScreenSize().getScreenWidth(5)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: ScreenSize().getScreenHeight(3.5),
                            ),
                            Text(
                              myDataType == "eSIM"
                                  ? "Confirm New eSIM Number"
                                  : "Email Address",
                              style: FontsStyle().buyText(),
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(1),
                            ),
                            myDataType == "eSIM"
                                ? Text(
                                    myData,
                                    style: FontsStyle().buyText(),
                                  )
                                : SizedBox(
                                    height: ScreenSize().getScreenHeight(5),
                                    width: double.infinity,
                                    child: TextField(
                                      autofocus: true,
                                      keyboardType: TextInputType.emailAddress,
                                      keyboardAppearance: Brightness.light,
                                      style: FontsStyle().recipientNumText(),
                                      onChanged: (value) {
                                        Provider.of<StoreViewModel>(context,
                                                listen: false)
                                            .setEmail(value);
                                      },
                                    ),
                                  ),
                          ]),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset("assets/images/circle.png",
                      height: ScreenSize().getScreenHeight(10),
                      width: ScreenSize().getScreenHeight(10),
                      fit: BoxFit.cover),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize().getScreenWidth(3),
                        vertical: ScreenSize().getScreenHeight(1.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                            btnLabel: Text(
                              'Cancel',
                              style: FontsStyle().startbtnText(),
                            ),
                            btnInwardHightSize: btnInHeightSize,
                            btnOutwardHieghtSize: btnOutHeightSize,
                            btnInwardWidthSize: btnInWidthSize,
                            btnOutwardWidthSize: btnOutWidthSize,
                            outerColor: Colour().primary().withOpacity(0.2),
                            inerColor: Colors.white,
                            btnAction: () {
                              Navigator.pop(context);
                            }),
                        Button(
                          btnLabel: Text(
                            myDataType == "eSIM" ? 'Confirm' : 'Send',
                            style: FontsStyle().startbtnText(),
                          ),
                          btnInwardHightSize: btnInHeightSize,
                          btnOutwardHieghtSize: btnOutHeightSize,
                          btnInwardWidthSize: btnInWidthSize,
                          btnOutwardWidthSize: btnOutWidthSize,
                          outerColor: Colour().primary().withOpacity(0.2),
                          btnAction: myDataType == "eSIM"
                              ? () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        duration:
                                            const Duration(milliseconds: 600),
                                        reverseDuration:
                                            const Duration(milliseconds: 600),
                                        child:
                                            const SelectAirtimePackageScreen(),
                                        inheritTheme: true,
                                        ctx: context),
                                  );
                                }
                              : () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        duration:
                                            const Duration(milliseconds: 600),
                                        reverseDuration:
                                            const Duration(milliseconds: 600),
                                        child: const TransactionInprogress(),
                                        inheritTheme: true,
                                        ctx: context),
                                  );
                                },
                          inerColor: Colour().primary(),
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

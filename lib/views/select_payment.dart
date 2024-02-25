import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/home_screen.dart';
import 'package:one_net/views/qr_scan_screen.dart';
import 'package:one_net/widgets/footer.dart';
import 'package:one_net/widgets/payment_btn.dart';
import 'package:one_net/widgets/round_btn.dart';
import 'package:provider/provider.dart';

class SelectPaymentOption extends StatelessWidget {
  const SelectPaymentOption({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider.of<StoreViewModel>(context, listen: false).defualtRecipietNo();
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
                      height: ScreenSize().getScreenHeight(49.5),
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
                            fit: BoxFit.fitWidth),
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
                            SizedBox(
                              height: ScreenSize().getScreenHeight(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation1,
                                                  animation2) =>
                                              const HomeScreen(),
                                          transitionDuration: Duration.zero,
                                          reverseTransitionDuration:
                                              Duration.zero,
                                        ),
                                      );
                                    },
                                    child: RoundBtn(
                                      btnLabel: Image.asset(
                                        "assets/images/home_logo.png",
                                        width:
                                            ScreenSize().getScreenHeight(3.5),
                                        height:
                                            ScreenSize().getScreenHeight(3.5),
                                        fit: BoxFit.contain,
                                      ),
                                      innerColor: Colour().secondary(),
                                      outerColor: Colour().primary(),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: ScreenSize().getScreenHeight(1),
                                      ),
                                      Text(
                                        "Buy Airtime",
                                        style: FontsStyle().mainMenuText(),
                                      ),
                                      SizedBox(
                                        height: ScreenSize().getScreenHeight(1),
                                      ),
                                      Text(
                                        "Enter Your Detial Below",
                                        style: FontsStyle().buyText(),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
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
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colour().primary(),
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(2),
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(7),
                              width: double.infinity,
                              child: TextField(
                                textAlign: TextAlign.start,
                                autofocus: true,
                                textAlignVertical: TextAlignVertical.center,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                maxLength: 10,
                                onChanged: (value) {
                                  myType.setRecipietNo(value);
                                },
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: ScreenSize().getScreenHeight(2),
                                ),
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: 'Recipient Number',
                                    suffixIcon: const Icon(
                                      Icons.dialpad,
                                    ),
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        113, 211, 210, 210),
                                    suffixIconColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => states.contains(
                                                    MaterialState.focused)
                                                ? Colour().primary()
                                                : const Color.fromRGBO(
                                                    134, 134, 134, 1)),
                                    counterText: "",
                                    labelStyle: const TextStyle(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Colour().primary(),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        ScreenSize().getScreenHeight(1),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Colour().primary(),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        ScreenSize().getScreenHeight(1),
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(1),
                            ),
                            Text(
                              "Select Payment Method",
                              style: FontsStyle().rechargeText(),
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(2),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PaymentButton(
                                  btnAction:
                                      myType.transactionData["recipientNo"] ==
                                                  '' ||
                                              myType.transactionData[
                                                      "recipientNo"] ==
                                                  null
                                          ? () {}
                                          : () {
                                              myType.setPayment(
                                                  "Card", context);
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
                                  btnAction:
                                      myType.transactionData["recipientNo"] ==
                                                  '' ||
                                              myType.transactionData[
                                                      "recipientNo"] ==
                                                  null
                                          ? () {}
                                          : () {
                                              myType.setPayment(
                                                  "Mobile Money", context);
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
                                  btnAction:
                                      myType.transactionData["recipientNo"] ==
                                                  '' ||
                                              myType.transactionData[
                                                      "recipientNo"] ==
                                                  null
                                          ? () {}
                                          : () {
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  pageBuilder: (context,
                                                          animation1,
                                                          animation2) =>
                                                      const QRCodePaymentScreen(),
                                                  transitionDuration:
                                                      Duration.zero,
                                                  reverseTransitionDuration:
                                                      Duration.zero,
                                                ),
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

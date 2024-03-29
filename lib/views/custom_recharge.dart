import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/currency_selection.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/home_screen.dart';
import 'package:one_net/views/select_payment.dart';
import 'package:one_net/widgets/button.dart';
import 'package:one_net/widgets/footer.dart';
import 'package:one_net/widgets/round_btn.dart';
import 'package:provider/provider.dart';

class CustomRecharge extends StatelessWidget {
  const CustomRecharge({super.key});

  @override
  Widget build(BuildContext context) {
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
                height: ScreenSize().getScreenHeight(37),
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
                  padding: EdgeInsets.all(ScreenSize().getScreenHeight(2)),
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
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const HomeScreen(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              child: RoundBtn(
                                btnLabel: Image.asset(
                                  "assets/images/home_logo.png",
                                  width: ScreenSize().getScreenHeight(3.5),
                                  height: ScreenSize().getScreenHeight(3.5),
                                  fit: BoxFit.contain,
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
                            Container(
                              width: ScreenSize().getScreenHeight(6),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colour().primary(),
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(1),
                      ),
                      Consumer<CurrencySelectionViewModel>(
                        builder: (context, myCurrency, child) {
                          return Row(
                            children: [
                              Flexible(child: Container()),
                              Flexible(
                                child: Text(
                                  "Select  Currency",
                                  style: FontsStyle().rechargeText(),
                                ),
                              ),
                              Flexible(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Button(
                                    btnAction: () {
                                      myCurrency.changeCurrency('USD');
                                    },
                                    btnColor: myCurrency.activeCurrency == 'USD'
                                        ? Colour().primary()
                                        : const Color.fromARGB(
                                            107, 255, 122, 13),
                                    btnHeight: ScreenSize().getScreenHeight(3),
                                    btnText: Text(
                                      'USD',
                                      style: FontsStyle().curencybtnText(),
                                    ),
                                    btnWight: ScreenSize().getScreenWidth(12),
                                  ),
                                  SizedBox(
                                    width: ScreenSize().getScreenWidth(1),
                                  ),
                                  Button(
                                    btnAction: () {
                                      myCurrency.changeCurrency('ZWL');
                                    },
                                    btnColor: myCurrency.activeCurrency == 'ZWL'
                                        ? Colour().primary()
                                        : const Color.fromARGB(
                                            107, 255, 122, 13),
                                    btnHeight: ScreenSize().getScreenHeight(3),
                                    btnText: Text(
                                      'ZWL',
                                      style: FontsStyle().curencybtnText(),
                                    ),
                                    btnWight: ScreenSize().getScreenWidth(12),
                                  ),
                                ],
                              ))
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(1),
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(7),
                        width: double.infinity,
                        child: TextField(
                          textAlign: TextAlign.start,
                          autofocus: true,
                          textAlignVertical: TextAlignVertical.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          maxLength: 5,
                          onChanged: (value) {
                            Provider.of<StoreViewModel>(context, listen: false)
                                .setRechargeAmount(value);
                          },
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenSize().getScreenHeight(2),
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          onEditingComplete: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        const SelectPaymentOption(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          },
                          decoration: InputDecoration(
                              hintText: 'Recharge Amount',
                              suffixIcon: const Icon(
                                Icons.dialpad,
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(113, 211, 210, 210),
                              suffixIconColor: MaterialStateColor.resolveWith(
                                  (states) => states
                                          .contains(MaterialState.focused)
                                      ? Colour().primary()
                                      : const Color.fromRGBO(134, 134, 134, 1)),
                              counterText: "",
                              labelStyle: const TextStyle(
                                  color: Color.fromRGBO(134, 134, 134, 1)),
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
                      Consumer<StoreViewModel>(
                        builder: (context, myType, child) {
                          return Button(
                            btnAction:
                                myType.transactionData["rechargeAmount"] ==
                                            null ||
                                        myType.transactionData["rechargeAmount"]
                                            .isEmpty
                                    ? () {}
                                    : () {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation1,
                                                    animation2) =>
                                                const SelectPaymentOption(),
                                            transitionDuration: Duration.zero,
                                            reverseTransitionDuration:
                                                Duration.zero,
                                          ),
                                        );
                                      },
                            btnColor:
                                myType.transactionData["rechargeAmount"] ==
                                            null ||
                                        myType.transactionData["rechargeAmount"]
                                            .isEmpty
                                    ? const Color.fromARGB(255, 245, 195, 154)
                                    : Colour().primary(),
                            btnHeight: ScreenSize().getScreenHeight(7),
                            btnText: Text(
                              'Proceed ',
                              style: FontsStyle().startbtnText(),
                            ),
                            btnWight: double.infinity,
                          );
                        },
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/currency_format.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/currency_selection.dart';
import 'package:one_net/view_models/debug_switch_view_model.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/home_screen.dart';
import 'package:one_net/views/transaction_inprogess_screen.dart';
import 'package:one_net/widgets/footer.dart';
import 'package:one_net/widgets/round_btn.dart';
import 'package:provider/provider.dart';

import '../view_models/card_payment_view_model.dart';

class CardPayment extends StatelessWidget {
  const CardPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final myCurrency =
        Provider.of<CurrencySelectionViewModel>(context, listen: false);
    Provider.of<CardPaymentViewModel>(context, listen: false).payNow(context);
    onTapToComplete() {
      bool isDebugMode =
          Provider.of<DebugSwitchViewModel>(context, listen: false).debug;
      if (isDebugMode == true) {
        Provider.of<StoreViewModel>(context, listen: false).defaultResponse();
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                const TransactionInprogress(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      }
    }

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
                                  "Card Payment",
                                  style: FontsStyle().mainMenuText(),
                                ),
                                SizedBox(
                                  height: ScreenSize().getScreenHeight(1),
                                ),
                                Text(
                                  "Present Your Card",
                                  style: FontsStyle().buyText(),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                // navigateTime.cancel();
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
                        height: ScreenSize().getScreenHeight(1),
                      ),
                      Container(
                          height: ScreenSize().getScreenHeight(20),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/subtract.png"),
                                fit: BoxFit.contain),
                          ),
                          child: Consumer<StoreViewModel>(
                            builder: (context, amount, child) {
                              return Column(
                                children: [
                                  SizedBox(
                                      height: ScreenSize().getScreenHeight(3)),
                                  Text(
                                    "Amount To Pay",
                                    style: FontsStyle().buyText(),
                                  ),
                                  Text(
                                    myCurrency.activeCurrency +
                                        Currency().format(
                                          amount
                                              .transactionData["rechargeAmount"]
                                              .toString(),
                                        ),
                                    //  "Amount To Pay",

                                    style: FontsStyle().cardAmtText(),
                                  ),
                                  SizedBox(
                                      height: ScreenSize().getScreenHeight(0)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            ScreenSize().getScreenHeight(3.5)),
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
                      InkWell(
                        onTap: () => onTapToComplete(),
                        child: Image.asset(
                          "assets/images/pay_card.png",
                          width: ScreenSize().getScreenWidth(70),
                          height: ScreenSize().getScreenHeight(10),
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(2),
                      ),
                      Text(
                        "Tap To Pay",
                        style: FontsStyle().rechargeText(),
                      ),
                      Image.asset(
                        "assets/images/card_loading.gif",
                        width: ScreenSize().getScreenWidth(70),
                        height: ScreenSize().getScreenHeight(7),
                        color: Colour().green(),
                        fit: BoxFit.fitWidth,
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

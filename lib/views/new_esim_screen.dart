import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_net/constant.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/change_pinpad_theme_view_model.dart';
import 'package:one_net/view_models/currency_selection.dart';
import 'package:one_net/view_models/keyboard_view_model.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/widgets/confirmation_modal.dart';
import 'package:one_net/widgets/footer.dart';
import 'package:provider/provider.dart';
import '../widgets/header.dart';

// ignore: must_be_immutable
class SelectNewEsimScreen extends StatelessWidget {
  const SelectNewEsimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Provider.of<InputAmountViewModel>(context, listen: false)
        .clearCustonAmount();
    Provider.of<PinpadThemeView>(context).colourTheme(context);
    List allEsim = eSIM;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/home.png"), fit: BoxFit.cover),
          ),
          child: Consumer<CurrencySelectionViewModel>(
            builder: (context, myCurrency, child) {
              return Column(
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
                      height: ScreenSize().getScreenHeight(70),
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
                        padding:
                            EdgeInsets.all(ScreenSize().getScreenHeight(2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Consumer<StoreViewModel>(
                              builder: (context, myTxnType, child) {
                                return Header(
                                  showHome: true,
                                  showPrevious: true,
                                  titleText: myTxnType
                                      .transactionData["TransactionType"]
                                      .toString(),
                                  subtitleText: 'Select New eSim Number',
                                );
                              },
                            ),
                            Divider(
                              thickness: 1,
                              color: Colour().primary(),
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(1),
                            ),
                            Text(
                              "Choose  Number",
                              style: FontsStyle().rechargeText(),
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(1),
                            ),
                            Expanded(
                              child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                            2, // number of items in each row
                                        mainAxisSpacing: ScreenSize()
                                            .getScreenHeight(
                                                2.2), // spacing between rows
                                        crossAxisSpacing:
                                            2.0, // spacing between columns
                                        childAspectRatio: 2.1),

                                padding: const EdgeInsets.all(
                                    8.0), // padding around the grid
                                itemCount:
                                    allEsim.length, // total number of items
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Provider.of<StoreViewModel>(context,
                                              listen: false)
                                          .setRecipienttNo(allEsim[index]
                                                  ["moile_number"]
                                              .toString());
                                      confirmDataAlert(
                                          context,
                                          "eSIM",
                                          allEsim[index]["moile_number"]
                                              .toString());
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                allEsim[index]["bg_image"]),
                                            fit: BoxFit.fill),
                                      ),
                                      child: Center(
                                        child: Text(
                                            allEsim[index]["moile_number"],
                                            style: FontsStyle().priceText()),
                                      ),
                                    ),
                                  );
                                },
                              ),
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
              );
            },
          )),
    );
  }
}

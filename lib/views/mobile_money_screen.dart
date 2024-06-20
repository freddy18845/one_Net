import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/transaction_inprogess_screen.dart';
import 'package:one_net/widgets/button.dart';
import 'package:one_net/widgets/footer.dart';
import 'package:one_net/widgets/keyboard_btn.dart';
import 'package:one_net/widgets/round_btn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MobileMoneyScreen extends StatefulWidget {
  const MobileMoneyScreen({super.key});

  @override
  State<MobileMoneyScreen> createState() => _MobileMoneyScreenState();
}

class _MobileMoneyScreenState extends State<MobileMoneyScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
                height: ScreenSize().getScreenHeight(75),
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
                                Provider.of<StoreViewModel>(context,
                                        listen: false)
                                    .clearmomoNumber(context);
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: ScreenSize().getScreenHeight(1),
                                ),
                                Text(
                                  "Mobile Payment",
                                  style: FontsStyle().mainMenuText(),
                                ),
                                SizedBox(
                                  height: ScreenSize().getScreenHeight(1),
                                ),
                                Text(
                                  "Select Payment Method",
                                  style: FontsStyle().buyText(),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
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
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colour().primary(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Consumer<StoreViewModel>(
                              builder: (context, myNetwork, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: myNetwork.mobileNetworks
                                  .asMap()
                                  .entries
                                  .map((network) {
                                int index = network.key;

                                Map value = network.value;

                                return SizedBox(
                                  height: ScreenSize().getScreenHeight(12.5),
                                  width: ScreenSize().getScreenWidth(27.5),
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Provider.of<StoreViewModel>(context,
                                                  listen: false)
                                              .addSelectedNet(index, value);
                                        },
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional.center,
                                          child: Container(
                                            height: ScreenSize()
                                                .getScreenHeight(10),
                                            width:
                                                ScreenSize().getScreenWidth(26),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      value["image"]),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                ScreenSize().getScreenHeight(2),
                                              ),
                                              border: Border.all(
                                                  width: 5,
                                                  color: myNetwork.transactionData[
                                                              "selectedNetwork"] ==
                                                          value["name"]
                                                      ? Colour().primary()
                                                      : Colors.transparent),
                                            ),
                                          ),
                                        ),
                                      ),
                                      myNetwork.transactionData[
                                                  "selectedNetwork"] ==
                                              value["name"]
                                          ? Align(
                                              alignment: AlignmentDirectional
                                                  .bottomCenter,
                                              child: Container(
                                                height: ScreenSize()
                                                    .getScreenHeight(3),
                                                width: ScreenSize()
                                                    .getScreenHeight(3),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    ScreenSize()
                                                        .getScreenHeight(1.5),
                                                  ),
                                                  color: const Color.fromARGB(
                                                      255, 7, 112, 10),
                                                ),
                                                child: Icon(
                                                  Icons.check,
                                                  size: ScreenSize()
                                                      .getScreenWidth(3),
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                );
                              }).toList(),
                            );
                          }),
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(0.5),
                      ),
                      Consumer<StoreViewModel>(
                        builder: (context, myNetwork, child) {
                          return myNetwork.transactionData["selectedNetwork"] ==
                                  ""
                              ? const SizedBox.shrink()
                              : Animate(
                                  effects: const [
                                    FadeEffect(
                                        duration: Duration(milliseconds: 600)),
                                    ScaleEffect(
                                        duration: Duration(milliseconds: 600))
                                  ],
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: ScreenSize().getScreenHeight(6),
                                        width: double.infinity,
                                        child: Container(
                                          height:
                                              ScreenSize().getScreenHeight(6),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius: BorderRadius.circular(
                                              ScreenSize().getScreenHeight(1.5),
                                            ),
                                            border: Border.all(
                                              width: 2,
                                              color: Colour().primary(),
                                            ),
                                          ),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Flexible(
                                                    flex: 4,
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.maxFinite,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: ScreenSize()
                                                              .getScreenHeight(
                                                                  1.0),
                                                        ),
                                                        child: Text(
                                                          textAlign:
                                                              TextAlign.left,
                                                          myNetwork.momonumber
                                                                  .isEmpty
                                                              ? "Enter Mobile Number"
                                                              : myNetwork
                                                                  .momonumber
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontWeight: myNetwork
                                                                      .momonumber
                                                                      .isEmpty
                                                                  ? FontWeight
                                                                      .w100
                                                                  : FontWeight
                                                                      .w500,
                                                              fontSize: myNetwork
                                                                      .momonumber
                                                                      .isEmpty
                                                                  ? ScreenSize()
                                                                      .getScreenHeight(
                                                                          2.5)
                                                                  : ScreenSize()
                                                                      .getScreenHeight(
                                                                          3),
                                                              color: myNetwork
                                                                      .momonumber
                                                                      .isEmpty
                                                                  ? Colors
                                                                      .black38
                                                                  : Colors
                                                                      .black),
                                                        ),
                                                      ),
                                                    )),
                                                Flexible(
                                                  flex: 1,
                                                  child: Icon(Icons.dialpad,
                                                      color: Colour().primary(),
                                                      size: ScreenSize()
                                                          .getScreenHeight(
                                                              3.5)),
                                                ),
                                              ]),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            ScreenSize().getScreenHeight(1.5),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          KeyboardButton(
                                            btnAction: () {
                                              Provider.of<StoreViewModel>(
                                                      context,
                                                      listen: false)
                                                  .setMomoNo('1');
                                            },
                                            btnLabel: Text(
                                              '1',
                                              style:
                                                  FontsStyle().inputAmtText(),
                                            ),
                                          ),
                                          SizedBox(
                                            width: ScreenSize()
                                                .getScreenWidth(1.5),
                                          ),
                                          KeyboardButton(
                                            btnAction: () {
                                              Provider.of<StoreViewModel>(
                                                      context,
                                                      listen: false)
                                                  .setMomoNo('2');
                                            },
                                            btnLabel: Text(
                                              '2',
                                              style:
                                                  FontsStyle().inputAmtText(),
                                            ),
                                          ),
                                          SizedBox(
                                            width: ScreenSize()
                                                .getScreenWidth(1.5),
                                          ),
                                          KeyboardButton(
                                            btnAction: () {
                                              Provider.of<StoreViewModel>(
                                                      context,
                                                      listen: false)
                                                  .setMomoNo('3');
                                            },
                                            btnLabel: Text(
                                              '3',
                                              style:
                                                  FontsStyle().inputAmtText(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            ScreenSize().getScreenHeight(0.8),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          KeyboardButton(
                                            btnAction: () {
                                              Provider.of<StoreViewModel>(
                                                      context,
                                                      listen: false)
                                                  .setMomoNo('4');
                                            },
                                            btnLabel: Text(
                                              '4',
                                              style:
                                                  FontsStyle().inputAmtText(),
                                            ),
                                          ),
                                          SizedBox(
                                            width: ScreenSize()
                                                .getScreenWidth(1.5),
                                          ),
                                          KeyboardButton(
                                            btnAction: () {
                                              Provider.of<StoreViewModel>(
                                                      context,
                                                      listen: false)
                                                  .setMomoNo('5');
                                            },
                                            btnLabel: Text(
                                              '5',
                                              style:
                                                  FontsStyle().inputAmtText(),
                                            ),
                                          ),
                                          SizedBox(
                                            width: ScreenSize()
                                                .getScreenWidth(1.5),
                                          ),
                                          KeyboardButton(
                                            btnAction: () {
                                              Provider.of<StoreViewModel>(
                                                      context,
                                                      listen: false)
                                                  .setMomoNo('6');
                                            },
                                            btnLabel: Text(
                                              '6',
                                              style:
                                                  FontsStyle().inputAmtText(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            ScreenSize().getScreenHeight(0.8),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          KeyboardButton(
                                            btnAction: () {
                                              Provider.of<StoreViewModel>(
                                                      context,
                                                      listen: false)
                                                  .setMomoNo('7');
                                            },
                                            btnLabel: Text(
                                              '7',
                                              style:
                                                  FontsStyle().inputAmtText(),
                                            ),
                                          ),
                                          SizedBox(
                                            width: ScreenSize()
                                                .getScreenWidth(1.5),
                                          ),
                                          KeyboardButton(
                                            btnAction: () {
                                              Provider.of<StoreViewModel>(
                                                      context,
                                                      listen: false)
                                                  .setMomoNo('8');
                                            },
                                            btnLabel: Text(
                                              '8',
                                              style:
                                                  FontsStyle().inputAmtText(),
                                            ),
                                          ),
                                          SizedBox(
                                            width: ScreenSize()
                                                .getScreenWidth(1.5),
                                          ),
                                          KeyboardButton(
                                            btnAction: () {
                                              Provider.of<StoreViewModel>(
                                                      context,
                                                      listen: false)
                                                  .setMomoNo('9');
                                            },
                                            btnLabel: Text(
                                              '9',
                                              style:
                                                  FontsStyle().inputAmtText(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            ScreenSize().getScreenHeight(0.8),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          KeyboardButton(
                                            btnAction: () {
                                              // Provider.of<InputAmountViewModel>(context,
                                              //         listen: false)
                                              //     .
                                              //setMomoNo('1');
                                              Provider.of<StoreViewModel>(
                                                      context,
                                                      listen: false)
                                                  .setMomoNo('.');
                                            },
                                            btnLabel: Text(
                                              '.',
                                              style:
                                                  FontsStyle().inputAmtText(),
                                            ),
                                          ),
                                          SizedBox(
                                            width: ScreenSize()
                                                .getScreenWidth(1.5),
                                          ),
                                          KeyboardButton(
                                            btnAction: () {
                                              Provider.of<StoreViewModel>(
                                                      context,
                                                      listen: false)
                                                  .setMomoNo('0');
                                            },
                                            btnLabel: Text(
                                              '0',
                                              style:
                                                  FontsStyle().inputAmtText(),
                                            ),
                                          ),
                                          SizedBox(
                                            width: ScreenSize()
                                                .getScreenWidth(1.5),
                                          ),
                                          KeyboardButton(
                                            btnAction: () {
                                              Provider.of<StoreViewModel>(
                                                      context,
                                                      listen: false)
                                                  .setMomoNo('back');
                                            },
                                            btnLabel: Image.asset(
                                              "assets/images/clear.png",
                                              width: ScreenSize()
                                                  .getScreenWidth(10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                        },
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(1),
                      ),
                      Consumer<StoreViewModel>(
                        builder: (context, myType, child) {
                          return myType.transactionData["selectedNetwork"] == ""
                              ? const SizedBox.shrink()
                              : Button(
                                  // ignore: unrelated_type_equality_checks
                                  btnAction: myType.momonumber.length != 9
                                      ? () {}
                                      : () {
                                          Provider.of<StoreViewModel>(context,
                                                  listen: false)
                                              .setBuyerNo(myType.momonumber);
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType.fade,
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                reverseDuration: const Duration(
                                                    milliseconds: 200),
                                                child:
                                                    const TransactionInprogress(),
                                                inheritTheme: true,
                                                ctx: context),
                                          );
                                        },
                                  // ignore: unrelated_type_equality_checks
                                  inerColor: myType.momonumber.length != 10
                                      ? const Color.fromARGB(255, 245, 195, 154)
                                      : Colour().primary(),
                                  btnInwardHightSize:
                                      ScreenSize().getScreenHeight(6),
                                  btnOutwardHieghtSize:
                                      ScreenSize().getScreenHeight(7.5),
                                  btnInwardWidthSize:
                                      ScreenSize().getScreenWidth(83),
                                  btnOutwardWidthSize:
                                      ScreenSize().getScreenWidth(87),
                                  outerColor:
                                      Colour().primary().withOpacity(0.2),
                                  btnLabel: Text(
                                    'Pay',
                                    style: FontsStyle().startbtnText(),
                                  ),
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

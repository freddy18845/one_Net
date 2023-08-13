import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/home_screen.dart';
import 'package:one_net/views/select_payment.dart';
import 'package:one_net/views/transaction_inprogess_screen.dart';
import 'package:one_net/widgets/button.dart';
import 'package:one_net/widgets/footer.dart';
import 'package:one_net/widgets/round_btn.dart';
import 'package:provider/provider.dart';

class MobileMoneyScreen extends StatelessWidget {
  const MobileMoneyScreen({super.key});

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
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenSize().getScreenHeight(2),
              ),
              child: Container(
                height: ScreenSize().getScreenHeight(48),
                width: double.infinity,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("assets/images/card.png"),
                      fit: BoxFit.fitWidth),
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
                                  "Mobile Payments",
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
                      Row(
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
                                  height: ScreenSize().getScreenHeight(14.5),
                                  width: ScreenSize().getScreenWidth(27.5),
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Provider.of<StoreViewModel>(context,
                                                  listen: false)
                                              .addSelectedNet(index, value);
                                          //                                        setState(() {
                                          //   isPressed = true;
                                          // });
                                        },
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional.center,
                                          child: Container(
                                            height: ScreenSize()
                                                .getScreenHeight(12.5),
                                            width:
                                                ScreenSize().getScreenWidth(27),
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
                                                  width: 2,
                                                  color: myNetwork.transactionData[
                                                              "selectedNetwork"] ==
                                                          value["name"]
                                                      ? Colour().primary()
                                                      : Colors.transparent),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // myNetwork.transactionData[
                                      //             "selectedNetwork"] ==
                                      //         value["name"]
                                      //     ? Align(
                                      //         alignment:
                                      //             AlignmentDirectional
                                      //                 .center,
                                      //         child: Padding(
                                      //           padding: EdgeInsets.only(
                                      //               bottom: ScreenSize()
                                      //                   .getScreenHeight(
                                      //                       0)),
                                      //           child: Container(
                                      //             height: ScreenSize()
                                      //                 .getScreenHeight(
                                      //                     10.3),
                                      //             width: ScreenSize()
                                      //                 .getScreenHeight(
                                      //                     10.5),
                                      //             decoration: BoxDecoration(
                                      //               color:
                                      //                   Colors.transparent,
                                      //               border: Border.all(
                                      //                   width: 3,
                                      //                   color: Colour()
                                      //                       .primary()),
                                      //               borderRadius:
                                      //                   BorderRadius
                                      //                       .circular(
                                      //                 ScreenSize()
                                      //                     .getScreenHeight(
                                      //                         1.8),
                                      //               ),
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       )
                                      //     : const SizedBox.shrink(),
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
                        height: ScreenSize().getScreenHeight(1),
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(7),
                        width: double.infinity,
                        child: TextField(
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          maxLength: 10,
                          onChanged: (value) {
                            Provider.of<StoreViewModel>(context, listen: false)
                                .momoNum(value);
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
                              hintText: 'Mobile Money Number',
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
                        height: ScreenSize().getScreenHeight(2),
                      ),
                      Consumer<StoreViewModel>(
                        builder: (context, myType, child) {
                          return Button(
                            btnAction: myType.transactionData["momoNumber"] ==
                                    ''
                                ? () {}
                                : () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                const TransactionInprogress(),
                                        transitionDuration: Duration.zero,
                                        reverseTransitionDuration:
                                            Duration.zero,
                                      ),
                                    );
                                  },
                            btnColor:
                                //  myType.transactionData["momoNo"]
                                //             .isEmpty ||
                                //         myType.transactionData["momoNo"] ==
                                //             null

                                //     ? const Color.fromARGB(255, 245, 195, 154)
                                //     :
                                Colour().primary(),
                            btnHeight: ScreenSize().getScreenHeight(7),
                            btnText: Text(
                              'Buy ',
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

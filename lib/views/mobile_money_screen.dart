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
import 'package:one_net/widgets/header.dart';
import 'package:one_net/widgets/round_btn.dart';
import 'package:provider/provider.dart';

class MobileMoneyScreen extends StatelessWidget {
  const MobileMoneyScreen({super.key});

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
                height: ScreenSize().getScreenHeight(49),
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
                      const Header(
                        showHome: true,
                        showPrevious: true,
                        titleText: "Mobile Payment",
                        subtitleText: 'Select Payment Method',
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
                                  height: ScreenSize().getScreenHeight(15.5),
                                  width: ScreenSize().getScreenWidth(28.5),
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
                                                .getScreenHeight(13),
                                            width:
                                                ScreenSize().getScreenWidth(24),
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
                        height: ScreenSize().getScreenHeight(1),
                      ),
                      Consumer<StoreViewModel>(
                        builder: (context, myNetwork, child) {
                          return myNetwork.transactionData["selectedNetwork"] ==
                                  ""
                              ? const SizedBox.shrink()
                              : SizedBox(
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
                                      Provider.of<StoreViewModel>(context,
                                              listen: false)
                                          .setBuyerNo(value);
                                    },
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenSize().getScreenHeight(2),
                                    ),
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.number,
                                    onEditingComplete: () {
                                      // Provider.of<LoginViewModal>(context, listen: false)
                                      // .loginNow();
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Buyer Number',
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
                                        labelStyle: const TextStyle(
                                            color: Color.fromRGBO(
                                                134, 134, 134, 1)),
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
                                  btnAction: myType
                                                  .transactionData["buyerNo"] ==
                                              null ||
                                          myType.transactionData["buyerNo"]
                                              .isEmpty
                                      ? () {}
                                      : () {
                                          Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (context, animation1,
                                                      animation2) =>
                                                  const TransactionInprogress(),
                                              transitionDuration: Duration.zero,
                                              reverseTransitionDuration:
                                                  Duration.zero,
                                            ),
                                          );
                                        },
                                  inerColor: myType
                                                  .transactionData["buyerNo"] ==
                                              null ||
                                          myType.transactionData["buyerNo"]
                                              .isEmpty
                                      ? const Color.fromARGB(255, 245, 195, 154)
                                      : Colour().primary(),
                                  btnInwardHightSize:
                                      ScreenSize().getScreenHeight(7),
                                  btnOutwardHieghtSize:
                                      ScreenSize().getScreenHeight(8.5),
                                  btnInwardWidthSize:
                                      ScreenSize().getScreenWidth(78),
                                  btnOutwardWidthSize:
                                      ScreenSize().getScreenWidth(81),
                                  outerColor:
                                      Colour().primary().withOpacity(0.5),
                                  btnLabel: Text(
                                    'Buy ',
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

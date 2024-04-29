import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/currency_selection.dart';
import 'package:one_net/view_models/keyboard_view_model.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/input_recipientNo.dart';
import 'package:one_net/views/select_payment.dart';
import 'package:one_net/widgets/button.dart';
import 'package:one_net/widgets/footer.dart';
import 'package:one_net/widgets/header.dart';
import 'package:one_net/widgets/keyboard_btn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CustomRechargeScreen extends StatefulWidget {
  const CustomRechargeScreen({super.key});

  @override
  State<CustomRechargeScreen> createState() => _CustomRechargeState();
}

class _CustomRechargeState extends State<CustomRechargeScreen> {
  TextEditingController amountCtr = TextEditingController();

  // Initial Selected Value
  String dropdownvalue = 'USD';

  // List of items in our dropdown menu
  var items = [
    'USD',
    'ZiG',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Provider.of<CardPaymentViewModel>(context, listen: false).payNow(context);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String transactionType =
        Provider.of<StoreViewModel>(context).getTxnType();
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
                      Header(
                        showHome: true,
                        showPrevious: true,
                        titleText: transactionType.toString(),
                        subtitleText: 'Enter Your Detial Below',
                      ),
                      Divider(
                        thickness: 1,
                        color: Colour().primary(),
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(1),
                      ),
                      Container(
                        height: ScreenSize().getScreenHeight(7),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                flex: 1,
                                child: DropdownButton(
                                  underline: const SizedBox(),
                                  itemHeight: ScreenSize().getScreenHeight(6),
                                  // Initial Value
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          ScreenSize().getScreenHeight(2.5)),
                                  elevation: 8,
                                  value: dropdownvalue.toString(),

                                  // Down Arrow Icon
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black,
                                    size: ScreenSize().getScreenHeight(3),
                                  ),

                                  // Array list of items
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800,
                                              fontSize: ScreenSize()
                                                  .getScreenHeight(2.5))),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                    Provider.of<CurrencySelectionViewModel>(
                                            context,
                                            listen: false)
                                        .changeCurrency(dropdownvalue);

                                    print(dropdownvalue);
                                  },
                                ),
                              ),
                              Flexible(
                                  flex: 3,
                                  child: Consumer<InputAmountViewModel>(
                                    builder: (context, myAmount, child) {
                                      return SizedBox(
                                        height: double.infinity,
                                        width: double.maxFinite,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: ScreenSize()
                                                .getScreenHeight(1.3),
                                          ),
                                          child: Text(
                                            textAlign: TextAlign.left,
                                            myAmount.amount.isEmpty
                                                ? "Enter Amount"
                                                : myAmount.amount.toString(),
                                            style: TextStyle(
                                                fontWeight:
                                                    myAmount.amount.isEmpty
                                                        ? FontWeight.w100
                                                        : FontWeight.w500,
                                                fontSize: myAmount
                                                        .amount.isEmpty
                                                    ? ScreenSize()
                                                        .getScreenHeight(2.5)
                                                    : ScreenSize()
                                                        .getScreenHeight(3),
                                                color: myAmount.amount.isEmpty
                                                    ? Colors.black38
                                                    : Colors.black),
                                          ),
                                        ),
                                      );
                                    },
                                  )),
                              Flexible(
                                flex: 1,
                                child: Icon(Icons.dialpad,
                                    color: Colour().primary(),
                                    size: ScreenSize().getScreenHeight(3.5)),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(3),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KeyboardButton(
                            btnAction: () {
                              // Provider.of<InputAmountViewModel>(context,
                              //         listen: false)
                              //     .setCustonAmount('1');
                              Provider.of<InputAmountViewModel>(context,
                                      listen: false)
                                  .setCustonAmount('1');
                            },
                            btnLabel: Text(
                              '1',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize().getScreenWidth(1.5),
                          ),
                          KeyboardButton(
                            btnAction: () {
                              Provider.of<InputAmountViewModel>(context,
                                      listen: false)
                                  .setCustonAmount('2');
                            },
                            btnLabel: Text(
                              '2',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize().getScreenWidth(1.5),
                          ),
                          KeyboardButton(
                            btnAction: () {
                              Provider.of<InputAmountViewModel>(context,
                                      listen: false)
                                  .setCustonAmount('3');
                            },
                            btnLabel: Text(
                              '3',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(1.2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KeyboardButton(
                            btnAction: () {
                              Provider.of<InputAmountViewModel>(context,
                                      listen: false)
                                  .setCustonAmount('4');
                            },
                            btnLabel: Text(
                              '4',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize().getScreenWidth(1.5),
                          ),
                          KeyboardButton(
                            btnAction: () {
                              Provider.of<InputAmountViewModel>(context,
                                      listen: false)
                                  .setCustonAmount('5');
                            },
                            btnLabel: Text(
                              '5',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize().getScreenWidth(1.5),
                          ),
                          KeyboardButton(
                            btnAction: () {
                              Provider.of<InputAmountViewModel>(context,
                                      listen: false)
                                  .setCustonAmount('6');
                            },
                            btnLabel: Text(
                              '6',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(1.2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KeyboardButton(
                            btnAction: () {
                              Provider.of<InputAmountViewModel>(context,
                                      listen: false)
                                  .setCustonAmount('7');
                            },
                            btnLabel: Text(
                              '7',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize().getScreenWidth(1.5),
                          ),
                          KeyboardButton(
                            btnAction: () {
                              Provider.of<InputAmountViewModel>(context,
                                      listen: false)
                                  .setCustonAmount('8');
                            },
                            btnLabel: Text(
                              '8',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize().getScreenWidth(1.5),
                          ),
                          KeyboardButton(
                            btnAction: () {
                              Provider.of<InputAmountViewModel>(context,
                                      listen: false)
                                  .setCustonAmount('9');
                            },
                            btnLabel: Text(
                              '9',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(1.2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KeyboardButton(
                            btnAction: () {
                              // Provider.of<InputAmountViewModel>(context,
                              //         listen: false)
                              //     .setCustonAmount('1');
                              Provider.of<InputAmountViewModel>(context,
                                      listen: false)
                                  .setCustonAmount('.');
                            },
                            btnLabel: Text(
                              '.',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize().getScreenWidth(1.5),
                          ),
                          KeyboardButton(
                            btnAction: () {
                              Provider.of<InputAmountViewModel>(context,
                                      listen: false)
                                  .setCustonAmount('0');
                            },
                            btnLabel: Text(
                              '0',
                              style: FontsStyle().inputAmtText(),
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize().getScreenWidth(1.5),
                          ),
                          KeyboardButton(
                            btnAction: () {
                              Provider.of<InputAmountViewModel>(context,
                                      listen: false)
                                  .setCustonAmount('back');
                            },
                            btnLabel: Image.asset(
                              "assets/images/clear.png",
                              width: ScreenSize().getScreenWidth(10),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(7),
                      ),
                      Consumer<InputAmountViewModel>(
                        builder: (context, myType, child) {
                          return Button(
                            btnAction: myType.amount == null ||
                                    myType.amount.isEmpty
                                ? () {}
                                : () {
                                    Provider.of<StoreViewModel>(context,
                                            listen: false)
                                        .setRechargeAmount(
                                            myType.amount.toString());
                                    if (transactionType == "Get eSIM") {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            duration: const Duration(
                                                milliseconds: 200),
                                            reverseDuration: const Duration(
                                                milliseconds: 200),
                                            child: const SelectPaymentOption(),
                                            inheritTheme: true,
                                            ctx: context),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            duration: const Duration(
                                                milliseconds: 200),
                                            reverseDuration: const Duration(
                                                milliseconds: 200),
                                            child:
                                                const InputRecipientNumScreen(),
                                            inheritTheme: true,
                                            ctx: context),
                                      );
                                    }
                                  },
                            inerColor:
                                myType.amount == null || myType.amount.isEmpty
                                    ? const Color.fromARGB(255, 245, 195, 154)
                                    : Colour().primary(),
                            btnLabel: Text(
                              'Proceed ',
                              style:
                                  myType.amount == null || myType.amount.isEmpty
                                      ? FontsStyle().startbtnTextdisable()
                                      : FontsStyle().startbtnText(),
                            ),
                            btnInwardHightSize: ScreenSize().getScreenHeight(7),
                            btnOutwardHieghtSize:
                                ScreenSize().getScreenHeight(8.5),
                            btnInwardWidthSize: ScreenSize().getScreenWidth(83),
                            btnOutwardWidthSize:
                                ScreenSize().getScreenWidth(87),
                            outerColor: Colour().primary().withOpacity(0.2),
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

import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/keyboard_view_model.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/select_payment.dart';
import 'package:one_net/widgets/button.dart';
import 'package:one_net/widgets/footer.dart';
import 'package:one_net/widgets/header.dart';
import 'package:one_net/widgets/keyboard_btn.dart';
import 'package:provider/provider.dart';

class InputRecipientNumScreen extends StatefulWidget {
  const InputRecipientNumScreen({super.key});

  @override
  State<InputRecipientNumScreen> createState() =>
      _InputRecipientNumScreenState();
}

class _InputRecipientNumScreenState extends State<InputRecipientNumScreen> {
  TextEditingController amountCtr = TextEditingController();

  // Initial Selected Value
  String dropdownvalue = 'assets/images/payments/TeleCash.png';

  // List of items in our dropdown menu

  var mobileNetworks = [
    'assets/images/payments/TeleCash.png',
    'assets/images/payments/OneMoney.png',
    'assets/images/payments/EcoCash.png'
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
    // final String transactionType =
    //     Provider.of<StoreViewModel>(context).getTxnType();
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
                  padding: EdgeInsets.all(ScreenSize().getScreenHeight(2)),
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
                            subtitleText: 'Enter Your Detial Below',
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
                      SizedBox(
                          height: ScreenSize().getScreenHeight(7),
                          width: double.infinity,
                          child: Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: DropdownButton(
                                      underline: const SizedBox(),
                                      itemHeight:
                                          ScreenSize().getScreenHeight(6),
                                      // Initial Value
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                      elevation: 8,
                                      value: dropdownvalue.toString(),

                                      // Down Arrow Icon
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: mobileNetworks
                                          .map((String selectedNetworks) {
                                        return DropdownMenuItem(
                                          value: selectedNetworks,
                                          child: Container(
                                            height: ScreenSize()
                                                .getScreenHeight(4.3),
                                            width: ScreenSize()
                                                .getScreenHeight(4.3),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      selectedNetworks)),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                ScreenSize()
                                                    .getScreenHeight(5.5),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalue = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                  Flexible(
                                      flex: 3,
                                      child: Consumer<InputAmountViewModel>(
                                        builder:
                                            (context, recipientNum, child) {
                                          return SizedBox(
                                            height: double.infinity,
                                            width: double.maxFinite,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: ScreenSize()
                                                      .getScreenHeight(1.8)),
                                              child: Text(
                                                textAlign: TextAlign.left,
                                                recipientNum.number.isEmpty
                                                    ? "Enter Recipient Number"
                                                    : recipientNum.number
                                                        .toString(),
                                                style: TextStyle(
                                                  fontWeight: recipientNum
                                                          .number.isEmpty
                                                      ? FontWeight.w100
                                                      : FontWeight.bold,
                                                  fontSize: ScreenSize()
                                                      .getScreenHeight(2),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      )),
                                  Flexible(
                                    flex: 1,
                                    child: Icon(
                                      Icons.dialpad,
                                      color: Colour().primary(),
                                    ),
                                  ),
                                ]),
                          )),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(3),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KeyboardButton(
                            btnAction: () {
                              Provider.of<InputAmountViewModel>(context,
                                      listen: false)
                                  .setRecipientNo('1');
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
                                  .setRecipientNo('2');
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
                                  .setRecipientNo('3');
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
                                  .setRecipientNo('4');
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
                                  .setRecipientNo('5');
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
                                  .setRecipientNo('6');
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
                                  .setRecipientNo('7');
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
                                  .setRecipientNo('8');
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
                                  .setRecipientNo('9');
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
                              //     .
                              //setRecipientNo('1');
                              Provider.of<InputAmountViewModel>(context,
                                      listen: false)
                                  .setRecipientNo('.');
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
                                  .setRecipientNo('0');
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
                                  .setRecipientNo('back');
                            },
                            btnLabel: Image.asset(
                              "assets/images/clear.png",
                              width: ScreenSize().getScreenWidth(10),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(2.5),
                      ),
                      Consumer<InputAmountViewModel>(
                        builder: (context, myType, child) {
                          return Button(
                            btnAction: myType.number.length != 9 ||
                                    myType.number.isEmpty
                                ? () {}
                                : () {
                                    Provider.of<StoreViewModel>(context,
                                            listen: false)
                                        .setRecipietNo(
                                            myType.number.toString());
                                    print(myType.number);
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                const SelectPaymentOption(),
                                        transitionDuration: Duration.zero,
                                        reverseTransitionDuration:
                                            Duration.zero,
                                      ),
                                    );
                                  },
                            inerColor: myType.number.length != 9 ||
                                    myType.number.isEmpty
                                ? const Color.fromARGB(255, 245, 195, 154)
                                : Colour().primary(),
                            btnLabel: Text(
                              'Proceed ',
                              style: FontsStyle().startbtnText(),
                            ),
                            btnInwardHightSize: ScreenSize().getScreenHeight(7),
                            btnOutwardHieghtSize:
                                ScreenSize().getScreenHeight(8.5),
                            btnInwardWidthSize: ScreenSize().getScreenWidth(78),
                            btnOutwardWidthSize:
                                ScreenSize().getScreenWidth(81),
                            outerColor: Colour().primary().withOpacity(0.5),
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

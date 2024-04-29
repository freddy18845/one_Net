import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:one_net/services/printing_service.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/currency_format.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/currency_selection.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/splash_screen.dart';
import 'package:one_net/widgets/button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    final myCurrency =
        Provider.of<CurrencySelectionViewModel>(context, listen: false);
    Provider.of<PrintingService>(context, listen: false).printReceipt(context);
    double btnInHeightSize = ScreenSize().getScreenHeight(5);
    double btnOutHeightSize = ScreenSize().getScreenHeight(6);
    double btnInWidthSize = ScreenSize().getScreenWidth(30);
    double btnOutWidthSize = ScreenSize().getScreenWidth(32);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash_screen.png"),
              fit: BoxFit.fill),
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSize().getScreenHeight(3)),
            child: Consumer<StoreViewModel>(
              builder: (context, invoice, child) {
                return Column(
                  children: [
                    SizedBox(
                      height: ScreenSize().getScreenHeight(4),
                    ),
                    Text(
                      "Transaction Receipt",
                      style: FontsStyle().txnInprogress(),
                    ),
                    SizedBox(
                      height: ScreenSize().getScreenHeight(2),
                    ),
                    Container(
                      height: invoice.transactionData["TransactionType"] !=
                              "Get eSIM"
                          ? ScreenSize().getScreenHeight(72)
                          : ScreenSize().getScreenHeight(77),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/reciept.png"),
                            fit: BoxFit.fill),
                      ),
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenSize().getScreenHeight(3.5),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: ScreenSize().getScreenHeight(3),
                              ),
                              Image.asset(
                                "assets/images/invoice.png",
                                width: ScreenSize().getScreenWidth(70),
                                height: ScreenSize().getScreenHeight(5),
                                fit: BoxFit.contain,
                              ),
                              SizedBox(
                                height: ScreenSize().getScreenHeight(2),
                              ),
                              Text(
                                "Transaction Receipt",
                                style: FontsStyle().invoicetxn(),
                              ),
                              SizedBox(
                                height: ScreenSize().getScreenHeight(1),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        ScreenSize().getScreenHeight(1)),
                                child: Image.asset(
                                  "assets/images/dash.png",
                                  width: double.infinity,
                                ),
                              ),
                              SizedBox(
                                height: ScreenSize().getScreenHeight(0.5),
                              ),
                              Text(
                                "Amount Paid",
                                style: FontsStyle().cardreadDone(),
                              ),
                              Text(
                                myCurrency.activeCurrency +
                                    Currency().format(
                                      invoice.transactionData["totalPrice"]
                                          .toString(),
                                    ),
                                //  "Amount To Pay",

                                style: FontsStyle().invoiceAmtText(),
                              ),
                              SizedBox(
                                height: ScreenSize().getScreenHeight(0.5),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        ScreenSize().getScreenHeight(1)),
                                child: Image.asset(
                                  "assets/images/dash.png",
                                  width: double.infinity,
                                ),
                              ),
                              SizedBox(
                                height: invoice.transactionData[
                                            "TransactionType"] !=
                                        "Get eSIM"
                                    ? ScreenSize().getScreenHeight(1.5)
                                    : ScreenSize().getScreenHeight(1),
                              ),
                              invoice.transactionData["TransactionType"] ==
                                      "Get eSIM"
                                  ? Text(
                                      "eSIM DETAILS ",
                                      style: FontsStyle().invoiceEsimtxn(),
                                    )
                                  : const SizedBox.shrink(),
                              invoice.transactionData["TransactionType"] ==
                                      "Get eSIM"
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: ScreenSize()
                                              .getScreenHeight(0.5)),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height:
                                            ScreenSize().getScreenHeight(10.5),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              flex: 2,
                                              child: Image.asset(
                                                "assets/images/scan_qr.png",
                                                width: double.infinity,
                                              ),
                                            ),
                                            Flexible(
                                              flex: 4,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: ScreenSize()
                                                        .getScreenWidth(1.5)),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "MSISDN",
                                                          style: FontsStyle()
                                                              .invoiceEsimtext(),
                                                        ),
                                                        Text(
                                                          '233200068758',
                                                          style: FontsStyle()
                                                              .invoiceEsimtext(),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: ScreenSize()
                                                          .getScreenHeight(0.3),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "ICCID",
                                                          style: FontsStyle()
                                                              .invoiceEsimtext(),
                                                        ),
                                                        Text(
                                                          '8923302050020013008',
                                                          style: FontsStyle()
                                                              .invoiceEsimtext(),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: ScreenSize()
                                                          .getScreenHeight(0.3),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "PIN 1",
                                                          style: FontsStyle()
                                                              .invoiceEsimtext(),
                                                        ),
                                                        Text(
                                                          '1234',
                                                          style: FontsStyle()
                                                              .invoiceEsimtext(),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: ScreenSize()
                                                          .getScreenHeight(0.3),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "PIN 2",
                                                          style: FontsStyle()
                                                              .invoiceEsimtext(),
                                                        ),
                                                        Text(
                                                          '4734',
                                                          style: FontsStyle()
                                                              .invoiceEsimtext(),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: ScreenSize()
                                                          .getScreenHeight(0.3),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "PUK 1",
                                                          style: FontsStyle()
                                                              .invoiceEsimtext(),
                                                        ),
                                                        Text(
                                                          '87994856',
                                                          style: FontsStyle()
                                                              .invoiceEsimtext(),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: ScreenSize()
                                                          .getScreenHeight(0.3),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "PUK 2",
                                                          style: FontsStyle()
                                                              .invoiceEsimtext(),
                                                        ),
                                                        Text(
                                                          '55504503',
                                                          style: FontsStyle()
                                                              .invoiceEsimtext(),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              invoice.transactionData["TransactionType"] ==
                                      "Get eSIM"
                                  ? const Divider(
                                      color: Colors.black87,
                                      thickness: 1.5,
                                    )
                                  : const SizedBox.shrink(),
                              Text(
                                "TRANSACTION DETAILS",
                                style: FontsStyle().invoicetxn(),
                              ),
                              invoice.transactionData["TransactionType"] !=
                                      "Get eSIM"
                                  ? const Divider(
                                      color: Colors.black87,
                                      thickness: 1.5,
                                    )
                                  : const SizedBox.shrink(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Transaction Type",
                                    style: FontsStyle().invoicetext(),
                                  ),
                                  Text(
                                    invoice.transactionData[
                                                "TransactionType"] ==
                                            "Get eSIM"
                                        ? "eSIM Purchase"
                                        : invoice
                                            .transactionData["TransactionType"],
                                    style: FontsStyle().invoicetext1(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: invoice.transactionData[
                                            "TransactionType"] !=
                                        "Get eSIM"
                                    ? ScreenSize().getScreenHeight(1.5)
                                    : ScreenSize().getScreenHeight(0.5),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Date",
                                    style: FontsStyle().invoicetext(),
                                  ),
                                  Text(
                                    DateFormat("dd MMMM yyyy HH:mm:ss")
                                        .format(DateTime.now()),
                                    style: FontsStyle().invoicetext1(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: invoice.transactionData[
                                            "TransactionType"] !=
                                        "Get eSIM"
                                    ? ScreenSize().getScreenHeight(1.5)
                                    : ScreenSize().getScreenHeight(0.5),
                              ),
                              invoice.transactionData["paymentMethod"] == "Card"
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Card Number",
                                          style: FontsStyle().invoicetext(),
                                        ),
                                        Text(
                                          "${invoice.transactionData["cardNumber"].substring(0, 4)} **** **** ${invoice.transactionData["cardNumber"].substring(invoice.transactionData["cardNumber"].length - 4)}",
                                          style: FontsStyle().invoicetext1(),
                                        ),
                                      ],
                                    )
                                  : SizedBox.fromSize(),
                              invoice.transactionData["paymentMethod"] ==
                                      "Mobile Money"
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Buyer Number",
                                          style: FontsStyle().invoicetext(),
                                        ),
                                        Text(
                                          invoice.transactionData["buyerNo"]
                                              .toString(),
                                          style: FontsStyle().invoicetext1(),
                                        ),
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: invoice.transactionData[
                                            "TransactionType"] !=
                                        "Get eSIM"
                                    ? ScreenSize().getScreenHeight(1.5)
                                    : ScreenSize().getScreenHeight(0.5),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Receipt Number ",
                                    style: FontsStyle().invoicetext(),
                                  ),
                                  Text(
                                    invoice.transactionData["receiptNum"]
                                        .toString(),
                                    style: FontsStyle().invoicetext1(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: invoice.transactionData[
                                            "TransactionType"] !=
                                        "Get eSIM"
                                    ? ScreenSize().getScreenHeight(1.5)
                                    : ScreenSize().getScreenHeight(0.5),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Recipient's No. ",
                                    style: FontsStyle().invoicetext(),
                                  ),
                                  Text(
                                    invoice.transactionData["recipientNo"]
                                        .toString(),
                                    style: FontsStyle().invoicetext1(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: invoice.transactionData[
                                            "TransactionType"] !=
                                        "Get eSIM"
                                    ? ScreenSize().getScreenHeight(1.5)
                                    : ScreenSize().getScreenHeight(0.5),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        ScreenSize().getScreenHeight(1)),
                                child: Image.asset(
                                  "assets/images/dash.png",
                                  width: double.infinity,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenSize().getScreenHeight(0.8)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Thank You!",
                                      style: FontsStyle().receiptTitle(),
                                    ),
                                    SizedBox(
                                      height: ScreenSize().getScreenHeight(1.5),
                                    ),
                                    Center(
                                      child: BarcodeWidget(
                                        drawText: false,
                                        barcode: Barcode
                                            .codabar(), // Barcode type and settings
                                        data:
                                            '${invoice.transactionData["receiptNum"]}', // Content

                                        width: double.infinity,
                                        height: ScreenSize().getScreenHeight(5),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: ScreenSize().getScreenHeight(2.5),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Button(
                                      btnLabel: Text(
                                        'Email',
                                        style: FontsStyle().startbtnText(),
                                      ),
                                      btnInwardHightSize: btnInHeightSize,
                                      btnOutwardHieghtSize: btnOutHeightSize,
                                      btnInwardWidthSize: btnInWidthSize,
                                      btnOutwardWidthSize: btnOutWidthSize,
                                      outerColor:
                                          Colour().primary().withOpacity(0.2),
                                      inerColor: Colour().primary(),
                                      btnAction: () {}),
                                  Button(
                                    btnLabel: Text(
                                      'SMS',
                                      style: FontsStyle().startbtnText(),
                                    ),
                                    btnInwardHightSize: btnInHeightSize,
                                    btnOutwardHieghtSize: btnOutHeightSize,
                                    btnInwardWidthSize: btnInWidthSize,
                                    btnOutwardWidthSize: btnOutWidthSize,
                                    outerColor:
                                        Colour().primary().withOpacity(0.2),
                                    btnAction: () {},
                                    inerColor: Colour().primary(),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: ScreenSize().getScreenHeight(2),
                    ),
                    Button(
                      btnAction: () {
                        Provider.of<StoreViewModel>(context, listen: false)
                            .setallfield();
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 200),
                              reverseDuration:
                                  const Duration(milliseconds: 200),
                              child: const SplashScreen(),
                              inheritTheme: true,
                              ctx: context),
                        );
                        // Navigator.push(
                        //   context,
                        //   PageRouteBuilder(
                        //     pageBuilder: (context, animation1, animation2) =>
                        //         const SplashScreen(),
                        //     transitionDuration: Duration.zero,
                        //     reverseTransitionDuration: Duration.zero,
                        //   ),
                        // );
                      },
                      btnInwardHightSize: ScreenSize().getScreenHeight(7),
                      btnOutwardHieghtSize: ScreenSize().getScreenHeight(8),
                      btnInwardWidthSize: ScreenSize().getScreenWidth(84.5),
                      btnOutwardWidthSize: ScreenSize().getScreenWidth(87),
                      outerColor: Colour().primary().withOpacity(0.2),
                      inerColor: Colour().primary(),
                      btnLabel: Text(
                        'Done',
                        style: FontsStyle().startbtnText(),
                      ),
                    ),
                    SizedBox(
                      height: ScreenSize().getScreenHeight(2),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}

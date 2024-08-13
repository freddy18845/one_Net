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
import 'package:one_net/views/esim_reciept_screen.dart';
import 'package:one_net/views/splash_screen.dart';
import 'package:one_net/widgets/button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../widgets/email_modal.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    final myCurrency =
        Provider.of<CurrencySelectionViewModel>(context, listen: true);
    bool invoicetype = Provider.of<StoreViewModel>(context).esimInvoice;
    double btnInHeightSize = ScreenSize().getScreenHeight(4);
    double btnOutHeightSize = ScreenSize().getScreenHeight(5);
    double btnInWidthSize = ScreenSize().getScreenWidth(23);
    double btnOutWidthSize = ScreenSize().getScreenWidth(25);
    var printService = Provider.of<PrintingService>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      height: invoicetype == true
                          ? ScreenSize().getScreenHeight(73)
                          : ScreenSize().getScreenHeight(78),
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
                                style: invoicetype == true
                                    ? FontsStyle().invoiceAmt()
                                    : FontsStyle().invoiceAmtText(),
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
                                height: ScreenSize().getScreenHeight(1),
                              ),
                              invoicetype == true
                                  ? SizedBox.fromSize()
                                  : const EsimRecieptScreen(),
                              Text(
                                "TRANSACTION DETAILS",
                                style: FontsStyle().invoicetxn(),
                              ),
                              const Divider(
                                color: Colors.black87,
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Transaction Type",
                                    style: invoicetype == true
                                        ? FontsStyle().invoicetxt()
                                        : FontsStyle().invoicetext(),
                                  ),
                                  Text(
                                    invoice.transactionData["TransactionType"],
                                    style: invoicetype == true
                                        ? FontsStyle().invoicetxt1()
                                        : FontsStyle().invoicetext1(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ScreenSize().getScreenHeight(1),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Date",
                                    style: invoicetype == true
                                        ? FontsStyle().invoicetxt()
                                        : FontsStyle().invoicetext(),
                                  ),
                                  Text(
                                    DateFormat("dd MMMM yyyy HH:mm:ss")
                                        .format(DateTime.now()),
                                    style: invoicetype == true
                                        ? FontsStyle().invoicetxt1()
                                        : FontsStyle().invoicetext1(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ScreenSize().getScreenHeight(1),
                              ),
                              invoice.transactionData["paymentMethod"] == "Card"
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Card Number",
                                          style: invoicetype == true
                                              ? FontsStyle().invoicetxt()
                                              : FontsStyle().invoicetext(),
                                        ),
                                        Text(
                                          "${invoice.transactionData["cardNumber"].substring(0, 4)} **** **** ${invoice.transactionData["cardNumber"].substring(invoice.transactionData["cardNumber"].length - 4)}",
                                          style: invoicetype == true
                                              ? FontsStyle().invoicetxt1()
                                              : FontsStyle().invoicetext1(),
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
                                          style: invoicetype == true
                                              ? FontsStyle().invoicetxt()
                                              : FontsStyle().invoicetext(),
                                        ),
                                        Text(
                                            invoice.transactionData["buyerNo"]
                                                .toString(),
                                            style: invoicetype == true
                                                ? FontsStyle().invoicetxt1()
                                                : FontsStyle().invoicetext1()),
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: ScreenSize().getScreenHeight(1),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Receipt Number ",
                                    style: invoicetype == true
                                        ? FontsStyle().invoicetxt()
                                        : FontsStyle().invoicetext(),
                                  ),
                                  Text(
                                    invoice.transactionData["receiptNum"]
                                        .toString(),
                                    style: invoicetype == true
                                        ? FontsStyle().invoicetxt1()
                                        : FontsStyle().invoicetext1(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ScreenSize().getScreenHeight(1),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Recipient's No. ",
                                    style: invoicetype == true
                                        ? FontsStyle().invoicetxt()
                                        : FontsStyle().invoicetext(),
                                  ),
                                  Text(
                                    invoice.transactionData["recipientNo"]
                                        .toString(),
                                    style: invoicetype == true
                                        ? FontsStyle().invoicetxt1()
                                        : FontsStyle().invoicetext1(),
                                  ),
                                ],
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
                              Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenSize().getScreenHeight(1)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Thank You!",
                                      style: FontsStyle().receiptTitle(),
                                    ),
                                    SizedBox(
                                      height: ScreenSize().getScreenHeight(1),
                                    ),
                                    Center(
                                      child: BarcodeWidget(
                                        drawText: false,
                                        barcode: Barcode
                                            .codabar(), // Barcode type and settings
                                        data:
                                            '${invoice.transactionData["receiptNum"]}', // Content

                                        width: double.infinity,
                                        height: invoicetype == true
                                            ? ScreenSize().getScreenHeight(6)
                                            : ScreenSize().getScreenHeight(5),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: invoicetype == true
                                    ? ScreenSize().getScreenHeight(1.7)
                                    : ScreenSize().getScreenHeight(1.5),
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
                                      btnAction: () {
                                        sendEmailAlert(context);
                                      }),
                                  Button(
                                    btnLabel: Text(
                                      'Print',
                                      style: FontsStyle().startbtnText(),
                                    ),
                                    btnInwardHightSize: btnInHeightSize,
                                    btnOutwardHieghtSize: btnOutHeightSize,
                                    btnInwardWidthSize: btnInWidthSize,
                                    btnOutwardWidthSize: btnOutWidthSize,
                                    outerColor:
                                        Colour().primary().withOpacity(0.2),
                                    btnAction: () {
                                      printService.printReceipt(context);
                                    },
                                    inerColor: Colour().primary(),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: invoicetype == true
                          ? ScreenSize().getScreenHeight(2)
                          : ScreenSize().getScreenHeight(1.5),
                    ),
                    Button(
                      btnAction: invoicetype == false &&
                                  invoice.transactionData["email"] == '' ||
                              invoice.transactionData["email"] == null
                          ? () {}
                          : () {
                              // Provider.of<StoreViewModel>(context, listen: true)
                              //     .setallfield();
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
                            },
                      btnInwardHightSize: ScreenSize().getScreenHeight(7),
                      btnOutwardHieghtSize: ScreenSize().getScreenHeight(8),
                      btnInwardWidthSize: ScreenSize().getScreenWidth(84.5),
                      btnOutwardWidthSize: ScreenSize().getScreenWidth(87),
                      outerColor: Colour().primary().withOpacity(0.2),
                      inerColor: invoicetype == false &&
                                  invoice.transactionData["email"] == '' ||
                              invoice.transactionData["email"] == null
                          ? Colour().primary().withOpacity(0.3)
                          : Colour().primary(),
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

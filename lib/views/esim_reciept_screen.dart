import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:provider/provider.dart';

class EsimRecieptScreen extends StatelessWidget {
  const EsimRecieptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreViewModel>(
      builder: (context, invoice, child) {
        return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize().getScreenHeight(0),
            ),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenSize().getScreenHeight(0.5)),
                child: SizedBox(
                  width: double.infinity,
                  height: ScreenSize().getScreenHeight(12),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: ScreenSize().getScreenHeight(1.5),
                            ),
                            // Image.asset(
                            //   "assets/images/scan_qr.png",
                            //   height: ScreenSize().getScreenHeight(7.5),
                            //   width: double.infinity,
                            // ),
                            Consumer<StoreViewModel>(
                              builder: (context, myQrCode, child) {
                                return Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: ScreenSize().getScreenHeight(8),
                                        height: ScreenSize().getScreenHeight(8),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 3,
                                                color: Colour().primary())),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: ScreenSize()
                                                .getScreenHeight(0.6)),
                                        child: BarcodeWidget(
                                          drawText: false,
                                          barcode: Barcode
                                              .qrCode(), // Barcode type and settings
                                          data:
                                              'LPA:\$pord.smdp-plus.rsp.goog\$3TD6-8L82-HUE1-LVN6', // Content

                                          width:
                                              ScreenSize().getScreenHeight(6.8),
                                          height:
                                              ScreenSize().getScreenHeight(6.8),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              top: ScreenSize()
                                                  .getScreenHeight(3)),
                                          child: Opacity(
                                            opacity: 0.8,
                                            child: Image.asset(
                                              "assets/images/netone.png",
                                              fit: BoxFit.contain,
                                              height: ScreenSize()
                                                  .getScreenHeight(2.5),
                                              width: ScreenSize()
                                                  .getScreenHeight(2.5),
                                            ),
                                          )),
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(
                              height: ScreenSize().getScreenHeight(0.2),
                            ),
                            Text(
                              "SCAN ME",
                              style: FontsStyle().invoiceEsimtxn(),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: ScreenSize().getScreenWidth(1.5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "eSIM DETAILS ",
                                style: FontsStyle().invoiceEsimtxn(),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "MSISDN",
                                    style: FontsStyle().invoiceEsimtext(),
                                  ),
                                  Text(
                                    invoice.transactionData["recipientNo"]
                                        .toString(),
                                    style: FontsStyle().invoiceEsimtext(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ScreenSize().getScreenHeight(0.2),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "ICCID",
                                    style: FontsStyle().invoiceEsimtext(),
                                  ),
                                  Text(
                                    '8923302050020013008',
                                    style: FontsStyle().invoiceEsimtext(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ScreenSize().getScreenHeight(0.2),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "PIN 1",
                                    style: FontsStyle().invoiceEsimtext(),
                                  ),
                                  Text(
                                    '1234',
                                    style: FontsStyle().invoiceEsimtext(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ScreenSize().getScreenHeight(0.2),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "PIN 2",
                                    style: FontsStyle().invoiceEsimtext(),
                                  ),
                                  Text(
                                    '4734',
                                    style: FontsStyle().invoiceEsimtext(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ScreenSize().getScreenHeight(0.2),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "PUK 1",
                                    style: FontsStyle().invoiceEsimtext(),
                                  ),
                                  Text(
                                    '87994856',
                                    style: FontsStyle().invoiceEsimtext(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ScreenSize().getScreenHeight(0.2),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "PUK 2",
                                    style: FontsStyle().invoiceEsimtext(),
                                  ),
                                  Text(
                                    '55504503',
                                    style: FontsStyle().invoiceEsimtext(),
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
              ),
              const Divider(
                color: Colors.black87,
                thickness: 1,
              ),
            ]));
      },
    );
  }
}

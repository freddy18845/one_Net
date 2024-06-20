import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:one_net/utils/currency_format.dart';
import 'package:one_net/view_models/currency_selection.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:provider/provider.dart';
import 'package:sunmi_printer_plus/column_maker.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';

class PrintingService extends ChangeNotifier {
  bool printBinded = false;
  int paperSize = 0;
  String serialNumber = "";
  String printerVersion = "";

  PrintingService() {
    loadInit();
  }

  loadInit() async {
    await initiatePrinter();
  }

  initiatePrinter() {
    _bindingPrinter().then((bool? isBind) async {
      SunmiPrinter.paperSize().then((int size) {
        paperSize = size;
      });

      SunmiPrinter.printerVersion().then((String version) {
        printerVersion = version;
      });

      SunmiPrinter.serialNumber().then((String serial) {
        serialNumber = serial;
      });

      printBinded = isBind!;
    });
  }

  /// must binding ur printer at first init in app
  Future<bool?> _bindingPrinter() async {
    final bool? result = await SunmiPrinter.bindingPrinter();
    return result;
  }

  Future<Uint8List> readFileBytes(String path) async {
    ByteData fileData = await rootBundle.load(path);
    Uint8List fileUnit8List = fileData.buffer
        .asUint8List(fileData.offsetInBytes, fileData.lengthInBytes);
    return fileUnit8List;
  }

  Future<Uint8List> _getImageFromAsset(String iconPath) async {
    return await readFileBytes(iconPath);
  }

  printReceipt(context) async {
    Map transactionData =
        Provider.of<StoreViewModel>(context, listen: false).transactionData;
    final myCurrency =
        Provider.of<CurrencySelectionViewModel>(context, listen: false);

    bool invoicetype =
        Provider.of<StoreViewModel>(context, listen: false).esimInvoice;

    try {
      /// Receipt Header
      await SunmiPrinter.initPrinter();
      Uint8List byte =
          await _getImageFromAsset('assets/images/invoicelogo.jpg');
      await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);

      await SunmiPrinter.startTransactionPrint(true);
      await SunmiPrinter.printImage(byte);

      await SunmiPrinter.lineWrap(1);
      await SunmiPrinter.lineWrap(1);
      await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
      await SunmiPrinter.setCustomFontSize(28);
      await SunmiPrinter.printText("Transaction Receipt!");

      await SunmiPrinter.line(len: 48);
      await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
      await SunmiPrinter.setCustomFontSize(20);
      await SunmiPrinter.printText("Amount Paid");

      await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
      await SunmiPrinter.setCustomFontSize(30);
      await SunmiPrinter.printText(myCurrency.activeCurrency +
          Currency().format(transactionData["totalPrice"].toString()));

      await SunmiPrinter.line(len: 48);
      if (invoicetype == false) {
        await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
        await SunmiPrinter.setCustomFontSize(20);
        await SunmiPrinter.printText("eSIM Details");
        await SunmiPrinter.line(len: 48);
        await SunmiPrinter.printRow(
          cols: [
            ColumnMaker(text: "MSISDN", width: 23, align: SunmiPrintAlign.LEFT),
            ColumnMaker(
                text: transactionData["recipientNo"],
                width: 24,
                align: SunmiPrintAlign.RIGHT),
          ],
        );
        await SunmiPrinter.printRow(
          cols: [
            ColumnMaker(text: "ICCID", width: 23, align: SunmiPrintAlign.LEFT),
            ColumnMaker(
                text: "8923302050020013008",
                width: 24,
                align: SunmiPrintAlign.RIGHT),
          ],
        );
        await SunmiPrinter.printRow(
          cols: [
            ColumnMaker(text: "PIN 1", width: 23, align: SunmiPrintAlign.LEFT),
            ColumnMaker(text: "1234", width: 24, align: SunmiPrintAlign.RIGHT),
          ],
        );
        await SunmiPrinter.printRow(
          cols: [
            ColumnMaker(text: "PIN 2", width: 23, align: SunmiPrintAlign.LEFT),
            ColumnMaker(text: "1234", width: 24, align: SunmiPrintAlign.RIGHT),
          ],
        );
        await SunmiPrinter.printRow(
          cols: [
            ColumnMaker(text: "PUK 1", width: 23, align: SunmiPrintAlign.LEFT),
            ColumnMaker(
                text: "87994856", width: 24, align: SunmiPrintAlign.RIGHT),
          ],
        );
        await SunmiPrinter.printRow(
          cols: [
            ColumnMaker(text: "PUK 2", width: 23, align: SunmiPrintAlign.LEFT),
            ColumnMaker(
                text: "55504503", width: 24, align: SunmiPrintAlign.RIGHT),
          ],
        );
      }
      await SunmiPrinter.line(len: 48);
      await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
      await SunmiPrinter.setCustomFontSize(26);
      await SunmiPrinter.printText("TRANSACTION DETAILS");

      await SunmiPrinter.line(len: 48);
      await SunmiPrinter.printRow(
        cols: [
          ColumnMaker(
              text: "Transaction Type ",
              width: 23,
              align: SunmiPrintAlign.LEFT),
          ColumnMaker(
              text: transactionData["TransactionType"].toString(),
              width: 24,
              align: SunmiPrintAlign.RIGHT),
        ],
      );

      await SunmiPrinter.printRow(
        cols: [
          ColumnMaker(text: "Date", width: 23, align: SunmiPrintAlign.LEFT),
          ColumnMaker(
              text: DateFormat("dd-MMM-yyyy  h:mm a").format(DateTime.now()),
              width: 24,
              align: SunmiPrintAlign.RIGHT),
        ],
      );

      if (transactionData["paymentMethod"] == "Card") {
        await SunmiPrinter.printRow(
          cols: [
            ColumnMaker(
                text: "Card Number", width: 23, align: SunmiPrintAlign.LEFT),
            ColumnMaker(
                text:
                    "${transactionData["cardNumber"].substring(0, 4)} **** **** ${transactionData["cardNumber"].substring(transactionData["cardNumber"].length - 4)}",
                width: 24,
                align: SunmiPrintAlign.RIGHT),
          ],
        );
      }

      if (transactionData["paymentMethod"] == "Mobile Money") {
        await SunmiPrinter.printRow(
          cols: [
            ColumnMaker(
                text: "Buyer's Number", width: 23, align: SunmiPrintAlign.LEFT),
            ColumnMaker(
                text: transactionData["buyerNo"],
                width: 24,
                align: SunmiPrintAlign.RIGHT),
          ],
        );
      }

      await SunmiPrinter.printRow(
        cols: [
          ColumnMaker(
              text: "Receipt Number", width: 23, align: SunmiPrintAlign.LEFT),
          ColumnMaker(
              text: transactionData["receiptNum"].toString(),
              width: 24,
              align: SunmiPrintAlign.RIGHT),
        ],
      );

      await SunmiPrinter.printRow(
        cols: [
          ColumnMaker(
              text: "Recipient's No", width: 23, align: SunmiPrintAlign.LEFT),
          ColumnMaker(
              text: transactionData["recipientNo"],
              width: 24,
              align: SunmiPrintAlign.RIGHT),
        ],
      );

      /// Receipt Footer

      if (invoicetype == false) {
        await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);

        await SunmiPrinter.printQRCode(
            " LPA:\$pord.smdp-plus.rsp.goog\$3TD6-8L82-HUE1-LVN6");
        await SunmiPrinter.lineWrap(1);
        await SunmiPrinter.setCustomFontSize(23);
        await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
        await SunmiPrinter.printText("Scan Me");
      }
      if (invoicetype == true) {
        await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
        await SunmiPrinter.lineWrap(1);
        await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER); // Center align
        await SunmiPrinter.printText('Thank You!');
        await SunmiPrinter.lineWrap(1);
        await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
        await SunmiPrinter.printBarCode(
            "Order No:${myCurrency.activeCurrency}${Currency().format("${transactionData["rechargeAmount"]}")}",
            height: 54,
            width: 46,
            textPosition: SunmiBarcodeTextPos.NO_TEXT);
        await SunmiPrinter.lineWrap(1);
      }
      await SunmiPrinter.exitTransactionPrint(true);
      await SunmiPrinter.cut();

      return true;
    } catch (e) {
      print(e);
      print("Cannot Print. An Error Occured!");
      return false;
    }
  }
}

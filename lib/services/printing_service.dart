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
      await SunmiPrinter.printText("USD${transactionData["rechargeAmount"]}");
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
              text: "Airtime Purchase",
              width: 24,
              align: SunmiPrintAlign.RIGHT),
        ],
      );

      await SunmiPrinter.printRow(
        cols: [
          ColumnMaker(text: "Date", width: 23, align: SunmiPrintAlign.LEFT),
          ColumnMaker(
              text: DateFormat("dd-MMM-yyyy  h:mm a").format(
                DateTime.parse(
                  transactionData["orderDateTime"].toString(),
                ),
              ),
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
      await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
      await SunmiPrinter.lineWrap(1);
      await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER); // Center align
      await SunmiPrinter.printText('Thank You!');
      // await SunmiPrinter.lineWrap(1);
      await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
      await SunmiPrinter.printBarCode(
          "Order No:${myCurrency.activeCurrency}${Currency().format("${transactionData["rechargeAmount"]}")}",
          height: 54,
          width: 46,
          textPosition: SunmiBarcodeTextPos.NO_TEXT);
      await SunmiPrinter.lineWrap(1);
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

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:qodesh_app/view_models/store_view_model.dart';
// import 'package:sunmi_printer_plus/column_maker.dart';
// import 'package:sunmi_printer_plus/enums.dart';
// import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';

// class PrintingService extends ChangeNotifier {
//   bool printBinded = false;
//   int paperSize = 0;
//   String serialNumber = "";
//   String printerVersion = "";

//   PrintingService() {
//     loadInit();
//   }

//   loadInit() async {
//     await initiatePrinter();
//   }

//   initiatePrinter() {
//     _bindingPrinter().then((bool? isBind) async {
//       SunmiPrinter.paperSize().then((int size) {
//         paperSize = size;
//       });

//       SunmiPrinter.printerVersion().then((String version) {
//         printerVersion = version;
//       });

//       SunmiPrinter.serialNumber().then((String serial) {
//         serialNumber = serial;
//       });

//       printBinded = isBind!;
//     });
//   }

//   /// must binding ur printer at first init in app
//   Future<bool?> _bindingPrinter() async {
//     final bool? result = await SunmiPrinter.bindingPrinter();
//     return result;
//   }

//   Future<Uint8List> readFileBytes(String path) async {
//     ByteData fileData = await rootBundle.load(path);
//     Uint8List fileUnit8List = fileData.buffer
//         .asUint8List(fileData.offsetInBytes, fileData.lengthInBytes);
//     return fileUnit8List;
//   }

//   Future<Uint8List> _getImageFromAsset(String iconPath) async {
//     return await readFileBytes(iconPath);
//   }

//   printReceipt(context) async {
//     Map transactionData =
//         Provider.of<StoreViewModel>(context, listen: false).transactionData;
//     // var values = firstService.getListOfValues();
//     // print(transactionDetial.orderData);
//     // print(transactionDetial.cart);

//     try {
//       /// Receipt Header
//       await SunmiPrinter.initPrinter();
//       Uint8List byte =
//           await _getImageFromAsset('assets/images/reciept_logo.jpg');
//       await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);

//       await SunmiPrinter.startTransactionPrint(true);
//       await SunmiPrinter.printImage(byte);
//       // if (transactionData["paymentMethod"] == "Mobile Payment") {
//       //   Uint8List momologo =
//       //       await _getImageFromAsset(transactionData["selectedNetworkImage"]);
//       //   await SunmiPrinter.setAlignment(SunmiPrintAlign.RIGHT);
//       //   await SunmiPrinter.startTransactionPrint(true);
//       //   await SunmiPrinter.printImage(momologo);
//       // }
//       // if (transactionData["paymentMethod"] == "Card  Payment") {
//       //   Uint8List cardlogo =
//       //       await _getImageFromAsset('assets/images/payments/bank_card.png');
//       //   await SunmiPrinter.setAlignment(SunmiPrintAlign.RIGHT);
//       //   await SunmiPrinter.startTransactionPrint(true);
//       //   await SunmiPrinter.printImage(cardlogo);
//       // }

//       await SunmiPrinter.lineWrap(1);
//       await SunmiPrinter.lineWrap(1);
//       await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
//       await SunmiPrinter.setCustomFontSize(28);
//       await SunmiPrinter.printText("Payment Successful!");

//       await SunmiPrinter.line(len: 48);
//       await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
//       await SunmiPrinter.setCustomFontSize(20);
//       await SunmiPrinter.printText("Amount Paid");

//       await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
//       await SunmiPrinter.setCustomFontSize(30);
//       await SunmiPrinter.printText(
//           "GH¢" + transactionData["Amount"].toString());
//       await SunmiPrinter.line(len: 48);
//       await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
//       await SunmiPrinter.setCustomFontSize(26);
//       await SunmiPrinter.printText("TRANSACTION DETAILS");

//       await SunmiPrinter.line(len: 48);
//       await SunmiPrinter.printRow(
//         cols: [
//           ColumnMaker(
//               text: "Transaction Type ",
//               width: 23,
//               align: SunmiPrintAlign.LEFT),
//           ColumnMaker(
//               text: transactionData["transactionType"],
//               width: 24,
//               align: SunmiPrintAlign.RIGHT),
//         ],
//       );
//       // if (transactionData["paymentMethod"] == "Card Payment") {
//       await SunmiPrinter.printRow(
//         cols: [
//           ColumnMaker(text: "Date", width: 23, align: SunmiPrintAlign.LEFT),
//           ColumnMaker(
//               text: DateFormat("dd-MMM-yyyy  h:mm a").format(
//                 DateTime.parse(
//                   transactionData["orderDateTime"],
//                 ),
//               ),
//               width: 24,
//               align: SunmiPrintAlign.RIGHT),
//         ],
//       );
//       // }
//       // if (transactionData["paymentMethod"] == "Mobile Payment") {
//       //   await SunmiPrinter.printRow(
//       //     cols: [
//       //       ColumnMaker(text: "Date", width: 23, align: SunmiPrintAlign.LEFT),
//       //       ColumnMaker(
//       //           text: DateFormat("dd-MMM-yyyy").format(
//       //             DateTime.parse(
//       //               transactionData["orderDateTime"],
//       //             ),
//       //           ),
//       //           width: 24,
//       //           align: SunmiPrintAlign.RIGHT),
//       //     ],
//       //   );
//       // }
//       if (transactionData["paymentMethod"] == "Card Payment") {
//         await SunmiPrinter.printRow(
//           cols: [
//             ColumnMaker(
//                 text: "Card Number", width: 23, align: SunmiPrintAlign.LEFT),
//             ColumnMaker(
//                 text: "4545 xxxx xxxx 7845",
//                 width: 24,
//                 align: SunmiPrintAlign.RIGHT),
//           ],
//         );
//       }
//       // if (transactionData["paymentMethod"] == "Mobile Paymentt") {
//       //   await SunmiPrinter.printRow(
//       //     cols: [
//       //       ColumnMaker(text: "Time:", width: 23, align: SunmiPrintAlign.LEFT),
//       //       ColumnMaker(
//       //           text: DateFormat("h:mm a").format(
//       //             DateTime.parse(
//       //               transactionData["orderDateTime"],
//       //             ),
//       //           ),
//       //           width: 24,
//       //           align: SunmiPrintAlign.RIGHT),
//       //     ],
//       //   );
//       // }
//       if (transactionData["paymentMethod"] == "Card Payment") {
//         await SunmiPrinter.printRow(
//           cols: [
//             ColumnMaker(
//                 text: "Auth. Code", width: 23, align: SunmiPrintAlign.LEFT),
//             ColumnMaker(
//                 text: "45457845", width: 24, align: SunmiPrintAlign.RIGHT),
//           ],
//         );
//       }
//       if (transactionData["paymentMethod"] == "Mobile Payment") {
//         await SunmiPrinter.printRow(
//           cols: [
//             ColumnMaker(
//                 text: "Mobile Number", width: 23, align: SunmiPrintAlign.LEFT),
//             ColumnMaker(
//                 text: transactionData["mobileNumber"],
//                 width: 24,
//                 align: SunmiPrintAlign.RIGHT),
//           ],
//         );
//       }
//       if (transactionData["paymentMethod"] == "Card Payment") {
//         await SunmiPrinter.printRow(
//           cols: [
//             ColumnMaker(text: "STAN", width: 23, align: SunmiPrintAlign.LEFT),
//             ColumnMaker(
//                 text: "SVSP645457845", width: 24, align: SunmiPrintAlign.RIGHT),
//           ],
//         );
//       }
//       if (transactionData["paymentMethod"] == "Mobile Payment") {
//         await SunmiPrinter.printRow(
//           cols: [
//             ColumnMaker(
//                 text: "transaction ID", width: 23, align: SunmiPrintAlign.LEFT),
//             ColumnMaker(
//                 text: "64657657635", width: 24, align: SunmiPrintAlign.RIGHT),
//           ],
//         );
//       }
//       await SunmiPrinter.printRow(
//         cols: [
//           ColumnMaker(text: "Name ", width: 23, align: SunmiPrintAlign.LEFT),
//           ColumnMaker(
//               text: transactionData["userFullname"],
//               width: 24,
//               align: SunmiPrintAlign.RIGHT),
//         ],
//       );

//       /// Receipt Footer
//       await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
//       await SunmiPrinter.lineWrap(1);
//       await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER); // Center align
//       await SunmiPrinter.printText('Thank You For Your Purchase!');
//       // await SunmiPrinter.lineWrap(1);
//       await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
//       await SunmiPrinter.printBarCode("Order No: ${transactionData["Amount"]}",
//           height: 54, width: 46, textPosition: SunmiBarcodeTextPos.NO_TEXT);
//       await SunmiPrinter.lineWrap(1);
//       await SunmiPrinter.exitTransactionPrint(true);
//       await SunmiPrinter.cut();

//       return true;
//     } catch (e) {
//       print("Cannot Print. An Error Occured!");
//       return false;
//     }
//   }
// }

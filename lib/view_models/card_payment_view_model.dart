import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:one_net/view_models/currency_selection.dart';
import 'package:one_net/view_models/debug_switch_view_model.dart';
import 'package:one_net/view_models/ip_address_view_model.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/transaction_inprogess_screen.dart';
import 'package:one_net/widgets/toast_message.dart';
import 'package:provider/provider.dart';

class CardPaymentViewModel extends ChangeNotifier {
  payNow(context) async {
    String selectedCurrency =
        Provider.of<CurrencySelectionViewModel>(context, listen: false)
            .activeCurrency;

    bool isDebugMode =
        Provider.of<DebugSwitchViewModel>(context, listen: false).debug;
    String ipAddress =
        Provider.of<IpaddressViewModel>(context, listen: false).ipAddress;
    StoreViewModel myData = Provider.of<StoreViewModel>(context, listen: false);
    // if (isDebugMode == false) {
    try {
      Map jsonData = <String, dynamic>{
        "MessageType": "0200",
        "TransactionType": "00",
        "TellerID": "11011011",
        "TellerName": "Teller 1",
        "ReferenceNo": "123456789017",
        "DateTime": "20240613211013",
        "InvoiceNo": "Inv2500292",
        "TenderType": "01",
        "Currency": "936",
        "CurrencySymbol": "\$",
        "TransactionAmount": myData.transactionData["rechargeAmount"],
        "CashBackAmount": "0.00",
        "ForcePost": "0",
        "Narrative": myData.transactionData["TransactionType"].toString(),
        "Account1": "",
        "Account2": "",
        "EchoData": "I move through air without wings"
      };

      final url = Uri.parse('http://$ipAddress:8080/v1/pay/');

      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          },
          body: jsonEncode(jsonData));

      var apiResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (apiResponse["ResponseCode"] == "00") {
          Provider.of<StoreViewModel>(context, listen: false)
              .setPaymetData(apiResponse);
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  const TransactionInprogress(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        } else {
          getTxnFailedAlert(context);
        }
      } else {
        getTxnFailedAlert(context);
      }
    } catch (e) {
      Timer(const Duration(seconds: 1), () {
        Navigator.pop(context);
      });
      print(e);
      print("An error occured in the http request");
    }
  }
  //else {
  // Timer(const Duration(seconds: 5), () {
  //   Provider.of<StoreViewModel>(context, listen: false).defaultResponse();
  //   Navigator.push(
  //     context,
  //     PageRouteBuilder(
  //       pageBuilder: (context, animation1, animation2) =>
  //           const TransactionInprogress(),
  //       transitionDuration: Duration.zero,
  //       reverseTransitionDuration: Duration.zero,
  //     ),
  //   );
  // });
  // }
  // }
}

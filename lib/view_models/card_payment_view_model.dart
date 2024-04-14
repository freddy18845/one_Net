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
    if (isDebugMode == false) {
      print("1");
      try {
        Map jsonData = <String, dynamic>{
          "transactionId": "087870909",
          "transactionType": "00",
          "orderNumber": myData.transactionData["receiptNum"].toString(),
          "description": myData.transactionData["TransactionType"].toString(),
          "amount": double.parse(myData.transactionData["rechargeAmount"]),
          "currencyCode": 748,
          "currencySymbol": selectedCurrency,
          "paymentMethod": myData.transactionData["paymentMethod"],
          "date": "2023-07-06T11:05:51.771474Z"
        };
        print("2");
        final url = Uri.parse('http://$ipAddress:8080/v1/pay/');
        print("3");
        final response = await http.post(url,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Accept': 'application/json',
            },
            body: jsonEncode(jsonData));
        // print(response.statusCode);
        // print(response.body);
        print("4");
        var apiResponse = jsonDecode(response.body);
        print("5");
        //Map newResponse = json.decode(apiResponse);
        // print("6");
        // print(apiResponse);
        // print("7");
        if (response.statusCode == 200) {
          if (apiResponse["responseCode"] == "00") {
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
    } else {
      Timer(const Duration(seconds: 5), () {
        Provider.of<StoreViewModel>(context, listen: false).defaultResponse();
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                const TransactionInprogress(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      });
    }
  }
}

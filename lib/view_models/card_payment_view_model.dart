import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:one_net/view_models/debug_switch_view_model.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/transaction_inprogess_screen.dart';
import 'package:provider/provider.dart';

class CardPaymentViewModel extends ChangeNotifier {
  payNow(context) async {
    double amount =
        Provider.of<StoreViewModel>(context, listen: false).getAmount();

    bool isDebugMode =
        Provider.of<DebugSwitchViewModel>(context, listen: false).debug;

    if (isDebugMode == false) {
      try {
        final url = Uri.parse('http://192.168.1.150:8080/v1/pay/');
        final response = await http.post(url,
            body: jsonEncode(<String, dynamic>{
              "transactionId": "2003939929",
              "merchantName": "merchantName",
              "orderNumber": "23783676",
              "amount": amount,
              "currencyCode": "ZWL",
              "paymentMethod": "CARD",
              "network": "",
              "pan": "",
              "description": "Payment for goods",
              "authCode": "18388484834"
            }),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            });
        print(response.body);

        var apiResponse = jsonDecode(response.body);
        print(apiResponse);
        Provider.of<StoreViewModel>(context, listen: false)
            .setPaymetData(apiResponse);
        //Navigator.of(ContextService.navigatorKey.currentContext!).pop();
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                const TransactionInprogress(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      } catch (e) {
        print(e);
        print("An error occured in the hhtp request");
      }

      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');
    } else {
      //   Timer(const Duration(seconds: 4), () {
      //     Provider.of<StoreViewModel>(context, listen: false).defaultResponse();
      //     Navigator.push(
      //       context,
      //       PageRouteBuilder(
      //         pageBuilder: (context, animation1, animation2) =>
      //             const TransactionInprogress(),
      //         transitionDuration: Duration.zero,
      //         reverseTransitionDuration: Duration.zero,
      //       ),
      //     );
      //   });
    }
  }
}

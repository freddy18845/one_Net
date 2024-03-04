import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:one_net/view_models/debug_switch_view_model.dart';
import 'package:one_net/view_models/ip_address_view_model.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/transaction_inprogess_screen.dart';
import 'package:one_net/widgets/toast_message.dart';
import 'package:provider/provider.dart';

class CardPaymentViewModel extends ChangeNotifier {
  payNow(context) async {
    double amount =
        Provider.of<StoreViewModel>(context, listen: false).getAmount();

    bool isDebugMode =
        Provider.of<DebugSwitchViewModel>(context, listen: false).debug;
    String ipAddress =
        Provider.of<IpaddressViewModel>(context, listen: false).ipAddress;
    if (isDebugMode == false) {
      try {
        final url = Uri.parse('http://$ipAddress:8080/v1/pay/');
        final response = await http.post(url,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Accept': 'application/json',
            },
            body: jsonEncode(<String, dynamic>{
              "transactionId": "2003939929",
              "merchantName": "merchantName",
              "orderNumber": "23783676",
              "amount": amount,
              "currencyCode": "SZL",
              "paymentMethod": "CARD",
              "network": null,
              "pan": null,
              "description": null,
              "authCode": "18388484834"
            }));
        print(response.statusCode);
        print(response.body);

        var apiResponse = jsonDecode(response.body);
        Map newResponse = json.decode(apiResponse);

        print(newResponse);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Provider.of<StoreViewModel>(context, listen: false)
              .setPaymetData(newResponse);

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
      } catch (e) {
        Timer(const Duration(seconds: 1), () {
          Navigator.pop(context);
        });
        //print(e);
        // print("An error occured in the hhtp request");
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

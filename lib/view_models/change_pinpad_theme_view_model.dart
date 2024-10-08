import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:one_net/view_models/debug_switch_view_model.dart';
import 'package:one_net/view_models/ip_address_view_model.dart';
import 'package:one_net/widgets/failed_card_alert_modal.dart';
import 'package:provider/provider.dart';

class PinpadThemeView extends ChangeNotifier {
  // PinpadThemeView(context) {
  //   colourTheme(context);
  // }

  colourTheme(context) async {
    String ipAddress =
        Provider.of<IpaddressViewModel>(context, listen: false).ipAddress;
    bool isDebugMode =
        Provider.of<DebugSwitchViewModel>(context, listen: false).debug;
    // print("Changng PIN Pad Colour");
    if (isDebugMode == false) {
      try {
        final url = Uri.parse('http://$ipAddress:8080/v1/colour/');
        final response = await http.post(url,
            body: jsonEncode(<String, String>{
              "index": "5",
            }),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            });
        //  print(response.body);

        // var apiResponse =
        jsonDecode(response.body);
      } catch (e) {
        // print(e);
        getSmartPadAlert(context);
        // print("An error occured in the http request");
      }
    }
  }
}

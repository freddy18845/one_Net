import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PinpadThemeView extends ChangeNotifier {
  PinpadThemeView() {
    colourTheme();
  }

  colourTheme() async {
    print("Changng PIN Pad Colour");
    try {
      final url = Uri.parse('http://192.168.1.150:8080/v1/colour/');
      final response = await http.post(url,
          body: jsonEncode(<String, dynamic>{
            "index": "5",
          }),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          });
      print(response.body);

      var apiResponse = jsonDecode(response.body);
      print("apiResponse");
      print(apiResponse);
    } catch (e) {
      //print(e);
      print("An error occured in the http request");
    }
  }
}

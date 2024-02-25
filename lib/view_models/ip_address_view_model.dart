import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IpaddressViewModel extends ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String ipAddress = "000.000.000.000";
  Future<void> setIpAddress(value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('ip', value);

    ipAddress = value;
    notifyListeners();
  }

  IpaddressViewModel() {
    setIPAddress();
  }
  void saveIPAddress(context, val) async {
    final SharedPreferences prefs = await _prefs;
    ipAddress = val;
    await prefs.setString('ip', val);
    // setIPAddress();
    notifyListeners();
    Navigator.of(context).pop();
  }

  getIpAddress() async {
    final SharedPreferences prefs = await _prefs;
    if (ipAddress == "000.000.000.000") {
      final SharedPreferences prefs = await _prefs;
      ipAddress = prefs.getString('ip') ?? "000.000.000.000";
      //  update();
      notifyListeners();
    }
    //return ipAddress;
    //print(ipAddress);
  }

  void setIPAddress() async {
    final SharedPreferences prefs = await _prefs;
    ipAddress = prefs.getString('ip') ?? "000.000.000.000";
    // update();
    notifyListeners();
  }
}

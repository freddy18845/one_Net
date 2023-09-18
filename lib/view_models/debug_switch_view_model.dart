import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DebugSwitchViewModel extends ChangeNotifier {
 final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

 bool debug = false;


 DebugSwitchViewModel(){
   getDebugValue();
 }

 Future<void> toggleDebug(value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool('debugMode', value);

    debug = value;
    notifyListeners();
 }

 getDebugValue() async {
       final SharedPreferences prefs = await _prefs;
     debug =   prefs.getBool('debugMode') ?? false;
     notifyListeners();
  }


}
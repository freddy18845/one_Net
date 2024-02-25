import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_net/view_models/ip_address_view_model.dart';
import 'package:provider/provider.dart';

getIPModal(context) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        double screenW = MediaQuery.of(context).size.width;
        double screenH = MediaQuery.of(context).size.height;
        final ipStorage = Provider.of<IpaddressViewModel>(context);
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          contentPadding: const EdgeInsets.all(0),
          insetPadding: const EdgeInsets.all(0),
          content: Container(
            height: screenH * 0.26,
            width: screenW * 0.7,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screenH * 0.01, horizontal: screenW * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenH * 0.01,
                  ),
                  Text(
                    "IP Address Configuration",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: screenH * 0.022,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenH * 0.02, horizontal: screenW * 0.01),
                    child: SizedBox(
                      height: screenH * 0.07,
                      child: TextFormField(
                          initialValue: ipStorage.ipAddress,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          autofocus: true,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenH * 0.025,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            letterSpacing: 3.0,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9.]')),
                          ],
                          maxLength: 15,
                          onChanged: (value) {
                            ipStorage.setIpAddress(value);
                          },
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: "Enter P2 IP Address",
                            filled: true,
                            fillColor: const Color.fromARGB(113, 211, 210, 210),
                            counterText: "",
                            labelStyle: const TextStyle(
                                color: Color.fromRGBO(134, 134, 134, 1)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(134, 134, 134, 1),
                              ),
                              borderRadius:
                                  BorderRadius.circular(screenH * 0.01),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(134, 134, 134, 1),
                              ),
                              borderRadius:
                                  BorderRadius.circular(screenH * 0.01),
                            ),
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            height: screenH * 0.06,
                            width: screenW * 0.28,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.circular(screenH * 0.01)),
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenH * 0.022,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          ipStorage.getIpAddress();
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            height: screenH * 0.06,
                            width: screenW * 0.28,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.circular(screenH * 0.01)),
                            child: Center(
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenH * 0.022,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}

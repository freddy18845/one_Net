import 'package:flutter/material.dart';
import 'package:one_net/widgets/ip_address_modal.dart';

getSmartPadAlert(context) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        double screenW = MediaQuery.of(context).size.width;
        double screenH = MediaQuery.of(context).size.height;
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
                    "SmartPad Settings",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: screenH * 0.027,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenH * 0.02, horizontal: screenW * 0.01),
                    child: Text(
                      "Please Make Sure The \n"
                      " Settings Are Correct.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: screenH * 0.025,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      getIPModal(context);
                    },
                    child: Container(
                        height: screenH * 0.06,
                        width: screenW * 0.48,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.circular(screenH * 0.01)),
                        child: Center(
                          child: Text(
                            "Ok",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenH * 0.025,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        );
      });
}

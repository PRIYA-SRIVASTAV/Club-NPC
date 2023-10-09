import 'package:flutter/material.dart';
import '../Contact_Details.dart';
import '../Create_new_password.dart';
import '../core/ApiCall.dart';
import '../utils/helper_widget.dart';

class RegisterOtpController {
  Future registerOtpMethod(emailID, OTP, context, fromPage) async {
    debugPrint("----${OTP}");
    if (OTP.toString().isEmpty) {
      customFlutterToast("OTP can't be empty");
    } else if (OTP.toString().length != 6) {
      customFlutterToast("Enter 6 digit OTP");
    } else {
      var r = await ApiCalling().Register_OTP_user(emailID, OTP);
      if (r["status"].toString() == "true") {
        if (fromPage.toString() == "Register") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Contact_Details_Page(
                email: emailID,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Create_new_password(
                emailID: emailID,
              ),
            ),
          );
        }
      } else {
        customFlutterToast(r['message'].toString());
      }
    }
  }
}

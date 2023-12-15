import 'package:club_npc_registration/constants/StringConstant.dart';
import 'package:flutter/material.dart';
import '../Contact_Details.dart';
import '../Create_new_password.dart';
import '../core/ApiCall.dart';
import '../utils/helper_widget.dart';

class RegisterOtpController {
  Future registerOtpMethod1(mobile, OTP,context, fromPage) async {
    debugPrint("----${OTP}");
    if (OTP.toString().isEmpty) {
      customFlutterToast("OTP can't be empty");
    } else if (OTP.toString().length != 6) {
      customFlutterToast("Enter 6 digit OTP");
    } else {
      var r = await ApiCalling().Register_OTP_user(mobile, OTP,OTP_type1);
      if (r["status"].toString() == "true") {
        customFlutterToast(r["message"].toString());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Contact_Details_Page(
              mobile: mobile,
            ),
          ),
        );
      } else {
        customFlutterToast(r["message"].toString());
      }
    }
  }
  Future registerOtpMethod2(phone, OTP,context, fromPage) async {
    debugPrint("----${OTP}");
    if (OTP.toString().isEmpty) {
      customFlutterToast("OTP can't be empty");
    } else if (OTP.toString().length != 6) {
      customFlutterToast("Enter 6 digit OTP");
    } else {
      var r = await ApiCalling().Register_OTP_user(phone, OTP,OTP_type2);
      if (r["status"].toString() == "true") {
        customFlutterToast(r["message"].toString());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Create_new_password(
              phone: phone,
            ),
          ),
        );
      } else {
       customFlutterToast(r["message"].toString());
      }
    }
  }

}

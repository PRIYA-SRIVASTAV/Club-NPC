import 'package:club_npc_registration/Create_new_password.dart';
import 'package:club_npc_registration/Otp_page.dart';
import 'package:club_npc_registration/utils/helper_widget.dart';
import 'package:flutter/material.dart';
import '../../core/ApiCall.dart';

class Forget_Password_Controller {
  forget_password_Method(mobile,context) async {
    if (mobile.toString().isEmpty) {
      customFlutterToast("mobile can't be empty");
    } else {
      var r = await ApiCalling().forget_Password(mobile);
      if (r["status"].toString() == "true") {
        customFlutterToast(r["message"].toString());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Otp_page(mobile: mobile,fromPage: "forgetPage",))
        );
      } else {
        customFlutterToast(r["message"].toString());
      }
    }
  }
}

import 'package:club_npc_registration/Create_new_password.dart';
import 'package:club_npc_registration/Otp_page.dart';
import 'package:club_npc_registration/utils/helper_widget.dart';
import 'package:flutter/material.dart';
import '../../core/ApiCall.dart';

class Forget_Password_Controller {
  forget_password_Method(email,context) async {
    if (email.toString().isEmpty) {
      customFlutterToast("email can't be empty");
    } else {
      var r = await ApiCalling().forget_Password(email);
      if (r["status"].toString() == "true") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Otp_page(emailID: email,fromPage: "forgetPage",))
        );
      } else {
        customFlutterToast(r["message"]);
      }
    }
  }
}

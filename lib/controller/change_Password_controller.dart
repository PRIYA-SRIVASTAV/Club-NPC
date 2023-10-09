import 'package:club_npc_registration/Otp_page.dart';
import 'package:club_npc_registration/Sign_in_Page.dart';
import 'package:club_npc_registration/utils/helper_widget.dart';
import 'package:flutter/material.dart';
import '../../core/ApiCall.dart';

class change_Password_Controller {
  change_password_Method(password, confirm_Password, email, context) async {
    if (password.toString().isEmpty) {
      customFlutterToast("Please enter new password");
    } else if (confirm_Password.toString().isEmpty) {
      customFlutterToast("Please confirm new password");
    } else if (password != confirm_Password) {
      customFlutterToast("confirm password doesn't match");
    } else {
      var r =
          await ApiCalling().change_password(password, confirm_Password, email);
      debugPrint("++++++++++++++++++++++++++++++++ ${r}");
      if (r["status"].toString() == "true") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Sign_in_Page()),
        );
        customFlutterToast(r["message"]);
      } else {
        customFlutterToast(r["message"]);
      }
    }
  }
}

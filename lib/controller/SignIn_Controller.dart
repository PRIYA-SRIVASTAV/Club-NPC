import 'package:club_npc_registration/Dashboard_Page.dart';
import 'package:club_npc_registration/utils/helper_widget.dart';
import 'package:flutter/material.dart';
import '../../core/ApiCall.dart';
import '../constants/prefs_contants.dart';
import '../utils/helper_Methods.dart';

class SignIn_Controller {
  signIn_Method(phone, password, context) async {
    if (phone.toString().isEmpty) {
      customFlutterToast("phone no. can't be empty");
    } else if (password.toString().isEmpty) {
      customFlutterToast("Password can't be empty");
    } else {
      var r = await ApiCalling().Login_user(phone, password);

      if (r["status"].toString() == "true") {
        getPref().then((value) {
          value.setString(keyToken, r['token'].toString());
        });
        getPref().then((value) {
          value.setString(KEYID, r['id'].toString());
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home_Page()),
        );
      } else {
        customFlutterToast(r["message"]);
      }
    }
  }
}

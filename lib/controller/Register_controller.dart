import 'package:club_npc_registration/Otp_page.dart';
import 'package:club_npc_registration/utils/helper_widget.dart';
import 'package:flutter/material.dart';
import '../../core/ApiCall.dart';

bool isEmailValid(String email) {
  final emailPattern = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,})$',
    caseSensitive: false,
  );
  return emailPattern.hasMatch(email.toString());
}


class RegisterController {
  Future registerMethod(
      name, mobileNo, email, whoIntroduce, password, cPassword, context) async {
    if (name.toString().isEmpty) {
      customFlutterToast("Name Can't be empty");
    } else if (mobileNo.toString().isEmpty) {
      customFlutterToast("mobile no. can't be empty");
    } else if (email.toString().isEmpty) {
      customFlutterToast("email can't be empty or email must be valid");
    } else if (isEmailValid(email)) {
      print("---------->${email}");
      customFlutterToast("The email format is invalid");
    } else if (whoIntroduce.toString().isEmpty) {
      customFlutterToast("who introduce field can't be empty");
    } else if (password.toString().isEmpty) {
      customFlutterToast("Password can't be empty");
    } else if (cPassword.toString().isEmpty) {
      customFlutterToast("confirm password can't be empty");
    } else if (password != cPassword) {
      customFlutterToast("confirm password doesn't match");
    } else {
      var r = await ApiCalling().Register_user(
          name, mobileNo, email, whoIntroduce, password, cPassword);
      if (r['status'].toString() == "true") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Otp_page(
              mobile: mobileNo.toString(),
              fromPage: "RegisterPage",
            ),
          ),
        );
      } else {
        customFlutterToast(
          r["message"].toString(),
        );
      }
    }
  }
}

import 'package:club_npc_registration/Sign_in_Page.dart';
import 'package:club_npc_registration/utils/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'constants/colorConstant.dart';
import 'controller/change_Password_controller.dart';

class Create_new_password extends StatefulWidget {
  var phone;

  Create_new_password({required this.phone, super.key});

  @override
  State<Create_new_password> createState() => _Create_new_passwordState();
}

class _Create_new_passwordState extends State<Create_new_password> {
  TextEditingController newPassword = TextEditingController();
  TextEditingController newConfirmPassword = TextEditingController();

  @override
  void dispose() {
    newPassword.dispose();
    newConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: appThemeColor,
              )),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 4.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 80.w,
                  child: Text(
                    "Create new Password",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                const Text(
                    "Your new password must be different from previous used passwords."),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "New Password",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 1.h,
                ),
                textFieldContainer(newPassword, context, "Enter New Password",
                    Icons.remove_red_eye,null),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  "Confirm Password",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 1.h,
                ),
                textFieldContainer(newConfirmPassword, context,
                    "Enter Confirm Password", Icons.remove_red_eye,null),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  height: 6.h,
                  width: 80.w,
                  child: FloatingActionButton(
                    onPressed: () {
                      change_Password_Controller().change_password_Method(
                          newPassword.text,
                          newConfirmPassword.text,
                          widget.phone,
                          context);
                    },
                    backgroundColor: appThemeColor,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Reset Password",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

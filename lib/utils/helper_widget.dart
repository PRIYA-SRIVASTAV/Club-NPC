import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import '../constants/colorConstant.dart';

TextEditingController enter_otp = TextEditingController();

Widget textFieldContainer(controller, context, text, icons,keyboardType) {
  return TextFormField(
    onChanged: (value) {},keyboardType: keyboardType,
    onTap: () {},
    maxLength: 10,
    controller: controller,
    cursorColor: appThemeColor,
    decoration: InputDecoration(counterText: "",
      suffixIcon: Icon(icons, color: appThemeColor),
      hintText: text,
      hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: appThemeColor, width: 0.5.w),
        borderRadius: BorderRadius.circular(30),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}


Widget profileListLeadingContainer(icon, context) {
  return Container(
      height:5.h,
      width: 5.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: appThemeColor,
      ),
      child: icon);
}

Widget profileListTrailingContainer(icon, context) {
  return Container(
      width: 5.h,
      height:5.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: icon);
}

Future customFlutterToast(msg) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: appThemeColor,
    textColor: Colors.white,
    fontSize: 16.sp,
  );
}

Widget edit_Profile_Page_Container(){
  return Column(
    children: [
      Container(
        height: 20.h,
        width: double.infinity,
        color: appThemeColor,
      ),
      Container(
        color: Colors.white,
        height: 10.h,
        width: double.infinity,
      ),
    ],
  );
}


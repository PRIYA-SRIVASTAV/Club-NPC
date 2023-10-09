import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import '../constants/colorConstant.dart';

TextEditingController enter_otp = TextEditingController();

Widget textFieldContainer(controller, context, text, icons) {
  return TextFormField(
    onChanged: (value) {
      // setState(() {
      //   textValue = value;
      // });
    },
    onTap: () {},
    controller: controller,
    cursorColor: appThemeColor,
    decoration: InputDecoration(
      suffixIcon: Icon(icons, color: appThemeColor),
      hintText: text,
      hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
      // label: Text(
      //   text,
      //   style: textFieldTitleStyle,
      // ),
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

Widget openProfilePhoto(context) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    child: Stack(
      children: [
        CircleAvatar(
          radius: 20.h,
          backgroundImage: const AssetImage('assets/images/3135715.png'),
        ),
        Positioned(
          right: 2.h,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                key: Key('closeIconKey'),
                radius: 15,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
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


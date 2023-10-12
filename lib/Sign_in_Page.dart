import 'package:club_npc_registration/utils/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'Forgot_Password.dart';
import 'Register_page.dart';
import 'constants/colorConstant.dart';
import 'controller/SignIn_Controller.dart';

class Sign_in_Page extends StatefulWidget {
  const Sign_in_Page({super.key});

  @override
  State<Sign_in_Page> createState() => _Sign_in_PageState();
}

class _Sign_in_PageState extends State<Sign_in_Page> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   leading: InkWell(
        //       onTap: () {
        //         Navigator.pop(context);
        //       },
        //       child: Icon(
        //         Icons.arrow_back_ios_new,
        //         color: appThemeColor,
        //       )),
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 20.h,
                    width: 50.w,
                    child: Image.asset(
                        'assets/images/download-removebg-preview.png'),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  width: 80.w,
                  child: Center(
                    child: Text(
                      "LOGIN TO NPC PORTAL",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.sp),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Phone number",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                textFieldContainer(phoneController, context,
                    "Enter Your Phone no.", Icons.call, TextInputType.phone),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Password",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextField(
                  controller: PasswordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: appThemeColor,
                      onPressed: _togglePasswordVisibility,
                    ),
                    hintText: "Enter your Password",
                    hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: appThemeColor, width: 0.5.w),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Forgot_Password()),
                    );
                  },
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 6.h,
                  width: 80.w,
                  child: FloatingActionButton(
                    onPressed: () {
                      SignIn_Controller().signIn_Method(phoneController.text,
                          PasswordController.text, context);
                    },
                    backgroundColor: appThemeColor,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Register_Page(),
                        ),
                      );
                    },
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(text: "Don't have an account?"),
                          TextSpan(
                            text: ' Register',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
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

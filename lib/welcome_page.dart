import 'package:club_npc_registration/Register_page.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'Sign_in_Page.dart';
import 'constants/colorConstant.dart';

class welcome_page extends StatefulWidget {
  const welcome_page({super.key});

  @override
  State<welcome_page> createState() => _welcome_pageState();
}

class _welcome_pageState extends State<welcome_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 5.h),
            child: Column(
              children: [
                SizedBox(
                  height: 25.h,
                  width: 40.h,
                  child: Image.asset(
                    'assets/images/Group 9.png',
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 10.h,
                      width: 10.h,
                      child: Image.asset(
                        'assets/images/download-removebg-preview.png',
                      ),
                    ),
                    SizedBox(
                      width: 2.h,
                    ),
                    Text(
                      "Club NPC",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                SizedBox(
                  width: 50.h,
                  child: Text(
                    "Anyone, Anywhere, Anytime \ncan connect at one place",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  width: 50.h,
                  child: Text(
                    "The club is built on 10 significant pillars of construction industry with Architects, Interior Designer, Builders, Engineers, Consultants, Contractors, Artists, Visualizers, Suppliers and Manufacturers., bringing them together and help them by providing platform to share their knowledge and experiences with each other.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                SizedBox(
                  height: 6.h,
                  width: 80.w,
                  child: FloatingActionButton(
                    heroTag: 1,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Sign_in_Page()),
                      );
                      // SignIn_Controller().SignINMethod(EmailController.text,
                      //     PasswordController.text, context);
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
                SizedBox(
                  height: 6.h,
                  width: 80.w,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register_Page()),
                      );
                      // SignIn_Controller().SignINMethod(EmailController.text,
                      //     PasswordController.text, context);
                    },
                    backgroundColor: Colors.white,
                    shape: OutlineInputBorder(
                      //borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 16.sp, color: appThemeColor),
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

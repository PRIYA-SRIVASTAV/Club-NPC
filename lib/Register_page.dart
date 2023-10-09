import 'package:club_npc_registration/constants/colorConstant.dart';
import 'package:club_npc_registration/utils/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'constants/StringConstant.dart';
import 'controller/Register_controller.dart';

class Register_Page extends StatefulWidget {
  const Register_Page({super.key});

  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  TextEditingController enterPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController enterName = TextEditingController();
  TextEditingController enterEmail = TextEditingController();
  TextEditingController enterMobile = TextEditingController();
  TextEditingController whoIntroduced = TextEditingController();

  bool ApiCalled = false;
  @override
  void dispose() {
    enterName.dispose();
    enterEmail.dispose();
    enterMobile.dispose();
    whoIntroduced.dispose();
    confirmPassword.dispose();
    enterPassword.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                registerToNpc,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: appThemeColor),
              ),
              const Divider(
                color: Colors.grey,
              )
            ],
          ),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: enterName,
                  decoration: InputDecoration(
                    // suffixIcon: Icon(Icons.drive_file_rename_outline,
                    //     color: appThemeColor),
                    hintText: 'Enter Your Name',
                    hintStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: appThemeColor, width: 0.5.w),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Email",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: enterEmail,
                  decoration: InputDecoration(
                    // suffixIcon: Icon(Icons.email, color: appThemeColor),
                    hintText: 'Enter Your Email',
                    hintStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: appThemeColor, width: 0.5.w),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Password",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: enterPassword,
                  decoration: InputDecoration(
                    suffixIcon:
                        Icon(Icons.remove_red_eye, color: appThemeColor),
                    hintText: 'Enter Password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: appThemeColor, width: 0.5.w),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Confirm Password",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: confirmPassword,
                  decoration: InputDecoration(
                    suffixIcon:
                        Icon(Icons.remove_red_eye, color: appThemeColor),
                    hintText: 'Enter confirm Password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: appThemeColor, width: 0.5.w),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Mobile No.",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: enterMobile,
                  maxLength: 10,
                  decoration: InputDecoration(
                    counterText: "",
                    prefixText: "+91",
                    //suffixIcon: Icon(Icons.call, color: appThemeColor),
                    hintText: 'Enter 10 Digit mobile no.',
                    hintStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: appThemeColor, width: 0.5.w),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Who introduced you to club :",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: whoIntroduced,
                  decoration: InputDecoration(
                    //suffixIcon: Icon(Icons.person, color: appThemeColor),
                    hintText: "Enter Name",
                    hintStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: appThemeColor, width: 0.5.w),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
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
                      setState(() {
                        ApiCalled = true;
                      });
                      RegisterController()
                          .registerMethod(
                              enterName.text,
                              enterMobile.text,
                              enterEmail.text,
                              whoIntroduced.text,
                              confirmPassword.text,
                              enterPassword.text,
                              context)
                          .whenComplete(() => setState(
                                () {
                                  ApiCalled = false;
                                },
                              ));
                    },
                    backgroundColor: appThemeColor,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ApiCalled
                        ? const CircularProgressIndicator()
                        : const Text("Save"),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: [
                          const TextSpan(text: "Already have an account?"),
                          TextSpan(
                            text: ' Sign In Here',
                            style: TextStyle(
                                color: appThemeColor,
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

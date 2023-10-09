import 'package:club_npc_registration/controller/Register_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'constants/colorConstant.dart';
import 'controller/forget_password_controller.dart';

class Otp_page extends StatefulWidget {
  var emailID;
  var fromPage;

  Otp_page({required this.fromPage, required this.emailID, super.key});

  @override
  State<Otp_page> createState() => _Otp_pageState();
}

class _Otp_pageState extends State<Otp_page> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _otpController;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(6, (index) => FocusNode());
    _otpController = List.generate(6, (index) => TextEditingController());
  }

  bool CalledApi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                  width: 100.w,
                  child: Image.asset('assets/images/Group 10.png'),
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  width: 80.w,
                  child: Text(
                    "OTP Verification",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                const Text("We have send the OTP to your Email."),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    6,
                    (index) {
                      return SizedBox(
                        width: 12.w,
                        height: 12.w,
                        child: TextField(
                          controller: _otpController[index],
                          focusNode: _focusNodes[index],
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          onChanged: (value) {
                            if (value.length == 1 && index < 5) {
                              _focusNodes[index + 1].requestFocus();
                            } else if (value.isEmpty && index > 0) {
                              _focusNodes[index - 1].requestFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16.sp),
                          decoration: const InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      );
                    },
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
                        CalledApi == true;
                      });
                      var otp = _otpController[0].text.toString() +
                          _otpController[1].text.toString() +
                          _otpController[2].text.toString() +
                          _otpController[3].text.toString() +
                          _otpController[4].text.toString() +
                          _otpController[5].text.toString();

                      RegisterOtpController()
                          .registerOtpMethod(
                              widget.emailID, otp, context, widget.fromPage)
                          .whenComplete(() => setState(
                                () {
                                  CalledApi = false;
                                },
                              ));
                    },
                    backgroundColor: appThemeColor,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: CalledApi
                        ? const CircularProgressIndicator()
                        : Text(
                            "Verify",
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const Sign_Up_Page(),
                      //   ),
                      // );
                    },
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(text: "Don't Received Code?"),
                          TextSpan(
                            text: ' Resend',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 2.h,
                // ),
                // InkWell(
                //   onTap: () {
                //     // Navigator.push(
                //     //   context,
                //     //   MaterialPageRoute(
                //     //       builder: (context) =>
                //     //       const AdminLoginPage()),
                //     // );
                //   },
                //   child: RichText(
                //     text:  TextSpan(
                //       style: const TextStyle(color: Colors.black),
                //       children: [
                //         const TextSpan(text: 'Forgot your password ?'),
                //         TextSpan(
                //           text: ' Recover Password',
                //           style: TextStyle(
                //               color: appThemeColor,
                //               fontWeight: FontWeight.bold),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 5.h,
                // ),
                // SizedBox(
                //   height: 5.h,
                //   width: 50.w,
                //   child: FloatingActionButton(
                //     onPressed: () {
                //       // SignIn_Controller().SignINMethod(EmailController.text,
                //       //     PasswordController.text, context);
                //     },
                //     backgroundColor: appThemeColor,
                //     shape: OutlineInputBorder(
                //       borderSide: BorderSide.none,
                //       borderRadius: BorderRadius.circular(5),
                //     ),
                //     child: Text(
                //       "Sign In",
                //       style: TextStyle(fontSize: 20.sp),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 2.h,
                // ),
              ],
            ),
          ),
        ));
  }
}

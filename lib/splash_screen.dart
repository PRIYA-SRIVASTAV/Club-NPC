import 'dart:async';
import 'package:club_npc_registration/Dashboard_Page.dart';
import 'package:club_npc_registration/utils/helper_Methods.dart';
import 'package:club_npc_registration/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'constants/StringConstant.dart';
import 'constants/TextStyleConstant.dart';
import 'constants/prefs_contants.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {

  @override
  void initState() {
    checkingUserStatus();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
              width: 50.w,
              child: Image.asset(
                  'assets/images/download-removebg-preview.png',
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              appTitle,
              style: appTitleStyle,
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Text(
              appSubTitle,
              style: appSubTitleStyle,
            ),
          ],
        ),
      ),
    );
  }

  void checkingUserStatus() async{
    var ID;
    await getPref().then((value) {
      ID = value.getString(KEYID);
    });

    if(ID!=null){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Home_Page(),
        ),
      );
    }else{
      Timer(
          const Duration(seconds: 5),
              () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const welcome_page(),
              ),
            );
          }
      );
    }


  }
}

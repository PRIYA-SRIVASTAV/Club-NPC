import 'package:club_npc_registration/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'constants/colorConstant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Clover Leaf',
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                toolbarHeight:70,
              ),
              primaryColor: appThemeColor),
          home: const splash_screen(),
        );
      },
    );
  }
}

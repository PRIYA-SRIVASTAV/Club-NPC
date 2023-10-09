import 'package:club_npc_registration/Dashboard_Page.dart';
import 'package:club_npc_registration/Settings_Page.dart';
import 'package:club_npc_registration/Sign_in_Page.dart';
import 'package:club_npc_registration/utils/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'constants/StringConstant.dart';
import 'constants/TextStyleConstant.dart';
import 'constants/colorConstant.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  // late ProfilePageModel data;

  // bool isloaded = false;

  // @override
  // void initState() {
  //   fetch();
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // SizedBox(
          //   height: 40.h,
          //   child: DrawerHeader(
          //       decoration: const BoxDecoration(
          //         color: Colors.white,
          //       ),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children:  [
          //
          //           // Text(
          //           //   'CLUB NPC',
          //           //   style: TextStyle(
          //           //     color: Colors.white,
          //           //     fontSize: 24,
          //           //   ),
          //           // ),
          //         ],
          //       )),
          // ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Center(
                  child: SizedBox(
                    height: 20.h,
                    width: 50.h,
                    child: Image.asset(
                      'assets/images/download-removebg-preview.png',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                "CLUB NPC PORTAL",
                style: appTitleStyle,
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                appSubTitle,
                style: appSubTitleStyle,
              ),
              SizedBox(
                height: 5.h,
              ),
              ListTile(
                leading: profileListLeadingContainer(
                    Icon(
                      Icons.dashboard_outlined,
                      color: Colors.white,
                      size: 22.sp,
                    ),
                    context),
                title: Text(
                  "Dashboard",
                  style: profileOptionsStyle,
                ),
                trailing: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Home_Page()),
                    );
                  },
                  child: profileListTrailingContainer(
                      Icon(
                        Icons.arrow_forward_ios,
                        color: appThemeColor,
                      ),
                      context),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              ListTile(
                leading: profileListLeadingContainer(
                    Icon(
                      Icons.settings_suggest_outlined,
                      color: Colors.white,
                      size: 22.sp,
                    ),
                    context),
                title: Text(
                  "Settings",
                  style: profileOptionsStyle,
                ),
                trailing: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Settings_Page()),
                    );
                  },
                  child: profileListTrailingContainer(
                      Icon(
                        Icons.arrow_forward_ios,
                        color: appThemeColor,
                      ),
                      context),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              ListTile(
                leading: profileListLeadingContainer(
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 22.sp,
                    ),
                    context),
                title: Text(
                  "Logout",
                  style: profileOptionsStyle,
                ),
                trailing: InkWell(
                  onTap: () async {
                    var pref = await SharedPreferences.getInstance();
                    await pref.clear();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const Sign_in_Page()),
                        (route) => false);
                  },
                  child: profileListTrailingContainer(
                      Icon(
                        Icons.arrow_forward_ios,
                        color: appThemeColor,
                      ),
                      context),
                ),
              ),
              // Row(
              //   children: [
              //     Icon(
              //       Icons.person_outline_sharp,
              //       color: appThemeColor,
              //     ),
              //     SizedBox(
              //       width: 10.h,
              //     ),
              //     // Text(
              //     //   "${data.firstName} ${data.lastName}",
              //     //   style: TextStyle(
              //     //       color: Colors.black, fontSize: 18.sp),
              //     // ),
              //   ],
              // ),
              // Row(
              //   children: [
              //     Icon(
              //       Icons.mail_outline_outlined,
              //       color: appThemeColor,
              //     ),
              //     // Text(
              //     //   data.email.toString(),
              //     //   style: TextStyle(
              //     //       color: Colors.black, fontSize: 18.sp),
              //     // ),
              //   ],
              // ),
              // Row(
              //   children: [
              //     Icon(
              //       Icons.phone_android,
              //       color: appThemeColor,
              //     ),
              //     // Text(
              //     //  // data.phoneNo.toString(),
              //     //   style: TextStyle(
              //     //       color: Colors.black, fontSize: 18.sp),
              //     // ),
              //   ],
              // ),
            ],
          ),
        ],
      ),
    );
  }

// void fetch() async {
//   data = await ApiCalling().getDetailsOfCurrentUser();
//   setState(() {
//     isloaded = true;
//   });
// }
}

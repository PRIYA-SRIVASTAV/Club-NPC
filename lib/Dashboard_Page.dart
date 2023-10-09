import 'package:club_npc_registration/constants/colorConstant.dart';
import 'package:club_npc_registration/utils/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'controller/Dashboard_controller.dart';
import 'custom_appBar.dart';
import 'model/dashboardPageModel.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  late DashboardPageModel data;
  bool isloaded = false;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: isloaded
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: appThemeColor,
                  elevation: 0.0,
                  leading: Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.menu_open, size: 30.sp),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: 5.w, top: 1.h),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return openProfilePhoto(context);
                            },
                          );
                        },
                        child: Container(
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: data.result.image.isEmpty || data.result.image == null || data.result.image==""
                                  ? Image.asset("assets/images/3135715.png",fit: BoxFit.fill,)
                                  : Image.network(data.result.image,fit: BoxFit.fill,),
                            )),
                        // CircleAvatar(
                        //   radius: 4.h,
                        //   child: Image.network(data.result.image),
                        // ),
                      ),
                    ),
                  ],
                ),
                drawer: const AppDrawer(),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 20.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: appThemeColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(3.h),
                              bottomRight: Radius.circular(3.h),
                            )),
                        child: Padding(
                          padding: EdgeInsets.only(left: 2.h, top: 3.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.result.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.sp,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "VIRTUAL MEMBER",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                "Joining Id : ${data.result.joiningId}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                "About me: ${data.result.profession}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            height: 15.h,
                            width: 40.h,
                            child: Card(
                              elevation: 3,
                              child: Padding(
                                padding: EdgeInsets.only(left: 2.h, top: 4.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Add 10 members to get blue Badge",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    const Text(
                                      "0 Members",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.lightBlueAccent,
                                          fontSize: 30),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            height: 15.h,
                            width: 40.h,
                            child: Card(
                                elevation: 3,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 2.h, top: 4.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "My Referral Link",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                       Text(
                                        "Your Referral Code is: ${data.result.referalId}",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            height: 15.h,
                            width: 40.h,
                            child: Card(
                              elevation: 3,
                              child: Padding(
                                padding: EdgeInsets.only(left: 2.h, top: 4.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "The Last Referral Calculation",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    const Text(
                                      "0 LINK",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            : Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ));
  }

  void fetch() async {
    data = await Dashboard_controller().Dashboard_controller_method();
    if (data.status.toString()=="true") {
      setState(() {
        isloaded = true;
      });
    }
  }
}

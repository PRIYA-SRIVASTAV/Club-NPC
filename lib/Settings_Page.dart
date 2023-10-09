import 'dart:io';
import 'package:club_npc_registration/constants/textFieldConstant.dart';
import 'package:club_npc_registration/controller/settings_controller.dart';
import 'package:club_npc_registration/utils/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'constants/colorConstant.dart';
import 'model/get_settings_data_model.dart';

class Settings_Page extends StatefulWidget {
  const Settings_Page({super.key});

  @override
  State<Settings_Page> createState() => _Settings_PageState();
}

class _Settings_PageState extends State<Settings_Page> {
  TextEditingController Name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController Another_address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController ZipCode = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController firm = TextEditingController();
  TextEditingController profession = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController DOB = TextEditingController();
  TextEditingController Address = TextEditingController();

  File? profileImage;
  var P_image;
  late GetSettingsDataModel data;
  bool isLoadData = false;

  Future getProfileImage(ImageSource source) async {
    try {
      final profileImage = await ImagePicker().pickImage(source: source);
      if (profileImage == null) return;
      final profileImageTemporary = File(profileImage.path);
      setState(() {
        this.profileImage = profileImageTemporary;
        P_image = profileImageTemporary;
      });
    } catch (e) {
      print("Failed to pick image : $e");
    }
  }

  Widget imageWidget() {
    return profileImage == null
        ? Container(
            height: 20.h,
            width: 20.w,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: data.result.image.isEmpty ||
                      data.result.image.toString() == "" ||
                      data.result.image == null
                  ? Image.asset(
                      "assets/images/3135715.png",
                      fit: BoxFit.fill,
                    )
                  : Image.network(
                      data.result.image,
                      fit: BoxFit.fill,
                    ),
            ))
        : Container(
            height: 20.h,
            width: 20.w,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.file(
                profileImage!,
                fit: BoxFit.fill,
              ),
            ),
          );
  }

  @override
  void initState() {
    get_Setting_data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: isLoadData
            ? Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          edit_Profile_Page_Container(),
                          Positioned(
                            top: 8.h,
                            left: 13.h,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 20.h,
                                  width: 40.w,
                                  child: InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return openProfilePhoto(context);
                                          },
                                        );
                                      },
                                      child: imageWidget()),
                                ),
                                Positioned(
                                  bottom: 1.h,
                                  right: 1.w,
                                  child: InkWell(
                                    onTap: () {
                                      getProfileImage(ImageSource.gallery);
                                    },
                                    child: Icon(
                                      Icons.camera_alt_rounded,
                                      color: appThemeColor,
                                      size: 26.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 4.h, right: 4.h, bottom: 4.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "1. Contact Detail",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: appThemeColor),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Name",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              controller: Name,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Mobile No.",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              controller: mobileNo,
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              decoration: InputDecoration(
                                counterText: "",
                                prefixText: "+91",
                                border: UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Address:",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              controller: Address,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Another Address:",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              controller: Another_address,
                              decoration: InputDecoration(
                                suffixIcon: Icon(null, color: appThemeColor),
                                border: UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "City/Town:",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              controller: city,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "State/Province:",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              controller: state,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Zip/Postal Code:",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              controller: ZipCode,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Country:",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              controller: country,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "2. Date Of Birth",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: appThemeColor),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Select Date of birth:",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              controller: DOB,
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime(2100),
                                        helpText: "CHOOSE DATE OF BIRTH",
                                        builder: (context, child) {
                                          return Theme(
                                            data: Theme.of(context).copyWith(
                                              colorScheme: ColorScheme.light(
                                                primary: appThemeColor,
                                                onPrimary: Colors.white,
                                                onSurface: Colors.black,
                                              ),
                                              textButtonTheme:
                                                  TextButtonThemeData(
                                                style: TextButton.styleFrom(
                                                  foregroundColor: Colors
                                                      .green, // button text color
                                                ),
                                              ),
                                            ),
                                            child: child!,
                                          );
                                        },
                                      );
                                      if (pickedDate != null) {
                                        print(pickedDate);
                                        String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);
                                        print(formattedDate);
                                        setState(() {
                                          DOB.text =
                                              formattedDate; //set output date to TextField value.
                                        });
                                      } else {}
                                    },
                                    child: Icon(Icons.calendar_month)),
                                border: UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "3. Your Profession ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: appThemeColor),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Firm/Business:",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              controller: firm,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Your Profession:",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              controller: profession,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 5.h,
                                  width: 35.w,
                                  child: FloatingActionButton(
                                    heroTag: 1,
                                    onPressed: () {
                                      Navigator.pop(context);
                                      // SignIn_Controller().SignINMethod(EmailController.text,
                                      //     PasswordController.text, context);
                                    },
                                    backgroundColor: Colors.white,
                                    shape: OutlineInputBorder(
                                      //borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: appThemeColor),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  height: 5.h,
                                  width: 35.w,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      // var current_img;
                                      // if (P_image == null) {
                                      //   if (data.result.image
                                      //       .toString()
                                      //       .isEmpty) {
                                      //     current_img = "";
                                      //   } else {
                                      //     current_img = data.result.image;
                                      //   }
                                      // } else {
                                      //   current_img = P_image.path;
                                      // }
                                      Setting_Controller()
                                          .setting_profile_data_Method(
                                              context,
                                              P_image,
                                              Name.text,
                                              email.text,
                                              mobileNo.text,
                                              Address.text,
                                              Another_address.text,
                                              city.text,
                                              state.text,
                                              ZipCode.text,
                                              country.text,
                                              DOB.text,
                                              firm.text,
                                              profession.text);
                                    },
                                    backgroundColor: appThemeColor,
                                    shape: OutlineInputBorder(
                                      //borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(
                                          fontSize: 16.sp, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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

  void get_Setting_data() async {
    data = await Setting_Controller().setting_profile_get_data_Method();
    if (data.status.toString() == "true") {
      Name.text = data.result.name;
      email.text = data.result.email;
      mobileNo.text = data.result.mobileNo;
      Address.text = data.result.address;
      Another_address.text = data.result.anotherAddress;
      city.text = data.result.city;
      ZipCode.text = data.result.zipcode;
      state.text = data.result.state;
      country.text = data.result.country;
      DOB.text = data.result.dob;
      firm.text = data.result.firmName;
      profession.text = data.result.profession;
      setState(() {
        isLoadData = true;
      });
    }
  }
}

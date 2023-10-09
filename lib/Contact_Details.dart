import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'constants/StringConstant.dart';
import 'constants/TextStyleConstant.dart';
import 'constants/colorConstant.dart';
import 'controller/Contact_Details_Controller.dart';
import 'controller/Register_controller.dart';

class Contact_Details_Page extends StatefulWidget {
  var email;

  Contact_Details_Page({required this.email, super.key});

  @override
  State<Contact_Details_Page> createState() => _Contact_Details_PageState();
}

class _Contact_Details_PageState extends State<Contact_Details_Page> {
  var address = TextEditingController();
  var anotheraddress = TextEditingController();
  var city = TextEditingController();
  var state = TextEditingController();
  var zip = TextEditingController();
  var country = TextEditingController();
  var dob = TextEditingController();
  var comapnyName = TextEditingController();
  var your_proffession = TextEditingController();

  var are_you_data;
  List areYou = ["Self-Employed", "Employee", "Student"];
  int are_you = -1;
  List termsList = ["yes", "No"];
  int terms = -1;
  var terms_data;
  bool apiCalled = false;

  @override
  void dispose() {
    address.dispose();
    anotheraddress.dispose();
    city.dispose();
    state.dispose();
    zip.dispose();
    country.dispose();
    dob.dispose();
    comapnyName.dispose();
    your_proffession.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Column(
        //     children: [
        //
        //     ],
        //   ),
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
            padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 20.h,
                    width: 50.h,
                    child: Image.asset(
                      'assets/images/download-removebg-preview.png',
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  "Welcome To NPC Portal Back",
                  style: appTitleStyle,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Text(
                  "Successfully verified your profile, Fill Details to start the session.",
                  style: appSubTitleStyle,
                ),
                const Divider(
                  color: Colors.grey,
                ),
                Text(
                  "1. Contact Detail",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: appThemeColor),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Address:",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: address,
                  decoration: InputDecoration(
                    // suffixIcon: Icon(Icons.drive_file_rename_outline,
                    //     color: appThemeColor),
                    hintText: 'Enter Your Address',
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
                  "Another Address:",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: anotheraddress,
                  decoration: InputDecoration(
                    suffixIcon: Icon(null, color: appThemeColor),
                    hintText: 'Enter Another Address',
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
                  "City/Town:",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: city,
                  decoration: InputDecoration(
                    suffixIcon: Icon(null, color: appThemeColor),
                    hintText: 'Enter Your City',
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
                  "State/Province:",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: state,
                  decoration: InputDecoration(
                    //suffixIcon: Icon(Icons.call, color: appThemeColor),
                    hintText: 'Enter Your State',
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
                  "Zip/Postal Code:",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: zip,
                  decoration: InputDecoration(
                    //suffixIcon: Icon(Icons.person, color: appThemeColor),
                    hintText: "Enter Your Zip/Postal Code",
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
                  "Country:",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: country,
                  decoration: InputDecoration(
                    //suffixIcon: Icon(Icons.person, color: appThemeColor),
                    hintText: "Enter Your Country",
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
                SizedBox(height: 2.h,),
                Text(
                  "2. Date O Birth",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: appThemeColor),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Select Date of birth:",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: dob,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: appThemeColor, width: 0.5.w),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'yyyy-MM-dd',
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
                              dob.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {}
                        },
                        child: Icon(Icons.calendar_month)),
                    //border: UnderlineInputBorder(),
                  ),
                ),
                // TextFormField(
                //   controller: dob,
                //   decoration: InputDecoration(
                //     //suffixIcon: Icon(Icons.person, color: appThemeColor),
                //     hintText: "dd/mm/yyyy",
                //     hintStyle: const TextStyle(color: Colors.grey),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide:
                //           BorderSide(color: appThemeColor, width: 0.5.w),
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "3. Are you ? ",
                  style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: appThemeColor),),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, i) {
                      return ListTile(
                        onTap: () {
                          setState(() {
                            are_you = i;
                            are_you_data = areYou[i].toString();
                          });
                        },
                        visualDensity:
                            const VisualDensity(vertical: -3, horizontal: -3),
                        leading: are_you == i
                            ? Icon(
                                Icons.check_box,
                                color: appThemeColor,
                              )
                            : const Icon(Icons.check_box_outline_blank),
                        title: Text(
                          areYou[i].toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                      );
                    },
                    itemCount: 3),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "4. Your Profession ",
                  style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: appThemeColor),),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Firm/Business:",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: comapnyName,
                  decoration: InputDecoration(
                    //suffixIcon: Icon(Icons.person, color: appThemeColor),
                    hintText: "Enter Your Company Name",
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
                  "Your Profession:",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: your_proffession,
                  decoration: InputDecoration(
                    //suffixIcon: Icon(Icons.person, color: appThemeColor),
                    hintText: "Enter Your Profession",
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
                  "5. It is important for you to agree all our terms before we give you membership.",
                  style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: appThemeColor),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, i) {
                      return ListTile(
                        onTap: () {
                          setState(
                            () {
                              terms = i;
                              terms_data = termsList[i].toString();
                            },
                          );
                        },
                        visualDensity:
                            const VisualDensity(vertical: -3, horizontal: -3),
                        leading: terms == i
                            ? Icon(
                                Icons.check_box,
                                color: appThemeColor,
                              )
                            : const Icon(Icons.check_box_outline_blank),
                        title: Text(
                          termsList[i].toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                      );
                    },
                    itemCount: 2),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 6.h,
                  width: 80.w,
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        apiCalled = true;
                      });
                      debugPrint("${are_you_data}");
                      debugPrint("${terms_data}");
                      Contact_Details_Controller()
                          .Contact_Details_Method(
                              address.text,
                              country.text,
                              are_you_data,
                              your_proffession.text,
                              comapnyName.text,
                              city.text,
                              state.text,
                              zip.text,
                              dob.text,
                              terms_data,
                              anotheraddress.text,
                              widget.email,
                              context)
                          .whenComplete(
                            () => setState(
                              () {
                                apiCalled = false;
                              },
                            ),
                          );
                    },
                    backgroundColor: appThemeColor,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: apiCalled
                        ? const CircularProgressIndicator()
                        : const Text("Save"),
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

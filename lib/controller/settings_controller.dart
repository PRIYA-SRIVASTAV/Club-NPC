import 'package:club_npc_registration/core/ApiCall.dart';
import 'package:flutter/material.dart';
import '../constants/prefs_contants.dart';
import '../utils/helper_Methods.dart';
import '../utils/helper_widget.dart';

class Setting_Controller {
  /// setting_post_api
  setting_profile_data_Method(
    context,
    image,
    name,
    email,
    mobileNo,
    address,
    ano_address,
    city,
    state,
    zipCode,
    country,
    DOB,
    firm,
    profession,
  ) async {
    if (name.toString().isEmpty) {
      customFlutterToast("name can not be empty");
    } else if (email.toString().isEmpty) {
      customFlutterToast("email can not be empty");
    } else if (mobileNo.toString().isEmpty) {
      customFlutterToast("Mobile number can not be empty");
    } else if (mobileNo.toString().length != 10) {
      customFlutterToast("Mobile number must be 10 digit");
    } else if (address.toString().isEmpty) {
      customFlutterToast("Address can not be empty");
    } else if (city.toString().isEmpty) {
      customFlutterToast("City can not be empty");
    } else if (state.toString().isEmpty) {
      customFlutterToast("State can not be empty");
    } else if (zipCode.toString().isEmpty) {
      customFlutterToast("Zip-code can not be empty");
    } else if (country.toString().isEmpty) {
      customFlutterToast("Country can not be empty");
    } else if (DOB.toString().isEmpty) {
      customFlutterToast("DOB can not be empty");
    } else if (firm.toString().isEmpty) {
      customFlutterToast("Firm can not be empty");
    } else if (profession.toString().isEmpty) {
      customFlutterToast("Profession can not be empty");
    } else {
      var a = await ApiCalling().User_Setting_Post_Api(
          image,
          name,
          email,
          mobileNo,
          address,
          ano_address,
          city,
          state,
          zipCode,
          country,
          DOB,
          firm,
          profession);
      if (a["status"].toString() == "false") {
        customFlutterToast(a["message"].toString());
      } else {
        customFlutterToast(a["message"].toString());
        Navigator.pop(context);
      }
    }
  }

  /// setting get api
  setting_profile_get_data_Method() async {
    var ID;
    await getPref().then((value) {
      ID = value.getString(KEYID);
    });
    var a = await ApiCalling().getSettingsData(ID);
    return a;
  }
}

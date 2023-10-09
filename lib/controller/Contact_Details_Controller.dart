import 'package:club_npc_registration/utils/helper_widget.dart';
import 'package:flutter/material.dart';
import '../../core/ApiCall.dart';
import '../Dashboard_Page.dart';

class Contact_Details_Controller {
  Future Contact_Details_Method(
      address,
      country,
      are_you_a,
      profession,
      company_name,
      city,
      state,
      zip_code,
      dob,
      terms,
      another_address,
      email,
      context) async {
    debugPrint("address-------------- ${address}");
    debugPrint("country-------------${country}");
    debugPrint("are you a-------------${are_you_a}");
    debugPrint("profession-------------${profession}");
    debugPrint("company name-------------${company_name}");
    debugPrint("city-------------${city}");
    debugPrint("state-------------${state}");
    debugPrint("zip code-------------${zip_code}");
    debugPrint("dob-------------${dob}");
    debugPrint("terms-------------${terms}");
    debugPrint("email--------------${email}");
    debugPrint("another_address-------------${another_address}");

    if (address.toString().isEmpty) {
      customFlutterToast("address can't be empty");
    }
    else if (country.toString().isEmpty) {
      customFlutterToast("country can't be empty");
    }
    else if(are_you_a.toString().isEmpty){
      customFlutterToast("please select");
    }
    else if(profession.toString().isEmpty){
      customFlutterToast("profession can't be empty");
    }
    else if(company_name.toString().isEmpty){
      customFlutterToast("company_name can't be empty");
    }
    else if(city.toString().isEmpty){
      customFlutterToast("city can't be empty");
    }
    else if(state.toString().isEmpty){
      customFlutterToast("state can't be empty");
    }
    else if (zip_code.toString().isEmpty){
      customFlutterToast("zip_code  can't be empty");
    }
    else if (dob.toString().isEmpty){
      customFlutterToast("dob can't be empty");
    }
    else if (terms.toString().isEmpty){
      customFlutterToast("terms please select");
    }
    else if (another_address.toString().isEmpty){
      customFlutterToast("another_address  can't be empty");
    }
    else {
      var r = await ApiCalling().Contact_Details( address,
        country,
        are_you_a,
        profession,
        company_name,
        city,
        state,
        zip_code,
        dob,
        terms,
          email,
        another_address);

      if (r['status'].toString() == "true") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home_Page()),
        );
      } else {
        customFlutterToast(r["message"].toString());
      }

    }
  }
}

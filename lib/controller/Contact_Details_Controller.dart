import 'package:club_npc_registration/Sign_in_Page.dart';
import 'package:club_npc_registration/utils/helper_widget.dart';
import 'package:flutter/material.dart';
import '../../core/ApiCall.dart';

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
      mobile,
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
    else if (terms==null){
      customFlutterToast("Please select terms");
    }
    else if (another_address.toString().isEmpty){
      customFlutterToast("another_address  can't be empty");
    }
    else if (are_you_a==null){
      customFlutterToast("Please select You are ?");
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
        mobile,
        another_address);

      if (r['status'].toString() == "200") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Sign_in_Page()),
        );
      } else {
        customFlutterToast(r["message"].toString());
      }

    }
  }
}

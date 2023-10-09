import 'dart:convert';
import 'package:club_npc_registration/utils/helper_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constants/prefs_contants.dart';
import '../model/dashboardPageModel.dart';
import '../model/get_settings_data_model.dart';
import '../utils/helper_Methods.dart';
import 'ApiEndpoints.dart';
import 'Results.dart';

class ApiCalling {
  var client = http.Client();

  headerWithoutToken() async {
    Map<String, String> WithoutToken = {
      "Content-Type": "application/json",
    };
    return WithoutToken;
  }

  headerWithToken() async {
    var pref = await getPref();
    String token = "";
    if (pref.getString(keyToken) != null) token = pref.getString(keyToken);
    Map<String, String> headerToken = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    return headerToken;
  }

  /// ===============================================post Apis=================================================================
  /// for Register

  Future Register_user(String name, String mobileNo, String email,
      String whoIntroduce, String password, String cPassword) async {
    if (await isConnectedToInternet()) {
      try {
        Uri registerUserUri = Uri.parse(ApiEndpoints.registerUser);
        var map = {
          "name": name,
          "mobile_no": mobileNo,
          "email": email,
          "who_introduce": whoIntroduce,
          "password": password,
          "cpassword": cPassword
        };
        var registerUserResponse =
            await client.post(registerUserUri, body: map);
        MYAPILOGS("RegisterUser", registerUserResponse);

        if (registerUserResponse.statusCode == 200) {
          return jsonDecode(registerUserResponse.body);
        } else {
          customFlutterToast(
              jsonDecode(registerUserResponse.body)['message'].toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  /// OTP for registration

  Future Register_OTP_user(emailID, OTP) async {
    if (await isConnectedToInternet()) {
      try {
        Uri registerUserUri = Uri.parse(ApiEndpoints.OTP_register_User);
        var map = Map<String, dynamic>();
        map['email'] = emailID.toString();
        map['otp'] = OTP;
        var registerUserOTPResponse =
            await client.post(registerUserUri, body: map);
        MYAPILOGS("RegisterOTPUser", registerUserOTPResponse);
        if (registerUserOTPResponse.statusCode == 200) {
          return jsonDecode(registerUserOTPResponse.body);
        } else {
          return customFlutterToast(
              jsonDecode(registerUserOTPResponse.body)['message']);
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  /// for Login

  Future Login_user(email, password) async {
    if (await isConnectedToInternet()) {
      try {
        Uri registerUserUri = Uri.parse(ApiEndpoints.signInUser);
        var map = Map<String, dynamic>();
        map['email'] = email;
        map['password'] = password;

        var Login_User_Response = await client.post(registerUserUri, body: map);
        MYAPILOGS("Login_User", Login_User_Response);
        if (Login_User_Response.statusCode == 200) {
          return jsonDecode(Login_User_Response.body);
        } else {
          customFlutterToast(
              "${jsonDecode(Login_User_Response.body)['message']}");
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  /// api for extra details.

  Future Contact_Details(
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
    email,
    another_address,
  ) async {
    if (await isConnectedToInternet()) {
      try {
        Uri contact_details = Uri.parse(ApiEndpoints.ContactDetails);
        var map = {
          "address": address,
          "another_address": another_address,
          "country": country,
          "are_you_a": are_you_a,
          "profession": profession,
          "company_name": company_name,
          "city": city,
          "state": state,
          "zip_code": zip_code,
          "dob": dob,
          "email": email,
          "terms": terms,
        };
        var contact_details_api_Response =
            await client.post(contact_details, body: map);

        MYAPILOGS("RegisterUser", contact_details_api_Response);
        if (contact_details_api_Response.statusCode == 200) {
          return jsonDecode(contact_details_api_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(contact_details_api_Response.body)['message']
                  .toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  /// api for forget password

  Future forget_Password(email) async {
    if (await isConnectedToInternet()) {
      try {
        Uri forget_Password_Uri = Uri.parse(ApiEndpoints.forgotPassword);
        var map = Map<String, dynamic>();
        map['email'] = email;

        var forget_password_Response =
            await client.post(forget_Password_Uri, body: map);
        MYAPILOGS("forget password", forget_password_Response);
        if (forget_password_Response.statusCode == 200) {
          return jsonDecode(forget_password_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(forget_password_Response.body)['message'].toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  Future change_password(newPassword, confirmPassword, email) async {
    if (await isConnectedToInternet()) {
      try {
        Uri change_Password_Uri = Uri.parse(ApiEndpoints.changePassword);
        var map = Map<String, dynamic>();
        map['password'] = newPassword;
        map['cpassword'] = confirmPassword;
        map['email'] = email;

        var change_password_Response =
            await client.post(change_Password_Uri, body: map);
        MYAPILOGS("forget password", change_password_Response);
        if (change_password_Response.statusCode == 200) {
          return jsonDecode(change_password_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(change_password_Response.body)['message'].toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  /// ===============================================get Apis=================================================================
  Future getDetailsOfCurrentUser(id) async {
    try {
      if (await isConnectedToInternet()) {
        Uri getCurrentUserData = Uri.parse("${ApiEndpoints.dashboardData}$id");

        var getDetailsOfCurrentUserResponse =
            await client.get(getCurrentUserData);
        MYAPILOGS(
            "getDetailsOfCurrentUserResponse", getDetailsOfCurrentUserResponse);
        if (getDetailsOfCurrentUserResponse.statusCode == 200) {
          return dashboardPageModelFromJson(
              getDetailsOfCurrentUserResponse.body);
        } else {
          Results.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }
  Future getSettingsData(id) async {
    try {
      if (await isConnectedToInternet()) {
        Uri getSettingsData = Uri.parse("${ApiEndpoints.SettingGetApi}$id");

        var getSettingsDataResponse =
        await client.get(getSettingsData);
        MYAPILOGS(
            "get Settings data", getSettingsDataResponse);
        if (getSettingsDataResponse.statusCode == 200) {
          return getSettingsDataModelFromJson(
              getSettingsDataResponse.body);
        } else {
          Results.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }


  /// multipart api
  Future User_Setting_Post_Api(image, name, email, mobileNo, address,
      ano_address, city, state, zipCode, country, DOB, firm, profession) async {
    try {
      Uri User_setting_Uri = Uri.parse(ApiEndpoints.SettingPostApi);
      var body = <String,String>{
        "name" :name,
        "email" :email,
        "address":address,
        "mobile_no":mobileNo,
        "another_address":ano_address,
        "city":city,
        "state":state,
        "zipcode":zipCode,
        "country":country,
        "dob":DOB,
        "profession":profession,
        "company_name":firm
      };
      var request = http.MultipartRequest('POST', User_setting_Uri);
      request.fields.addAll(body);
      if(image!=null){
        request.files.add(await http.MultipartFile.fromPath("image", image.path));
      }

      //debugPrint(image.path.toString());
      // request.headers.addAll({
      //   "Authorization": "Bearer $token",
      // });
      http.StreamedResponse response = await request.send();
      final a = await http.Response.fromStream(response);
      debugPrint("User Settings Post Api Response ====${a.body}");
      if(a.statusCode==200){
        return jsonDecode(a.body);
      }
      else{
        return customFlutterToast(jsonDecode(a.body)["message"].toString());
      }
    } catch (e) {
      print(e);
    }
  }
}

MYAPILOGS(api, response) {
  debugPrint("API Name   $api");
  debugPrint(response.statusCode.toString());
  debugPrint(response.body.toString());
}

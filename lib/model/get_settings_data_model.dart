// To parse this JSON data, do
//
//     final getSettingsDataModel = getSettingsDataModelFromJson(jsonString);

import 'dart:convert';

GetSettingsDataModel getSettingsDataModelFromJson(String str) => GetSettingsDataModel.fromJson(json.decode(str));

String getSettingsDataModelToJson(GetSettingsDataModel data) => json.encode(data.toJson());

class GetSettingsDataModel {
  bool status;
  Data data;
  String message;

  GetSettingsDataModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GetSettingsDataModel.fromJson(Map<String, dynamic> json) => GetSettingsDataModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  int id;
  String joinid;
  int role;
  String image;
  String nameinput;
  String name;
  String companyName;
  String accountEmail;
  String pwd;
  String accountMobile;
  String accountAddress;
  String otherAddress;
  String accountCity;
  String accountState;
  String accountZipcode;
  String countryName;
  DateTime dob;
  String clubName;
  String clubOption;
  String clubProfession;
  String clubConcept;
  String clubTerms;
  String link;
  String refNo;
  DateTime createdAt;
  String clubtype;
  String status;
  String location;
  String firmName;
  String userstatus;
  int otp;
  DateTime updatedAt;
  String whoIntroduce;
  String forgetOtp;
  int isEnable;

  Data({
    required this.id,
    required this.joinid,
    required this.role,
    required this.image,
    required this.nameinput,
    required this.name,
    required this.companyName,
    required this.accountEmail,
    required this.pwd,
    required this.accountMobile,
    required this.accountAddress,
    required this.otherAddress,
    required this.accountCity,
    required this.accountState,
    required this.accountZipcode,
    required this.countryName,
    required this.dob,
    required this.clubName,
    required this.clubOption,
    required this.clubProfession,
    required this.clubConcept,
    required this.clubTerms,
    required this.link,
    required this.refNo,
    required this.createdAt,
    required this.clubtype,
    required this.status,
    required this.location,
    required this.firmName,
    required this.userstatus,
    required this.otp,
    required this.updatedAt,
    required this.whoIntroduce,
    required this.forgetOtp,
    required this.isEnable,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    joinid: json["joinid"],
    role: json["role"],
    image: json["image"],
    nameinput: json["nameinput"],
    name: json["name"],
    companyName: json["company_name"],
    accountEmail: json["account_email"],
    pwd: json["pwd"],
    accountMobile: json["account_mobile"],
    accountAddress: json["account_address"],
    otherAddress: json["other_address"],
    accountCity: json["account_city"],
    accountState: json["account_state"],
    accountZipcode: json["account_zipcode"],
    countryName: json["country_name"],
    dob: DateTime.parse(json["DOB"]),
    clubName: json["club_name"],
    clubOption: json["club_option"],
    clubProfession: json["club_profession"],
    clubConcept: json["club_concept"],
    clubTerms: json["club_terms"],
    link: json["link"],
    refNo: json["refNo"],
    createdAt: DateTime.parse(json["created_at"]),
    clubtype: json["clubtype"],
    status: json["status"],
    location: json["location"],
    firmName: json["firm_name"],
    userstatus: json["userstatus"],
    otp: json["otp"],
    updatedAt: DateTime.parse(json["updated_at"]),
    whoIntroduce: json["who_introduce"],
    forgetOtp: json["forget_otp"],
    isEnable: json["is_enable"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "joinid": joinid,
    "role": role,
    "image": image,
    "nameinput": nameinput,
    "name": name,
    "company_name": companyName,
    "account_email": accountEmail,
    "pwd": pwd,
    "account_mobile": accountMobile,
    "account_address": accountAddress,
    "other_address": otherAddress,
    "account_city": accountCity,
    "account_state": accountState,
    "account_zipcode": accountZipcode,
    "country_name": countryName,
    "DOB": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "club_name": clubName,
    "club_option": clubOption,
    "club_profession": clubProfession,
    "club_concept": clubConcept,
    "club_terms": clubTerms,
    "link": link,
    "refNo": refNo,
    "created_at": createdAt.toIso8601String(),
    "clubtype": clubtype,
    "status": status,
    "location": location,
    "firm_name": firmName,
    "userstatus": userstatus,
    "otp": otp,
    "updated_at": updatedAt.toIso8601String(),
    "who_introduce": whoIntroduce,
    "forget_otp": forgetOtp,
    "is_enable": isEnable,
  };
}

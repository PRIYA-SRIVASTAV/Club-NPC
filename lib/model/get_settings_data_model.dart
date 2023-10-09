import 'dart:convert';

GetSettingsDataModel getSettingsDataModelFromJson(String str) => GetSettingsDataModel.fromJson(json.decode(str));

String getSettingsDataModelToJson(GetSettingsDataModel data) => json.encode(data.toJson());

class GetSettingsDataModel {
  bool status;
  Result result;
  String msg;

  GetSettingsDataModel({
    required this.status,
    required this.result,
    required this.msg,
  });

  factory GetSettingsDataModel.fromJson(Map<String, dynamic> json) => GetSettingsDataModel(
    status: json["status"],
    result: Result.fromJson(json["result"]),
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": result.toJson(),
    "msg": msg,
  };
}

class Result {
  String name;
  String email;
  String mobileNo;
  String address;
  String anotherAddress;
  String city;
  String state;
  String zipcode;
  String country;
  String dob;
  String profession;
  String firmName;
  String image;

  Result({
    required this.name,
    required this.email,
    required this.mobileNo,
    required this.address,
    required this.anotherAddress,
    required this.city,
    required this.state,
    required this.zipcode,
    required this.country,
    required this.dob,
    required this.profession,
    required this.firmName,
    required this.image,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    name: json["name"],
    email: json["email"],
    mobileNo: json["mobile_no"],
    address: json["address"],
    anotherAddress: json["another_address"],
    city: json["city"],
    state: json["state"],
    zipcode: json["zipcode"],
    country: json["country"],
    dob: json["dob"],
    profession: json["profession"],
    firmName: json["firm_name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "mobile_no": mobileNo,
    "address": address,
    "another_address": anotherAddress,
    "city": city,
    "state": state,
    "zipcode": zipcode,
    "country": country,
    "dob": dob,
    "profession": profession,
    "firm_name": firmName,
    "image": image,
  };
}

import 'dart:convert';

DashboardPageModel dashboardPageModelFromJson(String str) => DashboardPageModel.fromJson(json.decode(str));

String dashboardPageModelToJson(DashboardPageModel data) => json.encode(data.toJson());

class DashboardPageModel {
  bool status;
  Result result;
  String msg;

  DashboardPageModel({
    required this.status,
    required this.result,
    required this.msg,
  });

  factory DashboardPageModel.fromJson(Map<String, dynamic> json) => DashboardPageModel(
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
  String joiningId;
  String referalId;
  String profession;
  String userType;
  String image;

  Result({
    required this.name,
    required this.joiningId,
    required this.referalId,
    required this.profession,
    required this.userType,
    required this.image,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    name: json["name"],
    joiningId: json["joining_id"],
    referalId: json["referal_id"],
    profession: json["profession"],
    userType: json["user_type"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "joining_id": joiningId,
    "referal_id": referalId,
    "profession": profession,
    "user_type": userType,
    "image": image,
  };
}

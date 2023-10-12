import 'dart:convert';

DashboardPageModel dashboardPageModelFromJson(String str) => DashboardPageModel.fromJson(json.decode(str));

String dashboardPageModelToJson(DashboardPageModel data) => json.encode(data.toJson());

class DashboardPageModel {
  int status;
  Data data;
  String message;

  DashboardPageModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory DashboardPageModel.fromJson(Map<String, dynamic> json) => DashboardPageModel(
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
  String name;
  String joiningId;
  String referalId;
  String profession;
  int userType;
  String image;

  Data({
    required this.name,
    required this.joiningId,
    required this.referalId,
    required this.profession,
    required this.userType,
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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

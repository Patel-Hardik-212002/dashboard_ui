// To parse this JSON data, do
//
//     final modelUser = modelUserFromJson(jsonString);

import 'dart:convert';

List<ModelUser> modelUserFromJson(String str) => List<ModelUser>.from(json.decode(str).map((x) => ModelUser.fromJson(x)));

String modelUserToJson(List<ModelUser> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelUser {
  ModelUser({
    this.userId,
    this.name,
    this.mobile,
    this.email,
    this.profilePhoto,
    this.otp,
    this.level,
    this.referalCode,
    this.referCode,
  });

  String? userId;
  String? name;
  String? mobile;
  String? email;
  dynamic? profilePhoto;
  String? otp;
  String? level;
  String? referalCode;
  String? referCode;

  factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
    userId: json["user_id"],
    name: json["name"] == null ? null : json["name"],
    mobile: json["mobile"],
    email: json["email"] == null ? null : json["email"],
    profilePhoto: json["profile_photo"],
    otp: json["otp"],
    level: json["level"],
    referalCode: json["referal_code"] == null ? null : json["referal_code"],
    referCode: json["refer_code"] == null ? null : json["refer_code"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "name": name == null ? null : name,
    "mobile": mobile,
    "email": email == null ? null : email,
    "profile_photo": profilePhoto,
    "otp": otp,
    "level": level,
    "referal_code": referalCode == null ? null : referalCode,
    "refer_code": referCode == null ? null : referCode,
  };

  fromJson(Map<String, dynamic> e) {}
}

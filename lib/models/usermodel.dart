// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  String name;
  String email;
  String pic;

  UserModel({
    required this.name,
    required this.email,
    required this.pic,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        pic: json["pic"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "pic": pic,
      };
}

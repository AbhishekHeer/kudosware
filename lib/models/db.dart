// To parse this JSON data, do
//
//     final dBmodel = dBmodelFromJson(jsonString);

import 'dart:convert';

List<DBmodel> dBmodelFromJson(String str) =>
    List<DBmodel>.from(json.decode(str).map((x) => DBmodel.fromJson(x)));

String dBmodelToJson(List<DBmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DBmodel {
  String uid;
  String name;
  String dob;
  String gender;

  DBmodel({
    required this.uid,
    required this.name,
    required this.dob,
    required this.gender,
  });

  factory DBmodel.fromJson(Map<String, dynamic> json) => DBmodel(
        uid: json['uid'],
        name: json["name"],
        dob: json["DOB"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "DOB": dob,
        "gender": gender,
      };
}

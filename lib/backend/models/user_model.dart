// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.uid,
    this.name,
    this.profileImage,
    this.email,
    this.password,
    this.phoneNumber,
  });

  String? uid;
  String? name;
  String? profileImage;
  String? email;
  String? password;
  String? phoneNumber;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        name: json["name"],
        profileImage: json["profileImage"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "profileImage": profileImage,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
      };
}

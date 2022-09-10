// To parse this JSON data, do
//
//     final blog = blogFromJson(jsonString);

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

BlogModel blogFromJson(String str) => BlogModel.fromJson(json.decode(str));

String blogToJson(BlogModel data) =>
    json.encode(data.toJson(data.blogId.toString()));

class BlogModel {
  BlogModel({
    this.blogId,
    this.adminId,
    this.blogImage,
    this.blogTitle,
    this.blogDescription,
  });

  String? blogId;
  String? adminId;
  String? blogImage;
  String? blogTitle;
  String? blogDescription;

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        blogId: json["blogId"],
        adminId: json["adminId"],
        blogImage: json["blogImage"],
        blogTitle: json["blogTitle"],
        blogDescription: json["blogDescription"],
      );

  Map<String, dynamic> toJson(String id) => {
        "blogId": id,
        "adminId": FirebaseAuth.instance.currentUser!.uid,
        "blogImage": blogImage,
        "blogTitle": blogTitle,
        "blogDescription": blogDescription,
      };
}

// To parse this JSON data, do
//
//     final programModel = programModelFromJson(jsonString);

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

ProgramModel programModelFromJson(String str) =>
    ProgramModel.fromJson(json.decode(str));

String programModelToJson(ProgramModel data) =>
    json.encode(data.toJson(data.programId.toString()));

class ProgramModel {
  ProgramModel({
    this.programId,
    this.adminId,
    this.programImage,
    this.programTitle,
    this.programDescription,
    this.programDate,
  });

  String? programId;
  String? adminId;
  String? programImage;
  String? programTitle;
  String? programDescription;
  String? programDate;

  factory ProgramModel.fromJson(Map<String, dynamic> json) => ProgramModel(
        programId: json["programId"],
        adminId: json["adminId"],
        programImage: json["programImage"],
        programTitle: json["programTitle"],
        programDescription: json["programDescription"],
        programDate: json["programDate"],
      );

  Map<String, dynamic> toJson(String id) => {
        "programId": id,
        "adminId": FirebaseAuth.instance.currentUser!.uid,
        "programImage": programImage,
        "programTitle": programTitle,
        "programDescription": programDescription,
        "programDate": programDate,
      };
}

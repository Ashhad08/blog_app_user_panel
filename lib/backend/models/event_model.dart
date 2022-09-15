// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

EventModel eventModelFromJson(String str) =>
    EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) =>
    json.encode(data.toJson(data.eventId.toString()));

class EventModel {
  EventModel({
    this.eventId,
    this.adminId,
    this.eventTitle,
    this.eventDescription,
    this.eventDate,
    required this.eventGalleryImages,
  });

  String? eventId;
  String? adminId;
  String? eventTitle;
  String? eventDescription;
  Timestamp? eventDate;
  List<String> eventGalleryImages;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        eventId: json["eventId"],
        adminId: json["adminId"],
        eventTitle: json["eventTitle"],
        eventDescription: json["eventDescription"],
        eventDate: json["eventDate"],
        eventGalleryImages:
            List<String>.from(json["eventGalleryImages"].map((x) => x)),
      );

  Map<String, dynamic> toJson(String id) => {
        "eventId": id,
        "adminId": FirebaseAuth.instance.currentUser!.uid,
        "eventTitle": eventTitle,
        "eventDescription": eventDescription,
        "eventDate": eventDate,
        "eventGalleryImages":
            List<dynamic>.from(eventGalleryImages.map((x) => x)),
      };
}

// To parse this JSON data, do
//
//     final chatDetailsModel = chatDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ChatDetailsModel chatDetailsModelFromJson(String str) =>
    ChatDetailsModel.fromJson(json.decode(str));

String chatDetailsModelToJson(ChatDetailsModel data) => json.encode(data.toJson(
    senderID: data.senderId.toString(),
    receiverID: data.receiverId.toString(),
    messageSenderName: data.senderName.toString(),
    messageReceiverName: data.receiverName.toString(),
    messageSenderImage: data.senderImage.toString(),
    messageReceiverImage: data.receiverImage.toString()));

class ChatDetailsModel {
  ChatDetailsModel({
    this.senderId,
    this.receiverId,
    this.senderName,
    this.receiverName,
    this.senderImage,
    this.receiverImage,
    this.recentMessage,
    this.time,
    this.date,
    this.sortTime,
  });

  String? senderId;
  String? receiverId;
  String? senderName;
  String? receiverName;
  String? senderImage;
  String? receiverImage;
  String? recentMessage;
  String? time;
  String? date;
  Timestamp? sortTime;

  factory ChatDetailsModel.fromJson(Map<String, dynamic> json) =>
      ChatDetailsModel(
        senderId: json["senderId"],
        receiverId: json["receiverId"],
        senderName: json["senderName"],
        receiverName: json["receiverName"],
        senderImage: json["senderImage"],
        receiverImage: json["receiverImage"],
        recentMessage: json["recentMessage"],
        time: json["time"],
        date: json["date"],
        sortTime: json["sortTime"],
      );

  Map<String, dynamic> toJson({
    required String senderID,
    required String receiverID,
    required String messageSenderName,
    required String messageReceiverName,
    required String messageSenderImage,
    required String messageReceiverImage,
  }) =>
      {
        "senderId": senderID,
        "receiverId": receiverID,
        "senderName": messageSenderName,
        "receiverName": messageReceiverName,
        "senderImage": messageSenderImage,
        "receiverImage": messageReceiverImage,
        "recentMessage": recentMessage,
        "time": time,
        "date": date,
        "sortTime": DateTime.now(),
      };
}

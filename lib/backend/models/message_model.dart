// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

MessageModel messageModelFromJson(String str) =>
    MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson(
    messageID: data.messageId.toString(),
    senderID: data.senderId.toString(),
    senderImage: data.senderImage.toString(),
    receiverID: data.receiverId.toString()));

class MessageModel {
  MessageModel({
    this.messageId,
    this.senderId,
    this.receiverId,
    this.senderImage,
    this.sortTime,
    this.time,
    this.messageBody,
    this.isRead,
  });

  String? messageId;
  String? senderId;
  String? receiverId;
  String? senderImage;
  var sortTime;
  var time;
  String? messageBody;
  bool? isRead;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
      messageId: json["messageId"],
      senderId: json["senderId"],
      receiverId: json["receiverId"],
      senderImage: json["senderImage"],
      sortTime: json["sortTime"],
      time: json["time"],
      messageBody: json["messageBody"],
      isRead: json["isRead"]);

  Map<String, dynamic> toJson({
    required String messageID,
    required String senderID,
    required String receiverID,
    required String senderImage,
  }) =>
      {
        "messageId": messageID,
        "senderId": senderID,
        "receiverId": receiverID,
        "senderImage": senderImage,
        "sortTime": sortTime,
        "time": time,
        "messageBody": messageBody,
        "isRead": false,
      };
}

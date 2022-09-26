import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/message_details.dart';
import '../models/message_model.dart';

class ChatServices {
  //start new chat
  Future<void> addNewMessage({
    required String senderId,
    required String receiverId,
    required ChatDetailsModel chatDetailsModel,
    required MessageModel messageModel,
  }) async {
    return await FirebaseFirestore.instance
        .collection("chatsCollection")
        .doc(senderId)
        .collection("recentChats")
        .doc(receiverId)
        .set(chatDetailsModel.toJson(
          senderID: senderId,
          receiverID: receiverId,
          messageSenderName: chatDetailsModel.senderName.toString(),
          messageReceiverName: chatDetailsModel.receiverName.toString(),
          messageSenderImage: chatDetailsModel.senderImage.toString(),
          messageReceiverImage: chatDetailsModel.receiverImage.toString(),
        ))
        .then((value) {
          DocumentReference docRef = FirebaseFirestore.instance
              .collection("chatsCollection")
              .doc(senderId)
              .collection("recentChats")
              .doc(receiverId)
              .collection("messages")
              .doc(DateTime.now().toString());
          return docRef.set(messageModel.toJson(
            messageID: docRef.id,
            senderID: senderId,
            senderImage: messageModel.senderImage.toString(),
            receiverID: receiverId,
          ));
        })
        .then((value) => FirebaseFirestore.instance
            .collection("chatsCollection")
            .doc(receiverId)
            .collection("recentChats")
            .doc(senderId)
            .set(chatDetailsModel.toJson(
                senderID: receiverId,
                receiverID: senderId,
                messageSenderName: chatDetailsModel.receiverName.toString(),
                messageReceiverName: chatDetailsModel.senderName.toString(),
                messageSenderImage: chatDetailsModel.receiverImage.toString(),
                messageReceiverImage: chatDetailsModel.senderImage.toString())))
        .then((value) {
          DocumentReference docRef = FirebaseFirestore.instance
              .collection("chatsCollection")
              .doc(receiverId)
              .collection("recentChats")
              .doc(senderId)
              .collection("messages")
              .doc(DateTime.now().toString());
          return docRef.set(messageModel.toJson(
            messageID: docRef.id,
            senderID: senderId,
            senderImage: messageModel.senderImage.toString(),
            receiverID: receiverId,
          ));
        });
  }

//fetch recent chats
  Stream<List<ChatDetailsModel>> fetchRecentChats({required String senderId}) {
    return FirebaseFirestore.instance
        .collection("chatsCollection")
        .doc(senderId)
        .collection("recentChats")
        .orderBy("sortTime", descending: true)
        .snapshots()
        .map((chatUsersList) => chatUsersList.docs
            .map((singleChatUser) =>
                ChatDetailsModel.fromJson(singleChatUser.data()))
            .toList());
  }

// fetch messages
  Stream<List<MessageModel>> fetchMessages(
      {required String senderId, required String receiverId}) {
    return FirebaseFirestore.instance
        .collection("chatsCollection")
        .doc(senderId)
        .collection("recentChats")
        .doc(receiverId)
        .collection("messages")
        .snapshots()
        .map((messagesList) => messagesList.docs
            .map((message) => MessageModel.fromJson(message.data()))
            .toList());
  }

// fetch unread messages
  Stream<List<MessageModel>> fetchUnReadMessages(
      {required String senderId, required String receiverId}) {
    return FirebaseFirestore.instance
        .collection("chatsCollection")
        .doc(senderId)
        .collection("recentChats")
        .doc(receiverId)
        .collection("messages")
        .where("receiverId", isEqualTo: receiverId)
        .where("isRead", isEqualTo: false)
        .snapshots()
        .map((messagesList) => messagesList.docs
            .map((message) => MessageModel.fromJson(message.data()))
            .toList());
  }

// mark message as read
  Future<void> markMessageAsRead(
      {required String messageId,
      required String senderId,
      required String receiverId}) async {
    return await FirebaseFirestore.instance
        .collection("chatsCollection")
        .doc(senderId)
        .collection("recentChats")
        .doc(receiverId)
        .collection("messages")
        .doc(messageId)
        .update({"isRead": true});
  }
}

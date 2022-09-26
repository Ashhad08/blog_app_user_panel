import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../backend/models/message_details.dart';
import '../../../../backend/models/message_model.dart';
import '../../../../backend/models/user_model.dart';
import '../../../../backend/services/chat.dart';
import '../../../../backend/services/system.dart';
import '../../../../configurations/front_end.dart';
import 'widgets/message_bubble.dart';

class ChatViewBody extends StatelessWidget {
  final dynamic receiverData;
  final String receiverImage;

  ChatViewBody(
      {Key? key, required this.receiverData, required this.receiverImage})
      : super(key: key);

  final TextEditingController _messageController = TextEditingController();
  final String _senderId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamProvider.value(
            value: ChatServices().fetchMessages(
              senderId: _senderId,
              receiverId: receiverData["receiverUid"],
            ),
            initialData: [MessageModel()],
            builder: (context, child) {
              List<MessageModel> allMessages =
                  context.watch<List<MessageModel>>();
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: allMessages.length,
                  itemBuilder: (context, index) {
                    return MessageBubble(
                        isSentByMe: allMessages[index].senderId == _senderId,
                        message: allMessages[index].messageBody ?? '',
                        senderImagePath: allMessages[index].senderImage ==
                                "null"
                            ? 'https://i.pinimg.com/originals/f9/11/d3/f911d38579709636499618b6b3d9b6f6.jpg'
                            : allMessages[index].senderImage ??
                                'https://i.pinimg.com/originals/f9/11/d3/f911d38579709636499618b6b3d9b6f6.jpg',
                        receiverImagePath: receiverImage);
                  });
            },
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          color: FrontEndConfigs.kWhiteColor,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: TextField(
                controller: _messageController,
                style: FrontEndConfigs.kTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff707070),
                ),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none),
                    hintText: 'Write your message here',
                    hintStyle: FrontEndConfigs.kTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff707070),
                    ),
                    filled: true,
                    fillColor: const Color(0xffF2F2F2)),
              )),
              const SizedBox(
                width: 8,
              ),
              const SizedBox(
                width: 10,
              ),
              StreamProvider.value(
                value: SystemServices().fetchUserInfo(),
                initialData: UserModel(),
                builder: (context, child) {
                  UserModel currentUser = context.watch<UserModel>();
                  return GestureDetector(
                    onTap: () {
                      if (_messageController.text.isNotEmpty) {
                        Future.delayed(const Duration(microseconds: 20), () {
                          _messageController.clear();
                        });
                        ChatServices()
                            .addNewMessage(
                                senderId: currentUser.uid ?? '',
                                receiverId: receiverData["receiverUid"],
                                chatDetailsModel: ChatDetailsModel(
                                  recentMessage: _messageController.text,
                                  date: DateFormat('MM/dd/yyyy')
                                      .format(Timestamp.now().toDate()),
                                  time: DateFormat('hh:mm a')
                                      .format(Timestamp.now().toDate()),
                                  senderName: currentUser.name ?? '',
                                  senderImage: currentUser.profileImage,
                                  receiverName: receiverData["receiverName"],
                                  receiverImage:
                                      receiverData["receiverProfileImage"],
                                ),
                                messageModel: MessageModel(
                                  senderImage: currentUser.profileImage,
                                  time: DateFormat('MM/dd/yyyy hh:mm a')
                                      .format(Timestamp.now().toDate()),
                                  messageBody: _messageController.text,
                                ))
                            .onError((error, stackTrace) {
                          debugPrint(error.toString());
                        });
                      }
                    },
                    child: Container(
                        height: 45,
                        width: 45,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xff031199).withOpacity(0.3),
                        ),
                        child: const Icon(
                          Icons.send,
                          size: 25,
                          color: FrontEndConfigs.kPrimaryColor,
                        )),
                  );
                },
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

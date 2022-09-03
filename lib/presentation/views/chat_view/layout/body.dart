import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../../configurations/front_end.dart';
import 'widgets/message_bubble.dart';
import 'widgets/message_model.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({Key? key}) : super(key: key);

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  List<MessageModel> allMessagesList = [
    MessageModel(
        text: "Hello!",
        date: DateTime.now().subtract(const Duration(minutes: 6)),
        senderImagePath: 'assets/images/chat_user.png',
        receiverImagePath: 'assets/images/chat_user.png',
        isSentByMe: false),
    MessageModel(
        text: "Hey there!",
        senderImagePath: 'assets/images/chat_user.png',
        receiverImagePath: 'assets/images/chat_user.png',
        date: DateTime.now().subtract(const Duration(minutes: 5)),
        isSentByMe: true),
    MessageModel(
        text: "How are you.",
        senderImagePath: 'assets/images/chat_user.png',
        receiverImagePath: 'assets/images/chat_user.png',
        date: DateTime.now().subtract(const Duration(minutes: 4)),
        isSentByMe: false),
    MessageModel(
        text: "Im doing good",
        senderImagePath: 'assets/images/chat_user.png',
        receiverImagePath: 'assets/images/chat_user.png',
        date: DateTime.now().subtract(const Duration(minutes: 3)),
        isSentByMe: true),
    MessageModel(
        text: "What about you?",
        senderImagePath: 'assets/images/chat_user.png',
        receiverImagePath: 'assets/images/chat_user.png',
        date: DateTime.now().subtract(const Duration(minutes: 2)),
        isSentByMe: false),
    MessageModel(
        text: "I just heard something",
        senderImagePath: 'assets/images/chat_user.png',
        receiverImagePath: 'assets/images/chat_user.png',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true),
    MessageModel(
        text: "And what’s that?",
        senderImagePath: 'assets/images/chat_user.png',
        receiverImagePath: 'assets/images/chat_user.png',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true),
  ];

  String message = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        backgroundColor: FrontEndConfigs.kScaffoldColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.795,
                child: Column(
                  children: [
                    Expanded(
                      child: GroupedListView<MessageModel, DateTime>(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        reverse: true,
                        order: GroupedListOrder.DESC,
                        groupHeaderBuilder: (MessageModel message) =>
                            const SizedBox(),
                        groupBy: (element) => DateTime(element.date.year,
                            element.date.month, element.date.day),
                        elements: allMessagesList,
                        itemBuilder: (context, MessageModel messageModel) =>
                            MessageBubble(
                                isSentByMe: messageModel.isSentByMe,
                                senderImagePath: messageModel.senderImagePath,
                                receiverImagePath:
                                    messageModel.receiverImagePath,
                                message: messageModel.text),
                      ),
                    ),
                  ],
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
                      cursorHeight: 25,
                      style: FrontEndConfigs.kTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff707070),
                      ),
                      onChanged: (val) {
                        message = val.toString();
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none),
                          hintText: 'Write your message here',
                          hintStyle: FrontEndConfigs.kTextStyle.copyWith(
                            fontSize: 10,
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
                    GestureDetector(
                      onTap: () {
                        final myMessage = MessageModel(
                            text: message,
                            date: DateTime.now(),
                            isSentByMe: true,
                            senderImagePath: 'assets/images/chat_user.png',
                            receiverImagePath: 'assets/images/chat_user.png');
                        allMessagesList.add(myMessage);
                        setState(() {});
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
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

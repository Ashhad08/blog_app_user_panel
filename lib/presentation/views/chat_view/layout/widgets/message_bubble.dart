import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/custom_text.dart';
import 'user_image_avatar.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key? key,
    required this.isSentByMe,
    required this.message,
    required this.senderImagePath,
    required this.receiverImagePath,
  }) : super(key: key);
  final String message;
  final String senderImagePath;
  final String receiverImagePath;
  final bool isSentByMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment:
            isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          isSentByMe ? const Spacer() : const SizedBox(),
          const SizedBox(
            width: 16,
          ),
          isSentByMe
              ? const SizedBox()
              : UserImageAvatar(
                  height: 32,
                  imagePath: receiverImagePath,
                ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(
                  right: 30, left: 20, top: 10, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: isSentByMe
                      ? FrontEndConfigs.kSendingChatBubbleColor
                      : FrontEndConfigs.kReceivingChatBubbleColor),
              child: CustomText(
                text: message,
                fontSize: 12,
                maxLines: 20,
                fontWeight: FontWeight.w400,
                textColor: FrontEndConfigs.kWhiteColor,
              ),
            ),
          ),
          isSentByMe
              ? const SizedBox(
                  width: 12,
                )
              : const SizedBox(),
          isSentByMe
              ? UserImageAvatar(
                  height: 32,
                  imagePath: senderImagePath,
                )
              : const SizedBox(),
          const SizedBox(
            width: 16,
          ),
          isSentByMe ? const SizedBox() : const Spacer()
        ],
      ),
    );
  }
}

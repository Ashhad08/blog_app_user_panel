import 'package:flutter/material.dart';

import '../../elements/custom_text.dart';
import 'layout/body.dart';
import 'layout/widgets/user_image_avatar.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: const [
            UserImageAvatar(
              height: 35,
              imagePath: 'assets/images/chat_user.png',
            ),
            Spacer(
              flex: 1,
            ),
            CustomText(
                text: 'UserName', fontSize: 14, fontWeight: FontWeight.bold),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
      body: const ChatViewBody(),
    );
  }
}

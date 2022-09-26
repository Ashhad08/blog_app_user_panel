import 'package:flutter/material.dart';

import '../../../configurations/front_end.dart';
import '../../elements/custom_text.dart';
import 'layout/body.dart';
import 'layout/widgets/user_image_avatar.dart';

class ChatView extends StatelessWidget {
  const ChatView(this._userData, {Key? key}) : super(key: key);
  final dynamic _userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldColor,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            UserImageAvatar(
              height: 35,
              imagePath: _userData["receiverProfileImage"] ??
                  'https://i.pinimg.com/originals/f9/11/d3/f911d38579709636499618b6b3d9b6f6.jpg',
            ),
            const Spacer(
              flex: 1,
            ),
            CustomText(
                text: _userData["receiverName"] ?? 'username',
                fontSize: 14,
                fontWeight: FontWeight.bold),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
      body: ChatViewBody(
        receiverData: _userData,
        receiverImage: _userData["receiverProfileImage"] ??
            'https://i.pinimg.com/originals/f9/11/d3/f911d38579709636499618b6b3d9b6f6.jpg',
      ),
    );
  }
}

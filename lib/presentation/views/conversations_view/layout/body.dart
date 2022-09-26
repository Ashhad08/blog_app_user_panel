import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../backend/models/message_details.dart';
import '../../../../backend/services/chat.dart';
import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';
import '../../../routes/route_names.dart';
import 'widgets/conversation_tile.dart';

class ConversationsViewBody extends StatelessWidget {
  ConversationsViewBody({Key? key}) : super(key: key);
  final String senderId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: ChatServices().fetchRecentChats(senderId: senderId),
        initialData: [ChatDetailsModel()],
        builder: (context, child) {
          List<ChatDetailsModel> recentChats =
              context.watch<List<ChatDetailsModel>>();
          if (recentChats.isEmpty) {
            return const Center(
              child: CustomText(
                text: 'NO Recent Conversations',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textColor: FrontEndConfigs.kPrimaryColor,
              ),
            );
          } else {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: recentChats.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  try {
                    return ConversationTile(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.chatViewRoute,
                            arguments: {
                              "receiverUid": recentChats[index].receiverId,
                              "receiverName": recentChats[index].receiverName,
                              "receiverProfileImage":
                                  recentChats[index].receiverImage
                            });
                      },
                      recentMessage: recentChats[index].recentMessage ?? '',
                      userImage: recentChats[index].receiverImage ??
                          'https://i.pinimg.com/originals/f9/11/d3/f911d38579709636499618b6b3d9b6f6.jpg',
                      username: recentChats[index].receiverName ?? 'username',
                      time: recentChats[index].time ?? '',
                    );
                  } catch (e) {
                    debugPrint(e.toString());
                    return const SizedBox();
                  }
                });
          }
        });
  }
}

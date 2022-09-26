import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../elements/custom_text.dart';

class ConversationTile extends StatelessWidget {
  const ConversationTile({
    Key? key,
    required this.onTap,
    required this.userImage,
    required this.username,
    required this.recentMessage,
    required this.time,
  }) : super(key: key);
  final VoidCallback onTap;
  final String userImage;
  final String username;
  final String recentMessage;
  final String time;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: userImage,
          height: 64,
          width: 64,
          imageBuilder: (context, imageProvider) {
            return Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(fit: BoxFit.cover, image: imageProvider),
              ),
            );
          },
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child:
                  CircularProgressIndicator(value: downloadProgress.progress)),
          errorWidget: (context, url, error) {
            return Image.asset(
              'assets/images/profile.png',
            );
          }),
      title:
          CustomText(text: username, fontSize: 12, fontWeight: FontWeight.bold),
      subtitle: CustomText(
          text: recentMessage,
          fontSize: 12,
          textColor: const Color(0xff838383),
          fontWeight: FontWeight.w400),
      trailing: CustomText(
        text: time,
        fontSize: 10,
        textColor: const Color(0xff838383),
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

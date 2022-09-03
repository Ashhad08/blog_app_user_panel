import 'package:flutter/material.dart';

import '../../../../elements/custom_text.dart';

class ConversationTile extends StatelessWidget {
  const ConversationTile({
    Key? key, required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        height: 64,
        width: 64,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/chat_user.png'),
          ),
        ),
      ),
      title: const CustomText(
          text: 'Username', fontSize: 12, fontWeight: FontWeight.bold),
      subtitle: const CustomText(
          text: 'Hello, are you there?',
          fontSize: 12,
          textColor: Color(0xff838383),
          fontWeight: FontWeight.w400),
      trailing: const CustomText(
        text: '12:30 pm',
        fontSize: 10,
        textColor: Color(0xff838383),
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

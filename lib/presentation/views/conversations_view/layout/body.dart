import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import 'widgets/conversation_tile.dart';

class ConversationsViewBody extends StatelessWidget {
  const ConversationsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kWhiteColor,
      body: Column(
        children: const [
          SizedBox(
            height: 10,
          ),
          ConversationTile(),
          ConversationTile(),
          ConversationTile(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../configurations/front_end.dart';
import '../../elements/custom_text.dart';
import '../../routes/route_names.dart';
import 'layout/body.dart';

class ConversationsView extends StatelessWidget {
  const ConversationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kWhiteColor,
      appBar: AppBar(
        elevation: 0,
        title: const CustomText(
          text: 'Conversations',
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ConversationsViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.createNewChatViewRoute);
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}

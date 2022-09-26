import 'package:flutter/material.dart';

import '../../../configurations/front_end.dart';
import '../../elements/custom_text.dart';
import 'layout/body.dart';

class CreateNewChatView extends StatelessWidget {
  const CreateNewChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldDefaultColor,
      appBar: AppBar(
        elevation: 0,
        title: const CustomText(
          text: 'Want to Chat, Search Here',
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: const CreateNewChatViewBody(),
    );
  }
}

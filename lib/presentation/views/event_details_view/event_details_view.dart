import 'package:flutter/material.dart';

import '../../elements/custom_text.dart';
import 'layout/body.dart';

class EventDetailsView extends StatelessWidget {
  const EventDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
            text: 'Event Details', fontSize: 14, fontWeight: FontWeight.bold),
        actions: [
          IconButton(
            splashRadius: 25,
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: 25,
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: const EventDetailsViewBody(),
    );
  }
}

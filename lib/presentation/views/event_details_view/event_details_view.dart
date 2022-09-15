import 'package:blog_app_user_panel/backend/models/event_model.dart';
import 'package:flutter/material.dart';

import '../../../configurations/front_end.dart';
import '../../elements/custom_text.dart';
import 'layout/body.dart';

class EventDetailsView extends StatelessWidget {
  const EventDetailsView(this._eventModel, {Key? key}) : super(key: key);
  final EventModel _eventModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldDefaultColor,
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
      body: EventDetailsViewBody(_eventModel),
    );
  }
}

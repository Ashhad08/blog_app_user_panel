import 'package:flutter/material.dart';

import '../../elements/app_drawer.dart';
import '../../elements/custom_text.dart';
import 'layout/body.dart';

class EventsView extends StatelessWidget {
  const EventsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
            text: 'Events', fontSize: 14, fontWeight: FontWeight.bold),
      ),
      drawer: const AppDrawer(),
      body: const EventsViewBody(),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';

class EventImagesCard extends StatelessWidget {
  const EventImagesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 146,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/event_gallery.png',
            ),
          ),
          boxShadow: [
            BoxShadow(
                color: FrontEndConfigs.kBlackColor.withOpacity(0.16),
                offset: const Offset(0, 1),
                spreadRadius: 0.5,
                blurRadius: 5)
          ]),
    );
  }
}

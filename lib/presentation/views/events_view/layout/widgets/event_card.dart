import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/custom_text.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
  }) : super(key: key);

  final String title;
  final String description;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 146,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.only(top: 13, left: 11, bottom: 18, right: 35),
      decoration: BoxDecoration(
          color: FrontEndConfigs.kWhiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: FrontEndConfigs.kBlackColor.withOpacity(0.16),
                offset: const Offset(0, 1),
                spreadRadius: 0.5,
                blurRadius: 5)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: title, fontSize: 18, fontWeight: FontWeight.w400),
          const SizedBox(
            height: 8,
          ),
          CustomText(
              text: description,
              fontSize: 8,
              maxLines: 3,
              fontWeight: FontWeight.w400),
          const Spacer(),
          Row(
            children: [
              const Icon(
                Icons.calendar_month,
                size: 15,
                color: FrontEndConfigs.kSubText2Color,
              ),
              const SizedBox(
                width: 7,
              ),
              CustomText(text: date, fontSize: 8, fontWeight: FontWeight.w400),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: const [
              Icon(
                Icons.calendar_month,
                size: 15,
                color: FrontEndConfigs.kSubText2Color,
              ),
              SizedBox(
                width: 7,
              ),
              CustomText(
                  text: '12:00pm', fontSize: 8, fontWeight: FontWeight.w400),
            ],
          ),
        ],
      ),
    );
  }
}

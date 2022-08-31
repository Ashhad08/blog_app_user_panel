import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/custom_text.dart';

class SpotlightUserCard extends StatelessWidget {
  const SpotlightUserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
      padding: const EdgeInsets.only(
        left: 10,
        top: 20,
        right: 50,
        bottom: 20,
      ),
      decoration: BoxDecoration(
          color: FrontEndConfigs.kWhiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: FrontEndConfigs.kBlackColor.withOpacity(0.16),
                offset: const Offset(0, 1),
                spreadRadius: 0.5,
                blurRadius: 3)
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/spotlight.png',
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomText(
                    text: 'TaJohn', fontSize: 14, fontWeight: FontWeight.w500),
                CustomText(
                    text: '12th GRADER',
                    fontSize: 12,
                    textColor: FrontEndConfigs.kSubText2Color,
                    fontWeight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                    text:
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magnaaliquyam erat, sed diam voluptua. At',
                    fontSize: 10,
                    maxLines: 4,
                    textColor: FrontEndConfigs.kSubText2Color,
                    fontWeight: FontWeight.w300),
              ],
            ),
          )
        ],
      ),
    );
  }
}

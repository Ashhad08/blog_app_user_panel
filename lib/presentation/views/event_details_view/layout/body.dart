import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';
import 'widgets/event_images_card.dart';

class EventDetailsViewBody extends StatelessWidget {
  const EventDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldDefaultColor,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              'assets/images/program1.png',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              flex: 7,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 16,
                        right: 25,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CustomText(
                              text: 'Thursday, August 26, 2020 11:30 pm',
                              fontSize: 14,
                              textColor: Color(0xff9D9D9D),
                              fontWeight: FontWeight.w600),
                          SizedBox(
                            height: 13,
                          ),
                          CustomText(
                              text: 'Event Title',
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                          SizedBox(
                            height: 15,
                          ),
                          CustomText(
                              text:
                                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem.',
                              fontSize: 12,
                              maxLines: 7,
                              textColor: Color(0xff6A6A6A),
                              fontWeight: FontWeight.w400),
                          SizedBox(
                            height: 15,
                          ),
                          CustomText(
                              text: 'Event Gallery',
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                          SizedBox(
                            height: 14,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 144,
                      child: ListView.builder(
                          itemCount: 4,
                          padding: const EdgeInsets.only(left: 16),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return const EventImagesCard();
                          }),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

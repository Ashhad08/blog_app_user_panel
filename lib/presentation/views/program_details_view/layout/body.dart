import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';

class ProgramDetailsViewBody extends StatelessWidget {
  const ProgramDetailsViewBody({Key? key}) : super(key: key);

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
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, top: 16, right: 25, bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                          text: 'Thursday, August 26, 2020 11:30 pm',
                          fontSize: 14,
                          textColor: Color(0xff9D9D9D),
                          fontWeight: FontWeight.w600),
                      const SizedBox(
                        height: 13,
                      ),
                      CustomText(
                          text: 'YOUTH ADVISORY BOARD'.toUpperCase(),
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      const SizedBox(
                        height: 15,
                      ),
                      const CustomText(
                          text:
                              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem.',
                          fontSize: 12,
                          maxLines: 15,
                          textColor: Color(0xff6A6A6A),
                          fontWeight: FontWeight.w400),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

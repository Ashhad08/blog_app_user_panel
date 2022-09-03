import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/custom_text.dart';

class ProgramCard extends StatelessWidget {
  const ProgramCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/program1.png',
          height: 190,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Container(
          decoration:
              BoxDecoration(color: FrontEndConfigs.kWhiteColor, boxShadow: [
            BoxShadow(
                color: FrontEndConfigs.kBlackColor.withOpacity(0.16),
                offset: Offset(0, 1),
                spreadRadius: 0.5,
                blurRadius: 5)
          ]),
          margin: const EdgeInsets.only(bottom: 7),
          padding:
              const EdgeInsets.only(top: 15, left: 24, bottom: 13, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'YOUTH ADVISORY BOARD'.toUpperCase(),
                fontSize: 12,
                maxLines: 2,
                fontWeight: FontWeight.w600,
                textColor: const Color(0xff6A6A6A),
              ),
              const SizedBox(
                height: 5,
              ),
              const CustomText(
                text: 'elitr, sed diam nonumy eirmod tempor invidunt ut',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textColor: Color(0xff6A6A6A),
              ),
              const SizedBox(
                height: 5,
              ),
              const CustomText(
                text: 'Thursday, August 26, 2020 11:30 pm',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                textColor: Color(0xff9D9D9D),
              ),
            ],
          ),
        )
      ],
    );
  }
}

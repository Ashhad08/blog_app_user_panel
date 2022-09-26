import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/custom_text.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: FrontEndConfigs.kPrimaryColor.withOpacity(0.8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
              text: text,
              fontSize: 16,
              textColor: FrontEndConfigs.kWhiteColor,
              fontWeight: FontWeight.w500),
          const SizedBox(
            height: 10,
          ),
          Icon(
            icon,
            size: 25,
            color: FrontEndConfigs.kWhiteColor,
          )
        ],
      ),
    );
  }
}

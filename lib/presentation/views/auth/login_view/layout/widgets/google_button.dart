import 'package:flutter/material.dart';

import '../../../../../../configurations/front_end.dart';
import '../../../../../elements/custom_text.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: 170,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const Color(0xffD92B2B),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/google.png',
              height: 18,
              width: 28,
            ),
            const SizedBox(
              width: 15,
            ),
            const CustomText(
              text: "Google",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              textColor: FrontEndConfigs.kWhiteColor,
            ),
          ],
        ),
      ),
    );
  }
}

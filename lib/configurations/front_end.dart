import 'package:flutter/material.dart';

import '../presentation/elements/custom_text.dart';

class FrontEndConfigs {
  static const Color kPrimaryColor = Color(0xff2A38C1);
  static const Color kBorderColor = Color(0xff031199);
  static const Color kScaffoldColor = Color(0xffF8F8F8);
  static const Color kScaffoldDefaultColor = Color(0xffFAFAFA);
  static const Color kUserTextFieldColor = Color(0xff818181);
  static const Color kBlackColor = Color(0xff262525);
  static const Color kWhiteColor = Colors.white;
  static const Color kSubTextColor = Color(0xff959595);
  static const Color kSubText2Color = Color(0xff989898);
  static const Color kDrawerOptionsColor = Color(0xff6F6D6D);
  static const Color kSecondaryColor = Color(0xff3F526F);
  static const Color kSendingChatBubbleColor = Color(0xff96A0FF);
  static const TextStyle kTextStyle = TextStyle(
      fontFamily: "Poppins",
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: kBlackColor);

  static showSnackBar({
    required BuildContext context,
    required String message,
    required Color color,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: color,
        duration: const Duration(seconds: 2),
        content: CustomText(
          text: message,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          textColor: FrontEndConfigs.kWhiteColor,
        )));
  }
}

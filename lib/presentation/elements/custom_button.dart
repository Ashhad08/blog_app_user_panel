import 'package:flutter/material.dart';

import '../../configurations/front_end.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.height,
    required this.width,
    required this.onPressed,
  }) : super(key: key);
  final String buttonText;
  final double height;
  final double width;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                    color: FrontEndConfigs.kBorderColor, width: 0.5))),
        onPressed: onPressed,
        child: CustomText(
          text: buttonText,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          textColor: FrontEndConfigs.kWhiteColor,
        ),
      ),
    );
  }
}

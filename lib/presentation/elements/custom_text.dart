import 'package:flutter/material.dart';

import '../../configurations/front_end.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? textColor;
  final TextAlign? align;
  final int? maxLines;

  const CustomText(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      this.textColor = FrontEndConfigs.kBlackColor,
      this.align = TextAlign.start,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: "Poppins",
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor),
      textAlign: align,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

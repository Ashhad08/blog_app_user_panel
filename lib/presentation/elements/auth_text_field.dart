import 'package:flutter/material.dart';

import '../../configurations/front_end.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {Key? key,
      required this.hintText,
      required this.prefixIcon,
      required this.isPasswordField,
      this.textInputType = TextInputType.text})
      : super(key: key);
  final String hintText;
  final IconData prefixIcon;
  final bool isPasswordField;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: isPasswordField,
      style: FrontEndConfigs.kTextStyle.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: FrontEndConfigs.kUserTextFieldColor),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 15),
        prefixIcon: Icon(
          prefixIcon,
          size: 20,
          color: FrontEndConfigs.kUserTextFieldColor,
        ),
        hintText: hintText,
        hintStyle: FrontEndConfigs.kTextStyle.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: FrontEndConfigs.kUserTextFieldColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0.2,
            color: FrontEndConfigs.kBorderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0.2,
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0.2,
            color: FrontEndConfigs.kBorderColor,
          ),
        ),
      ),
    );
  }
}

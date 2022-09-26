import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';

class ProfileViewTextField extends StatelessWidget {
  const ProfileViewTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
  }) : super(key: key);
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: FrontEndConfigs.kTextStyle.copyWith(
          color: const Color(0xffB9B9B9),
          fontSize: 14,
          fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffB9B9B9),
            ),
          ),
          hintText: hintText,
          hintStyle: FrontEndConfigs.kTextStyle.copyWith(
              color: const Color(0xffB9B9B9),
              fontSize: 14,
              fontWeight: FontWeight.bold),
          prefixIconColor: const Color(0xffB9B9B9),
          prefixIcon: Icon(
            prefixIcon,
            color: const Color(0xffB9B9B9),
          )),
    );
  }
}

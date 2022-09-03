import 'package:flutter/material.dart';

class UserImageAvatar extends StatelessWidget {
  const UserImageAvatar({
    Key? key,
    required this.height,
    required this.imagePath,
  }) : super(key: key);
  final double height;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}

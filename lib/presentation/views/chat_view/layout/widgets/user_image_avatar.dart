import 'package:cached_network_image/cached_network_image.dart';
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
    return CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imagePath,
        height: height,
        width: height,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: height,
            width: height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(fit: BoxFit.cover, image: imageProvider),
            ),
          );
        },
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                child: CircularProgressIndicator(
              value: downloadProgress.progress,
              strokeWidth: 1,
            )),
        errorWidget: (context, url, error) {
          return const Icon(
            Icons.error_outline,
            color: Colors.red,
          );
        });
  }
}

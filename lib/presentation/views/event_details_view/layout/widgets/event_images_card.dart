import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';

class EventImagesCard extends StatelessWidget {
  const EventImagesCard({
    Key? key,
    required this.imagePath,
  }) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: FrontEndConfigs.kBlackColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imagePath,
          width: 146,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child:
                  CircularProgressIndicator(value: downloadProgress.progress)),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: Colors.red,
            size: 20,
          ),
        ),
      ),
    );
  }
}

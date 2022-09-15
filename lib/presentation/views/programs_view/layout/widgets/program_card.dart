import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/custom_text.dart';

class ProgramCard extends StatelessWidget {
  const ProgramCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.date,
  }) : super(key: key);
  final String imagePath;
  final String title;
  final String description;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        imagePath.isEmpty
            ? Image.asset(
                'assets/images/program1.png',
                height: 190,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                height: 190,
                fit: BoxFit.cover,
                width: double.infinity,
                imageUrl: imagePath,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 20,
                ),
              ),
        Container(
          width: double.infinity,
          decoration:
              BoxDecoration(color: FrontEndConfigs.kWhiteColor, boxShadow: [
            BoxShadow(
                color: FrontEndConfigs.kBlackColor.withOpacity(0.16),
                offset: const Offset(0, 1),
                spreadRadius: 0.5,
                blurRadius: 5)
          ]),
          margin: const EdgeInsets.only(bottom: 7),
          padding:
              const EdgeInsets.only(top: 15, left: 24, bottom: 13, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title.toUpperCase(),
                fontSize: 12,
                maxLines: 2,
                fontWeight: FontWeight.w600,
                textColor: const Color(0xff6A6A6A),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomText(
                text: description,
                fontSize: 14,
                maxLines: 2,
                fontWeight: FontWeight.w400,
                textColor: const Color(0xff6A6A6A),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomText(
                text: date,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                textColor: const Color(0xff9D9D9D),
              ),
            ],
          ),
        )
      ],
    );
  }
}

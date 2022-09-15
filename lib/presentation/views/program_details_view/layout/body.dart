import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../backend/models/program_model.dart';
import '../../../elements/custom_text.dart';

class ProgramDetailsViewBody extends StatelessWidget {
  final ProgramModel _programDetails;

  const ProgramDetailsViewBody(this._programDetails, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: double.infinity,
              imageUrl: _programDetails.programImage ??
                  'https://i.pinimg.com/originals/f9/11/d3/f911d38579709636499618b6b3d9b6f6.jpg',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
                size: 20,
              ),
            )),
        Expanded(
            flex: 7,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 16, right: 25, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: _programDetails.programDate ?? '',
                        fontSize: 14,
                        textColor: const Color(0xff9D9D9D),
                        fontWeight: FontWeight.w600),
                    const SizedBox(
                      height: 13,
                    ),
                    CustomText(
                        text: _programDetails.programTitle ?? ''.toUpperCase(),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomText(
                        text: _programDetails.programDescription ?? '',
                        fontSize: 12,
                        maxLines: 15,
                        textColor: const Color(0xff6A6A6A),
                        fontWeight: FontWeight.w400),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
